#!/usr/bin/env python3
"""
Keep workspaces in left-to-right numeric order, leaving exactly one hole between monitors
"""

import i3ipc

ipc = i3ipc.Connection()
ORDER = ["DP-3", "DP-4", "DP-5"]


def renumber(i3):
    # gather workspaces by output, keep their current numeric order
    outputs = {name: [] for name in ORDER}
    for ws in i3.get_workspaces():
        outputs.setdefault(ws.output, []).append(ws)

    new_num = 1
    for out in ORDER:
        for ws in sorted(outputs.get(out, []), key=lambda w: w.num):
            if ws.num != new_num:
                suffix = ':' + ws.name.split(':', 1)[1] if ':' in ws.name else ''
                i3.command(
                    f'rename workspace "{ws.name}" to "{new_num}{suffix}"'
                )
            new_num += 1
        if outputs.get(out):  # leave a gap only if this output had any
            new_num += 1  # extra gap

# run once at start-up
renumber(ipc)
# then run after every workspace event
ipc.on('workspace', lambda i3, e: renumber(i3))
ipc.main()
