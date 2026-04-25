# Setting up Fedora Silverblue
------------------------------
## 🚀 Fedora Silverblue Java Dev Setup## 1. Core System Preparation
Silverblue is immutable. We keep the base system clean by using Flatpaks for GUI tools and Containers for development.
## Update and Install Basics

# Ensure the system is up to date
rpm-ostree update
# Reboot if updates were installed
systemctl reboot

## Enable Flathub

flatpak remote-add --if-not-exists flathub https://flathub.org

------------------------------
## 2. Install Essential Tools (Flatpak)
We install VS Code and Neovim as Flatpaks to avoid layering packages onto the OS-tree.

# Install VS Code
flatpak install flathub com.visualstudio.code
# Install Neovim
flatpak install flathub io.neovim.nvim
# Install Flatseal (to manage permissions)
flatpak install flathub com.github.tchx84.Flatseal

## 🔧 Configure Permissions (Crucial)

   1. Open Flatseal.
   2. Select Visual Studio Code.
   3. Enable All system files (or System Bus) to allow it to communicate with the Podman socket.
   4. (Optional) Do the same for Neovim if you plan to use it to edit files across the system.

------------------------------
## 3. Configure VS Code for Podman
Since Silverblue uses Podman instead of Docker, you must tell VS Code where to find it.

   1. Open VS Code.
   2. Install the Dev Containers extension (ms-vscode-remote.remote-containers).
   3. Open Settings (Ctrl + ,) and set:
   * Dev Containers: Docker Path: podman
      * Dev Containers: Execute In Container Process: true
   
------------------------------
## 4. The Spring Boot Dev Container
Create a folder named .devcontainer in your project root and add this devcontainer.json. This setup includes Java 21, Maven, and the REST Client.
## project-root/.devcontainer/devcontainer.json

{
  "name": "Spring Boot Dev Environment",
  "image": "://microsoft.com",
  "features": {
    "ghcr.io/devcontainers/features/java:1": {
      "installMaven": "true"
    }
  },
  "customizations": {
    "vscode": {
      "extensions": [
        "vscjava.vscode-java-pack",
        "vscjava.vscode-spring-initializr",
        "vscjava.vscode-spring-boot-dashboard",
        "humao.rest-client",
        "vscodevim.vim"
      ],
      "settings": {
        "java.configuration.runtimes": [
          {
            "name": "JavaSE-21",
            "path": "/usr/local/sdkman/candidates/java/current",
            "default": true
          }
        ]
      }
    }
  },
  "forwardPorts": [8080],
  "remoteUser": "vscode",
  "postCreateCommand": "mvn clean install"
}

------------------------------
## 5. Terminal Access & Workflow
Once you click "Reopen in Container" in VS Code, the environment is live.
## How to enter the container from your Host Terminal
Since you are on Silverblue, you might want to use your host terminal to jump into the active container:

# Add this to your ~/.bashrc or ~/.zshrc
alias dce='podman exec -it $(podman ps --format "{{.Names}}" | grep vsc- | head -n 1) /bin/bash'

## Why this is better than Distrobox?

* Isolation: Every project has its own Java version.
* Portability: The config stays with your code in Git.
* Automation: VS Code handles the container lifecycle (Start/Stop) automatically.

------------------------------
## 💡 Quick Tips for Silverblue Users

* Persistence: Your code is "bind-mounted." Changes in the container save to your host disk immediately.
* First Run: The first build takes time (downloading images/JDKs). Subsequent starts are nearly instant due to Podman caching.
* Cleaning Up: Use podman system prune occasionally to remove old project images and save space on your Silverblue drive.

------------------------------