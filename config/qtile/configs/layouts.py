from libqtile import layout
from libqtile.config import Match

layouts = [
    layout.Max(
        margin=6,
    ),
    layout.Columns(
        border_focus="#88C0D0",      # Nord Frost - bright cyan for focused window
        border_normal="#4C566A",     # Nord Polar Night - darker gray for normal windows
        border_width=1,
        margin=6,
        border_focus_stack="#81A1C1",  # Nord Frost - blue for focused stack
        border_normal_stack="#3B4252", # Nord Polar Night - dark background
        border_on_single=True,          # Show border even for single window
    ),
    layout.MonadWide(
        border_focus="#88C0D0",
        border_normal="#4C566A",
        border_width=1,
        margin=6,
    ),
]

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
