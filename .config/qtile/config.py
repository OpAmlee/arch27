##++++++++++++++++++++++++++##
## QTILE CONFIG BY ADAM LEE ##
##++++++++++++++++++++++++++##

import os
import subprocess
#from os import environ

from libqtile import qtile, bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen, ScratchPad, DropDown
from libqtile.widget import base
from libqtile.lazy import lazy


# default variables
home_dir = os.path.expanduser("~")
terminal = f"kitty --config {home_dir}/.config/kitty.d/kitty3.conf"

mod = "mod4"
#myTerm = "kitty -c ~/.config/kitty/kitty3.conf"                             # My terminal of choice
myBrowser = "firefox"                             # My browser
myEditor = "nvim"
myFileManager ="thunar"


keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    #Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    #Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    #Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    #Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    #Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    #Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    #Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    #Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    #Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    #Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    #Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    #Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    #Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    #Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    #Key(
    #    [mod, "shift"],
    #    "Return",
    #    lazy.layout.toggle_split(),
    #    desc="Toggle between split and unsplit sides of stack",
    #),
    #Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    ## Toggle between different layouts as defined below
    #Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    #Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    #Key([mod, "shift"], "r", lazy.reload_config(), desc="Reload the config"),
    #Key([mod, "shift"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    #Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    #################################################################################
    ### The essentials
         Key([mod], "Return", lazy.spawn(terminal), desc='Launches My Terminal'),
         Key([mod], "space", lazy.next_layout(), desc='Toggle through layouts'),
         Key([mod], "q", lazy.window.kill(), desc='Kill active window'),
         Key([mod, "shift"], "r", lazy.restart(), desc='Restart Qtile'),
         Key([mod, "shift"], "q", lazy.shutdown(), desc='Shutdown Qtile'),
         Key([mod], "w", lazy.spawn(myBrowser), desc='Launches My Browser'),
         Key([mod], "e",lazy.spawn(myEditor), desc='Launches My Editor'),
         Key([mod], "n", lazy.spawn("myFileManager"), desc='Launches My File Manager'),
 #        Key([], "Print", lazy.spawn("scrot"), desc='Screenshot'),
 #        Key([mod], "d",
 #            lazy.spawn("dmenu_run -nb '#0C1C29' -nf '#c9cde5' -sb '#E2817D' -sf '#11121D'"),
 #            desc='Launches dmenu'
 #            ),
         # Laptop keys
         Key([], "XF86AudioMute",lazy.spawn("pulseaudio-ctl mute")),
         Key([], "XF86AudioLowerVolume", lazy.spawn("amixer -D pulse sset Master 2%-")),
         Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer -D pulse sset Master 2%+")),
         Key([], "XF86MonBrightnessUp", lazy.spawn("xbacklight +4")),
         Key([], "XF86MonBrightnessDown",lazy.spawn("xbacklight -4")),
         ### Window controls
         Key([mod], "j",
             lazy.layout.down(),
             desc='Move focus down in current stack pane'
             ),
         Key([mod], "k",
             lazy.layout.up(),
             desc='Move focus up in current stack pane'
             ),
         Key([mod, "shift"], "j",
             lazy.layout.shuffle_down(),
             lazy.layout.section_down(),
             desc='Move windows down in current stack'
             ),
         Key([mod, "shift"], "k",
             lazy.layout.shuffle_up(),
             lazy.layout.section_up(),
             desc='Move windows up in current stack'
             ),
         Key([mod], "h",
             lazy.layout.shrink(),
             lazy.layout.increase_nmaster(),
             desc='Shrink window (MonadTall), decrease number in master pane (Tile)'
             ),
         Key([mod], "l",
             lazy.layout.grow(),
             lazy.layout.decrease_nmaster(),
             desc='Expand window (MonadTall), increase number in master pane (Tile)'
             ),
         Key([mod], "f",
             lazy.window.toggle_fullscreen(),
             desc='toggle fullscreen'
             ),
         
         ### Stack controls
         Key(
             [mod, "shift"], "Tab",
             lazy.layout.rotate(),                   # Swap panes of split stack (Stack)
             lazy.layout.flip(),                      # Switch which side main pane occupies (XmonadTall)
             desc='Switch which side main pane occupies (XmonadTall)'
             ),
         Key(
             [mod, "shift"], "j",
             lazy.layout.next()                      # Switch window focus to other pane(s) of stack
             ),
         Key(
             [mod, "shift"], "k",
             lazy.layout.toggle_split()              # Toggle between split and unsplit sides of stack
             ),
         ### Treetab controls
         Key([mod], "comma",
             lazy.layout.section_up()                # Move up a section in treetab
             ),
         Key([mod], "period",
             lazy.layout.section_down()              # Move down a section in treetab
             ),
        ### Dmenu Scripts
        #Key([mod, "shift"], "w",
        #     lazy.spawn(".local/bin/dm-wifi"),
        #     desc='A dmenu wifi menu'
        #     ),
        #Key([mod], "m",
        #     lazy.spawn(".local/bin/dm-sounds"),
        #     desc='A dmenu wifi menu'
        #     ),
        #Key([mod], "o",
        #     lazy.spawn(".local/bin/todo"),
        #     desc='A dmenu todo menu'
        #     ),
        # Key([mod], "c",
        #     lazy.spawn(".local/bin/dm-confedit"),
        #     desc='A dmenu config menu'
        #     ),
        # Key([mod], "r",
        #     lazy.spawn(".local/bin/dm-record"),
        #     desc='A dmenu recording menu'
        ##     ),
        # Key([mod], "x",
        #     lazy.spawn(".local/bin/dm-logout"),
        #     desc='A dmenu logout menu'
        #     ),
        # Key([mod], "b",
        #     lazy.spawn(".local/bin/dm-bookman"),
        #     desc='A dmenu browser'
        #     ),
        # Key([mod], "p",
        #     lazy.spawn(".local/bin/dm-kill"),
        #     desc='A dmenu kill menu'
        #     ),
]

groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
            #Key(
            #    [],
            #    'F1',
            #    lazy.group['scratchpad'].dropdown_toggle("term"),
            #),
        ]
    )
groups.append(
    ScratchPad("scratchpad", [
        # define a drop down terminal.
        # it is placed in the upper third of screen by default.
        DropDown("term", "/usr/bin/kitty", opacity=0.88, height=0.55, width=0.80, ),

        # define another terminal exclusively for qshell at different position
        DropDown("cherry", "cherrytree",
                 x=0.05, y=0.4, width=0.9, height=1.5, opacity=1.0,
                 on_focus_lost_hide=False)
    ]), )

keys.extend([
    # Scratchpad
    # toggle visibiliy of above defined DropDown named "term"
    Key([mod], 'space', lazy.group['scratchpad'].dropdown_toggle('term')),
    Key([mod], 'c', lazy.group['scratchpad'].dropdown_toggle('cherry')),
    #Key([mod, "shift"], "w",
        #     lazy.spawn(".local/bin/dm-wifi"),
        #     desc='A dmenu wifi menu'
        #     ),
])

##### DEFAULT THEME SETTINGS FOR LAYOUTS #####
layout_theme = {"border_width": 3,
                "margin": 15,
                "font": "BlexMono Nerd Font",
                "font_size": 14,
                "border_focus": "#bd93f9",
                "border_normal": "#555555"
                }

# window layouts
layouts = [
    layout.MonadTall(**layout_theme),
    layout.Max(**layout_theme),
    layout.Floating(**layout_theme),
    layout.Stack(num_stacks=2, **layout_theme),
    layout.Bsp(**layout_theme),
    layout.Tile(**layout_theme),
    # Try more layouts by unleashing below layouts.
    layout.Columns(**layout_theme),
    layout.Matrix(**layout_theme),
    layout.MonadWide(**layout_theme),
    layout.RatioTile(**layout_theme),

    layout.VerticalTile(**layout_theme),
    layout.Zoomy(**layout_theme),
    layout.TreeTab(
          #font = "Ubuntu",
          fontsize = 20,
          sections = ["FIRST", "SECOND", "THIRD", "FOURTH"],
          section_fontsize = 20,
          #border_width = 2,
          bg_color = "1c1f24",
          active_bg = "c678dd",
          active_fg = "000000",
          inactive_bg = "a9a1e1",
          inactive_fg = "1c1f24",
          padding_left = 20,
          padding_x = 0,
          padding_y = 5,
          section_top = 10,
          section_bottom = 20,
          level_shift = 8,
          vspace = 3,
          panel_width = 150,
          )
]

