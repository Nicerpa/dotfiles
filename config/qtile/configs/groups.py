from libqtile.config import Key, Group
from libqtile.lazy import lazy
from .keys import mod, keys

# groups = [Group(i) for i in [
#     " 󰈹 ", "   ", "   ", "   ", " 󰦨 ", "   ", "  ", " 󰝚 ", " 󱄅 ",
# ]]

# for i, group in enumerate(groups):
#     actual_key = str(i + 1)
#     keys.extend([
#         # Switch to workspace N
#         Key([mod], actual_key, lazy.group[group.name].toscreen()),
#         # Send window to workspace N
#         Key([mod, "shift"], actual_key, lazy.window.togroup(group.name))
#     ])

groups = [Group(f"{i+1}", label="⬤") for i in range(9)]

for i in groups:
    keys.extend(
            [
                Key(
                    [mod],
                    i.name,
                    lazy.group[i.name].toscreen(),
                    desc="Switch to group {}".format(i.name),
                    ),
                Key(
                    [mod, "shift"],
                    i.name,
                    lazy.window.togroup(i.name, switch_group=True),
                    desc="Switch to & move focused window to group {}".format(i.name),
                    ),
                ]
            )
