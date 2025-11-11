import os
import subprocess
from libqtile.lazy import lazy
from libqtile import hook
from configs.keys import keys
from configs.layouts import layouts, floating_layout
from configs.mouse import mouse
from configs.groups import groups
from configs.screens import screens, extension_defaults, widget_defaults

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = True
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

sticky_windows = []

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/scripts/autostart.sh') # path to my script, under my user directory
    subprocess.call([home])

@lazy.function
def toggle_sticky_windows(qtile, window=None):
    if window is None:
        window = qtile.current_screen.group.current_window
    if window in sticky_windows:
        sticky_windows.remove(window)
    else:
        sticky_windows.append(window)
    return window

@hook.subscribe.setgroup
def move_sticky_windows():
    for window in sticky_windows:
        window.togroup()
    return

@hook.subscribe.client_killed
def remove_sticky_windows(window):
    if window in sticky_windows:
        sticky_windows.remove(window)

# Below is an example how to make Firefox Picture-in-Picture windows automatically sticky.
@hook.subscribe.client_managed
def auto_sticky_windows(window):
    info = window.info()
    if (info['wm_class'] == ['Toolkit', 'firefox']
            and info['name'] == 'Picture-in-Picture'):
        sticky_windows.append(window)

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# xcursor theme (string or None) and size (integer) for Wayland backend
wl_xcursor_theme = None
wl_xcursor_size = 24

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
