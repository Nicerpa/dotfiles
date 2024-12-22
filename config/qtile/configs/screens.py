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
                widget.QuickExit(),
            ],
            24,
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
    ),
    Screen(
        top=bar.Bar(
            [
                widget.CurrentLayout(
                    padding=10,
                    # background="#5E81AC"
                ),
                widget.GroupBox(
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
                widget.Systray(
                    padding=5
                ),
                widget.Clock(
                    format="%d %a %H:%M %p",
                    padding=10
                ),
                widget.Volume(),
                widget.DF(
                    warn_space=3
                ),
                widget.QuickExit(),
            ],
            24,
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        )
    )
]
