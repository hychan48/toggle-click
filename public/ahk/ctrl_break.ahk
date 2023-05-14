#Requires AutoHotkey v2.0
#SingleInstance
; Get VSCode and Original Position to return to after
active_id := WinGetID("A")
WinActivate(active_id)
MouseGetPos &ogxpos, &ogypos

; WinActivate("ahk_pid 20944")
ControlSend "echo hi{Enter}" ,,"ahk_pid 20944"

; Send "psexec notepad{Enter}"
; sleep 300
; Send "{CtrlBreak}"
; Send "^{CtrlBreak}"
; SIGINT / SIGBREAK


; Return Back to current editor

WinActivate(active_id)
MouseMove ogxpos, ogypos
Exit(0)
