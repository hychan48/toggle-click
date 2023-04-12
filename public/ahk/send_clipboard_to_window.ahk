#Requires AutoHotkey v2.0
#SingleInstance
; Get VSCode and Original Position to return to after
active_id := WinGetID("A")
WinActivate(active_id)
MouseGetPos &ogxpos, &ogypos

; Send Text from keyboard...
ids := WinGetList("hychan48/toggle-click — Mozilla Firefox") ; change this
WinActivate(ids[1])
; Send "sdf" ; this works
Send A_Clipboard
; Return Back to current editor
MouseMove ogxpos, ogypos
WinActivate(active_id)
Exit(0)