# colors for the bar/widgets/panel
def init_colors():
    return [["#282a36", "#282a36"], # color 0 | bg
            ["#282a36", "#282a36"], # color 1 | bg
            ["#f8f8f2", "#f8f8f2"], # color 2 | fg
            ["#ff5555", "#ff5555"], # color 3 | red
            ["#50fa7b", "#50fa7b"], # color 4 | green
            ["#f1fa8c", "#f1fa8c"], # color 5 | yellow
            ["#bd93f9", "#bd93f9"], # color 6 | blue
            ["#ff79c6", "#ff79c6"], # color 7 | magenta
            ["#8be9fd", "#8be9fd"], # color 8 | cyan
            ["#bbbbbb", "#bbbbbb"]] # color 9 | white

def init_separator():
    return widget.Sep(
                size_percent = 60,
                margin = 5,
                linewidth = 2,
                background = colors[1],
                foreground = "#555555")

def nerd_icon(nerdfont_icon, fg_color):
    return widget.TextBox(
                font = "Iosevka Nerd Font",
                fontsize = 15,
                text = nerdfont_icon,
                foreground = fg_color,
                background = colors[1])

def init_edge_spacer():
    return widget.Spacer(
                length = 5,
                background = colors[1])


colors = init_colors()
sep = init_separator()
space = init_edge_spacer()

widget_defaults = dict(
    font="BlexMono Nerd Font",
    #font="GoMono Nerd Font",
    fontsize=16,
    padding=3,
)
extension_defaults = widget_defaults.copy()

def init_widgets_list():
    widgets_list = [
            # Left Side of the bar

            space,
            widget.Image(
                filename = "/home/trg/.config/kitty.d/icons/dinkdonk/kitty-light.png",
                background = colors[1],
                margin = 3,
                mouse_callbacks = {
                    'Button1': lambda : qtile.cmd_spawn(
                        'kitty -c ~/.config/kitty.d/kitty.conf'
                    ),
                    'Button3': lambda : qtile.cmd_spawn(
                        #f'{terminal} -e nvim {home_dir}/.config/kitty.d/kitty.conf'
                        "sudo kitty -c ~/.config/kitty.d/kitty.conf"
                    )
                }
            ),
            widget.Image(
                filename = "/home/trg/.config/qtile/icons/python.png",
                background = colors[1],
                margin = 3,
                mouse_callbacks = {
                    'Button1': lambda : lazy.restart(
                    ),
                    'Button3': lambda : qtile.cmd_spawn(
                        f'{terminal} -e nvim {home_dir}/.config/qtile/config.py'
                    )
                }
            ),
            widget.Image(
                filename = "/home/trg/Downloads/Ranger_logo.png",
                background = colors[1],
                margin = 3,
                mouse_callbacks = {
                    'Button1': lambda : qtile.cmd_spawn(
                        'kitty -e ranger'
                    ),
                    'Button3': lambda : qtile.cmd_spawn(
                        f'{terminal} -e sudo thunar'
                    )
                }
            ),
            sep,

            widget.GroupBox(
                font = "BlexMono Nerd Font",
                fontsize = 13,
                foreground = colors[2],
                background = colors[1],
                borderwidth = 4,
                highlight_method = "text",
                this_current_screen_border = colors[6],
                active = colors[4],
                inactive = colors[2]
            ),
            sep,

            nerd_icon(
                "  ",
                colors[6]
            ),
            widget.Battery(
                foreground = colors[2],
                background = colors[1],
                format = "{percent:2.0%}"
            ),
            nerd_icon(
                "墳",
                colors[3]
            ),
            widget.Volume(
                foreground = colors[2],
                background = colors[1]
            ),
            widget.Spacer(
                length = bar.STRETCH,
                background = colors[1]
            ),

            # Center bar

            nerd_icon(
                "",
                colors[7]
            ),
            widget.CurrentLayout(
                foreground = colors[2],
                background = colors[1]
            ),
            sep,

            nerd_icon(
                "﬙",
                colors[3]
            ),
            widget.CPU(
                format = "{load_percent}%",
                foreground = colors[2],
                background = colors[1],
                update_interval = 2,
                mouse_callbacks = {
                    'Button1': lambda : qtile.cmd_spawn(f"{terminal} -e gtop")
                }
            ),
            nerd_icon(
                "",
                colors[4]
            ),
            widget.Memory(
                format = "{MemUsed:.0f}{mm}",
                foreground = colors[2],
                background = colors[1],
                update_interval = 2,
                mouse_callbacks = {
                    'Button1': lambda : qtile.cmd_spawn(f"{terminal} -e gtop")
                }
            ),
            nerd_icon(
                "",
                colors[6]
            ),
            widget.GenPollText(
                foreground = colors[2],
                background = colors[1],
                update_interval = 5,
                func = lambda: storage.diskspace('FreeSpace'),
                mouse_callbacks = {
                    'Button1': lambda : qtile.cmd_spawn(f"{terminal} -e gtop")
                }
            ),
            sep,

            nerd_icon(
                "",
                colors[4]
            ),
            widget.GenPollText(
                foreground = colors[2],
                background = colors[1],
                update_interval = 5,
                func = lambda: subprocess.check_output(f"{home_dir}/.config/qtile/scripts/num-installed-pkgs").decode("utf-8")
            ),

            # Left Side of the bar

            widget.Spacer(
                length = bar.STRETCH,
                background = colors[1]
            ),
            nerd_icon(
                "",
                colors[4]
            ),
            widget.Net(
                format = "{down} ↓↑ {up}",
                foreground = colors[2],
                background = colors[1],
                update_interval = 2,
                mouse_callbacks = {
                    'Button1': lambda : qtile.cmd_spawn("def-nmdmenu")
                }
            ),
            sep,

            nerd_icon(
                "",
                colors[7]
            ),
            widget.Clock(
                format = '%b %d-%Y',
                foreground = colors[2],
                background = colors[1]
            ),
            nerd_icon(
                "",
                colors[8]
            ),
            widget.Clock(
                format = '%I:%M',
                foreground = colors[2],
                background = colors[1]
            ),
            widget.Systray(
                background = colors[1]
            ),
            space
        ]
    return widgets_list


