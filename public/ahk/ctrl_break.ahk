#Requires AutoHotkey v2.0
#SingleInstance
; Get VSCode and Original Position to return to after
active_id := WinGetID("A")
WinActivate(active_id)
MouseGetPos &ogxpos, &ogypos

; WinActivate("ahk_pid 20944")
; ControlSend "echo hi{Enter}" ,,"ahk_pid 20944"

; Send "psexec notepad{Enter}"
; sleep 300

WinActivate("Windows PowerShell")
Send "{CtrlBreak}"
; Send "^{CtrlBreak}"
; SIGINT / SIGBREAK
#include "C:\Users\Jason\Downloads\UIA-v2-main\Lib\UIA.ahk"

CodeEl := UIA.ElementFromHandle("ctrl_break.ahk - ahk - Visual Studio Code ahk_exe Code.exe")
tmp := CodeEl.ElementFromPath("VX4")

; CodeEl.ElementFromPath("VX4").Highlight()
; CodeEl.ElementFromPath("VXV4").ShowContextMenu()

; Return Back to current editor

WinActivate(active_id)
MouseMove ogxpos, ogypos
Exit(0)
