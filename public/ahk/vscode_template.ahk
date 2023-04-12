#Requires AutoHotkey v2.0
#SingleInstance
; Get VSCode and Original Position to return to after
active_id := WinGetID("A")
WinActivate(active_id)
MouseGetPos &ogxpos, &ogypos



; Return Back to current editor
MouseMove ogxpos, ogypos
WinActivate(active_id)
Exit(0)