# screens/bar   default margin=[5,10,0,10]))] top right ? left
def init_screens():
    return [Screen(top=bar.Bar(widgets=init_widgets_list(), size=35, opacity=0.9, margin=[0,0,0,0]))]

screens = init_screens()

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

#
# assign apps to groups/workspace
#
@hook.subscribe.client_new
def assign_app_group(client):
    d = {}

    # assign deez apps
    d[group_names[0][0]] = ['kitty', 'xfce4-terminal']
    d[group_names[1][0]] = ['Navigator', 'discord', 'brave-browser', 'midori', 'qutebrowser']
    d[group_names[2][0]] = ['spacefm', 'thunar']
    d[group_names[3][0]] = ['kate', 'geany']
    d[group_names[4][0]] = ['vlc', 'obs', 'mpv', 'mplayer', 'lxmusic', 'gimp']
    d[group_names[5][0]] = ['spotify']
    d[group_names[6][0]] = ['lxappearance', 'gpartedbin', 'lxtask', 'lxrandr', 'arandr', 'pavucontrol', 'xfce4-settings-manager']

    wm_class = client.window.get_wm_class()[0]
    for i in range(len(d)):
        if wm_class in list(d.values())[i]:
            group = list(d.keys())[i]
            client.togroup(group)
            client.group.cmd_toscreen(toggle=False)


main = None
@hook.subscribe.startup
def start_once():
    start_script = os.path.expanduser("~/.config/qtile/scripts/autostart.sh")
    subprocess.call([start_script])

@hook.subscribe.startup_once
def start_always():
    # fixes the cursor
    subprocess.Popen(['xsetroot', '-cursor_name', 'left_ptr'])


dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False


floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(wm_class='Viewnior'),  # Photos/Viewnior
    Match(wm_class='Alafloat'),  # Floating Alacritty Terminal
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
], **layout_theme)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True





# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
#wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"


