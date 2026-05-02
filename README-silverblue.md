## 🚀 Fedora Silverblue: VS Code + Podman Setup Guide

This guide focuses on the "Native Layering" approach. By installing VS Code and the Podman-Docker shim via `rpm-ostree`, you eliminate the permission headaches caused by Flatpak sandboxing.

---

### 1. Install VS Code and Podman Shim
Layering these packages ensures that VS Code has direct access to the Podman socket and the system-level container tools.

```bash
# 1. Import Microsoft's GPG Key
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

# 2. Add the official VS Code Repository
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo

# 3. Install VS Code and the Podman-Docker helper (shim)
# This shim allows VS Code to use 'podman' when it looks for 'docker'
sudo rpm-ostree install code podman-docker neovim

ln -s ~/repos/dotfiles/config/nvim/ ~/.config/
rm -rf ~/.config/Code/User/keybindings.json
rm -rf ~/.config/Code/User/settings.json
ln -s ~/repos/dotfiles/config/vscode/keybindings.json ~/.config/Code/User/keybindings.json
ln -s ~/repos/dotfiles/config/vscode/settings.json ~/.config/Code/User/settings.json

# 4. REBOOT (Required to apply system layers on Silverblue)
systemctl reboot
```

---

### 2. Enable the Communication Bridge
After rebooting, you must activate the user-level socket. Without this, VS Code cannot "talk" to the Podman engine.

```bash
# 1. Start and enable the Podman socket for your user
systemctl --user enable --now podman.socket

# 2. Verify the socket is active (Should say 'active (listening)')
systemctl --user status podman.socket

# 3. CRITICAL: Create the Maven cache folder on your host
# If this folder is missing, the Dev Container will fail to start.
mkdir -p ~/.m2
```

---

### 3. VS Code Internal Configuration
Open VS Code and adjust these specific settings to ensure it routes container commands to Podman instead of Docker.

1.  **Install Required Extensions:**
    * **Dev Containers** (Microsoft)
    * **Extension Pack for Java** (Microsoft)
2.  **Open Settings (`Ctrl + ,`):**
    * Search for `Dev > Containers: Docker Path`.
    * Set this to: `podman`
3.  **Disable Docker Compose V2:**
    * Search for `Dev > Containers: Use Docker Compose V2`.
    * **Uncheck** this box (Podman works better with V1 compatibility in VS Code).

---

### 4. Spring Boot Dev Container Config
Create a folder named `.devcontainer` in your Spring Boot project root. Create a file inside it named `devcontainer.json` with this configuration designed for Fedora Silverblue:

```json
{
    "name": "Spring Boot Podman",
    "image": "mcr.microsoft.com/devcontainers/java:21-bullseye",
    
    // Explicitly handle SELinux and Workspace mounting for Silverblue
    "workspaceMount": "source=${localWorkspaceFolder},target=/workspace,type=bind,Z",
    "workspaceFolder": "/workspace",
    "updateRemoteUserUID": false,

    "runArgs": [
        "--userns=keep-id",
        "--security-opt", "label=disable"
    ],

    "containerUser": "vscode",
    "overrideCommand": true,

    "customizations": {
        "vscode": {
            "extensions": [
                "vscjava.vscode-java-pack",
                "vmware.vscode-spring-boot-dashboard",
                "humao.rest-client"
            ]
        }
    },

    "mounts": [
        // Mounts your host Maven cache so you don't re-download dependencies
        "source=${localEnv:HOME}/.m2,target=/home/vscode/.m2,type=bind,Z"
    ],

    "remoteEnv": {
        "DOCKER_HOST": "unix:///run/user/1000/podman/podman.sock"
    }
}
```

---

### Summary Checklist to Start
1.  Ensure `podman.socket` is running.
2.  Open your project in VS Code.
3.  Press `F1` and select **"Dev Containers: Reopen in Container"**.
4.  Run your app via the terminal: `./mvnw spring-boot:run`.