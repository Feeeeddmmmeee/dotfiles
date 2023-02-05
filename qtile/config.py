# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
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

from qtile_extras import widget
from qtile_extras.widget.decorations import PowerLineDecoration

from libqtile import bar, layout, extension
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

colors = {
    "dark": "#0c1210",
    "background": "#111416",
    "green": "#5c6b51",
    "light_green": "#517933",
    "gray": "#282828"
}

#colors = {
#    "background":	"#1A2026",
#    "foreground":	"#FFFFFF",
#    "cursorColor":	"#FFFFFF",
#    "color0":	"#242D35",
#    "color1":	"#FB6396",
#    "color2":	"#94CF95",
#    "color3":	"#F692B2",
#    "color4":	"#6EC1D6",
#    "color5":	"#CD84C8",
#    "color6":	"#7FE4D2",
#    "color7":	"#FFFFFF",
#    "color8":	"#526170",
#    "color9":	"#F92D72",
#    "color10":	"#6CCB6E",
#    "color11":	"#F26190",
#    "color12":	"#4CB9D6",
#    "color13":	"#C269BC",
#    "color14":	"#58D6BF",
#    "color15":	"#F4F5F2"
#}

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

### CUSTOM KEYBINDINGS ###
keys.extend(
    [
        Key([mod], "Right", lazy.screen.next_group()),
        Key([mod], "Left", lazy.screen.prev_group()),
        Key([mod], "b", lazy.spawn("firefox")),
        Key([mod], "p", lazy.spawn("dmenu_run")),
        Key([mod], "d", lazy.spawn("flatpak run com.discordapp.Discord")),
        Key([mod, "shift"], "s", lazy.spawn("flameshot"))
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
        "margin": 8,
        "border_focus": colors["light_green"], 
        "border_normal": colors["background"]
        }

layouts = [
    layout.MonadTall(**layout_theme),
    layout.Max(**layout_theme),
    # layout.Floating(**layout_theme),
    # layout.Columns(border_focus_stack=["#d75f5f", "#8f3d3d"], border_width=4),
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
    font="Ubuntu Bold",
    fontsize=12,
    padding=3,
    background = colors["background"]
)
extension_defaults = widget_defaults.copy()

default_bar_settings = [
    widget.CurrentLayoutIcon(),
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
    widget.QuickExit(),
]

forward_bar = {
    "decorations": [
        PowerLineDecoration(path='forward_slash')
    ]
}

back_bar = {
    "decorations": [
        PowerLineDecoration(path='back_slash')
    ]
}

custom_bar_settings = [
    widget.Sep(linewidth=0, padding = 6, background=colors["dark"]),
    widget.CurrentLayoutIcon(
        custom_icon_paths = [os.path.expanduser("~/.config/qtile/icons")],
        padding=0,
        scale=0.7,
        background=colors["dark"],
    ),
    widget.Sep(linewidth=0, padding = 6, background=colors["dark"]),
    widget.CurrentLayout(background=colors["dark"]),
    widget.TextBox(text=" ", background=colors["dark"], **forward_bar),
    #widget.Sep(padding = 10, size_percent=70, foreground="#000"),
    widget.GroupBox(
        highlight_color = colors["green"],
        this_current_screen_border = colors["green"],
        highlight_method = "line",
        **forward_bar
    ),
    #widget.Sep(padding = 10, size_percent=70, foreground="#000"),
    widget.WindowName(background=colors["gray"], **back_bar),
    widget.Systray(padding=10,**back_bar),
    widget.TextBox(text="Volume:", foreground=colors["green"]),
    widget.Volume(fmt="{}"),
    widget.Sep(linewidth=0, padding = 6),
    widget.TextBox(text="Battery:", foreground=colors["green"]),
    widget.Battery(format = "{percent:2.0%}"), 
    widget.Sep(linewidth=0, padding = 6), 
    widget.TextBox(text=" ", **back_bar),
    widget.Clock(format="%A, %B %d - %H:%M", background=colors["green"],foreground="#182111", **back_bar),
    widget.QuickExit(default_text = "\uf011", countdown_format="\uf057", padding=8, fontsize=15, background=colors["dark"], countdown_start=3),
    widget.Sep(linewidth=0, padding = 6),
]

screens = [
Screen(
        wallpaper = "./wallpapers/forest.jpg",
        wallpaper_mode = "fill",
        top=bar.Bar(
            custom_bar_settings,
            33,
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
focus_on_window_activation = "smart"
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
# wmname = "LG3D"
wmname = "qtile"
