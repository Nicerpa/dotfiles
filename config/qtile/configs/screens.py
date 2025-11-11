from libqtile import bar, widget
from libqtile.config import Screen

widget_defaults = dict(
    font="UbuntuMono Nerd Font Bold",
    fontsize=17,
    padding=2,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        wallpaper='~/Pictures/Wallpapers/wallhaven-wqrdv6.jpg',
        wallpaper_mode="fill",       
        top=bar.Bar(
            [
                widget.CurrentLayout(
                    padding=5
                ),
                widget.GroupBox(
                    disable_drag=True,
                    highlight_method='block',
                    padding=5,
                ),
                widget.Prompt(),
                widget.WindowName(
                    padding=10
                ),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.Systray(
                    padding=5
                ),
                widget.Clock(
                    format="%a %H:%M %p",
                    padding=5
                ),
                widget.Volume(
                    padding=5
                ),
                widget.Battery(
                    format='{char}{percent:2.0%}',
                    padding=5
                ),
            ],
            26,
            margin = [6,8,6,8],
            border_width=[4, 8, 4, 8]
        ),
    ),
    Screen(
        wallpaper='~/Pictures/Wallpapers/mist_forest_1.png',
        wallpaper_mode="fill",
        top=bar.Bar(
            [
                widget.CurrentLayout(
                    padding=10
                ),
                widget.GroupBox(
                    highlight_method='block',
                    padding=5,
                ),
                widget.Prompt(),
                widget.WindowName(
                    padding=10
                ),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.Clock(
                    format="%a %H:%M %p",
                    padding=10
                ),
                widget.Volume(),
            ],
            26,
            margin = [6,8,6,8],
            border_width=[4, 8, 4, 8]
        ),
    ),
    Screen(
        wallpaper='~/Pictures/Wallpapers/wallhaven-5gym13.jpg',
        wallpaper_mode="fill",
        top=bar.Bar(
            [
                widget.CurrentLayout(
                    padding=10,
                    # background="#5E81AC"
                ),
                widget.GroupBox(
                    disable_drag=True,
                    # inactive="#4C566A",
                    # background="#2E3440",
                    highlight_method='block',
                    padding=5,
                ),
                widget.Prompt(),
                widget.WindowName(
                    padding=10,
                    # background="#5E81AC"
                ),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                # widget.Net(),
                # widget.Systray(
                #     padding=5
                # ),
                widget.Clock(
                    format="%d %a %H:%M %p",
                    padding=10
                ),
                widget.Volume(),
                widget.DF(
                    warn_space=3
                ),
            ],
            26,
            margin = [6,8,6,8],
            border_width=[4, 8, 4, 8]
        )
    )
]
