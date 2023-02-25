from typing import List  
import os
import subprocess
from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from libqtile import hook

mod = "mod4"
terminal = "kitty"
# browser = "firefox"
browser = "librewolf"
terminalfilemanager = "thunar"

keys = [
        # Switch between windows
        Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
        Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
        Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
        Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
        Key([mod], "space", lazy.layout.next(),
            desc="Move window focus to other window"),

        # Key([mod, "shift"], "r", lazy.restart()),
        Key([mod, "shift"], "s", lazy.shutdown()),

        # Move windows between left/right columns or move up/down in current stack.
        # Moving out of range in Columns layout will create new column.
        Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
            desc="Move window to the left"),
        Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
            desc="Move window to the right"),
        Key([mod, "shift"], "j", lazy.layout.shuffle_down(),
            desc="Move window down"),
        Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

        # Grow windows. If current window is on the edge of screen and direction
        # will be to screen edge - window would shrink.
        Key([mod, "control"], "h", lazy.layout.grow_left(),
            desc="Grow window to the left"),
        Key([mod, "control"], "l", lazy.layout.grow_right(),
            desc="Grow window to the right"),
        Key([mod, "control"], "j", lazy.layout.grow_down(),
            desc="Grow window down"),
        Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
        Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

        # Toggle between split and unsplit sides of stack.
        # Split = all windows displayed
        # Unsplit = 1 window displayed, like Max layout, but still with
        # multiple stack panes
        Key([mod, "shift"], "Return", lazy.layout.toggle_split(),
            desc="Toggle between split and unsplit sides of stack"),
        # Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),

        # Toggle between different layouts as defined below
        Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
        Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),

        Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
        Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
        Key([mod], "r", lazy.spawncmd(),
            desc="Spawn a command using a prompt widget"),

        # Sound
        

        # Custom key bindings

        Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
        Key([mod], "b", lazy.spawn(browser)),
        Key([mod], "o", lazy.spawn("firefox")),
        Key([mod], "p", lazy.spawn(terminalfilemanager)),
        Key([mod], "n", lazy.spawn("nitrogen")),
        Key([mod], "f", lazy.spawn(terminal + " -e ranger")),

        # rofi
        Key([mod], "r", lazy.spawn("rofi -show combi")),
        Key([mod], "z", lazy.spawn("rofi -show window")),
        Key([mod], "x", lazy.spawn("rofi -show drun")),

]

groups = [Group(i) for i in "12345"]

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i.name)),
        ])

layout_theme = {"border_width": 2,
        "margin": 6,
        "border_focus": "b48ead",
        "border_normal": "4c566a"
        }

layouts = [
        layout.MonadTall(**layout_theme),
        layout.Max(**layout_theme),
        layout.Floating(**layout_theme),
        ]

widget_defaults = dict(
        font='UbuntuMono Nerd Font',
        fontsize=19,
        padding=3,
        )
extension_defaults = widget_defaults.copy()

screens = [
        Screen(
            top=bar.Bar(
                [
                    widget.GroupBox(
                        # margin_y = 3,
                        # margin_x = 0,
                        # padding_y = 6,
                        # padding_x = 5,
                        spacing = 20,
                        rounded = False,
                        borderwidth = 0,
                        center_aligned=True,
                        inactive = "5e81ac",
                        active = "b48ead",
                        highlight_method = "line",
                        highlight_color=["2e3440", "2e3440"],
                        background = "#3b4252",
                        foreground = "#eceff4",
                        ),
                    widget.Spacer(
                        bar.STRETCH,
                        background = "#3b4252",
                        ),
                    widget.Systray(                    
                        background = "#3b4252",
                        foreground = "#eceff4",
                        ),
                    widget.Clock(
                        format='%d-%m-%Y %a %I:%M %p',
                        background = "#3b4252",
                        foreground = "#eceff4",
                        # padding = 5,
                        ),
                    ],
                20,
                ),
            ),
        ]
# Drag floating layouts.
mouse = [
        Drag([mod], "Button1", lazy.window.set_position_floating(),
            start=lazy.window.get_position()),
        Drag([mod], "Button3", lazy.window.set_size_floating(),
            start=lazy.window.get_size()),
        Click([mod], "Button2", lazy.window.bring_to_front())
        ]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(**layout_theme,float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
    ])
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

wmname = "LG3D"

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([home])
