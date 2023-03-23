# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
# Copyright (c) 2023 Feeeeddmmmeee
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import os
import subprocess

from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

from widgets import WiFiIcon, VolumeIcon, BatteryIcon

@hook.subscribe.startup_once
def startup():
    home = os.path.expanduser("~/.config/qtile/startup.sh")
    subprocess.Popen([home])

catppuccin = {
        "rosewater": "#f5e0dc",
        "flamingo": "#f2cdcd",
        "pink": "#f5c2e7",
        "mauve": "#cba6f7",
        "red": "#f38ba8",
        "rosewater": "#",
        "maroon": "#eba0ac",
        "peach": "#fab387",
        "yellow": "#f9e2af",
        "green": "#a6e3a1",
        "teal": "#94e2d5",
        "sky": "#89dceb",
        "sapphire": "#74c7ec",
        "blue": "#89b4fa",
        "lavender": "#b4befe",
        "text": "#cdd6f4",
        "subtext1": "#bac2de",
        "subtext0": "#a6adc8",
        "overlay2": "#9399b2",
        "overlay1": "#7f849c",
        "overlay0": "#6c7086",
        "surface2": "#585b70",
        "surface1": "#45475a",
        "surface0": "#313244",
        "base": "#1e1e2e",
        "mantle": "#181825",
        "crust": "#11111b",
}

mod = "mod4"
terminal = "kitty"

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    # Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
]

# Custom Keybindings
keys.extend(
    [
        Key([mod], "Right", lazy.screen.next_group()),
        Key([mod], "Left", lazy.screen.prev_group()),
        Key([mod], "b", lazy.spawn("firefox")),
        # Key([mod], "d", lazy.spawn("flatpak run com.discordapp.Discord")),
        Key([mod, "shift"], "s", lazy.spawn("flameshot gui")),
        Key([mod], "m", lazy.window.toggle_fullscreen()),
        Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl s +5%")), 
        Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl s 5%-")),
        Key([], "XF86AudioRaiseVolume", lazy.spawn("pamixer -i 5")), 
        Key([], "XF86AudioLowerVolume", lazy.spawn("pamixer -d 5")),
        Key([], "XF86AudioMute", lazy.spawn("pamixer -t")),

        # -----------------------------------------------
        
        Key([mod], "d", lazy.spawn("sh " + os.path.expanduser("~/.config/rofi/bin/launcher"))),
        Key([mod], "r", lazy.spawn("sh " + os.path.expanduser("~/.config/rofi/bin/runner"))),
        Key([mod], "p", lazy.spawn("sh " + os.path.expanduser("~/.config/rofi/bin/powermenu"))),

    ]
)

group_names = "123456789"

groups = [Group(i) for i in group_names] 

for index, group in enumerate(groups, start=1):
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                str(index),
                lazy.group[group.name].toscreen(),
                desc="Switch to group {}".format(group.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                str(index),
                lazy.window.togroup(group.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(group.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

layout_theme = {
        "border_width": 2,
        "margin": 10,
        "border_focus": catppuccin["lavender"],
        "border_normal": catppuccin["base"]
    }

layouts = [
    layout.MonadTall(**layout_theme),
    layout.Columns(**layout_theme),
    #layout.Max(**layout_theme),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font="Hack Nerd Font Bold",
    fontsize=12,
    padding=3,
    background = catppuccin["crust"],
    foreground = catppuccin["text"]
)
extension_defaults = widget_defaults.copy()

default_bar_settings = [
    widget.CurrentLayout(),
    widget.GroupBox(),
    widget.Prompt(),
    widget.WindowName(),
    widget.Chord(
        chords_colors={
            "launch": ("#ff0000", "#ffffff"),
        },
        name_transform=lambda name: name.upper(),
    ),
    widget.TextBox("default config", name="default"),
    widget.TextBox("Press &lt;M-r&gt; to spawn", foreground="#d75f5f"),
    # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
    # widget.StatusNotifier(),
    widget.Systray(),
    widget.Clock(format="%Y-%m-%d %a %I:%M %p"),
    widget.QuickExit()
]

custom_bar_settings = [
    widget.CurrentLayoutIcon(
        custom_icon_paths = [os.path.expanduser("~/.config/qtile/icons")],
        scale = 0.7
    ),
    #widget.CurrentLayout(),
    widget.GroupBox(
        highlight_color = catppuccin["base"],
        this_current_screen_border = catppuccin["lavender"],
        highlight_method = "line",
        active = catppuccin["text"],
        inactive = catppuccin["overlay0"],
        urgent_border = catppuccin["red"]
    ),
    
    # ------------------------------------

    #widget.Spacer(length=bar.STRETCH),
    widget.WindowName(format="{class}"),
    widget.Spacer(length=bar.STRETCH),

    # ---------------VOLUME----------------

    VolumeIcon(
        update_interval = 0.1,
        foreground = catppuccin["lavender"],
        fontsize=20
    ),

    widget.Volume(),

    
    # ---------------WIFI-----------------
    widget.Sep(linewidth = 0, padding=15),
  
    WiFiIcon(
        update_interval=0.1,
        foreground = catppuccin["lavender"],
        fontsize=16
    ),

    widget.Wlan(
        disconnected_message="Disconnected",
        format="{essid}",
        mouse_callbacks = {
            "Button1": lazy.spawn("wifi-toggle")
        }
    ),

    
    # --------------BATTERY----------------
    widget.Sep(linewidth = 0, padding=15),

    BatteryIcon(
        update_interval = 0.1,
        foreground = catppuccin["lavender"],
        fontsize = 15 
    ),

    widget.Battery(
        charge_char="󰂅",
        discharge_char="󰁹",
        full_char = "󰁹",
        low_foreground = catppuccin["red"],
        low_percentage=0.2,
        format="{percent:2.0%}"
    ),
    #widget.Battery(
    #    low_foreground = catppuccin["red"],
    #    low_percentage=1,
    #    battery=0,
    #    format="{percent:2.0%}"
    #),
    

    # ---------------CLOCK-----------------
    widget.Sep(linewidth = 0, padding=15),

    widget.TextBox(
        text = "", 
        foreground = catppuccin["lavender"],
        fontsize=15
    ),

    widget.Clock(
        format="%A, %B %d - %H:%M"
    ),
]

arch_wp = "~/Pictures/arch_wallpaper_catppuccin.png"
coffee_cat_wp = "~/.config/qtile/wallpapers/coffee_cat.png"

screens = [
    Screen(
        wallpaper = coffee_cat_wp,
        wallpaper_mode = "fill",
        top=bar.Bar(
            custom_bar_settings,
            35,
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = True#"smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "Qtile"
