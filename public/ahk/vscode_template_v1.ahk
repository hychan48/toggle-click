#SingleInstance Force
#NoEnv
SetWorkingDir %A_ScriptDir%
; if not A_IsAdmin
; 	Run *RunAs "%A_ScriptFullPath%" ;
; Get VSCode and Original Position to return to after
;C:\Program Files\AutoHotkey
;C:\Users\Jason\AppData\Local\Programs\AutoHotkey\UX
; %LOCALAPPDATA%\Programs\AutoHotkey\UX
; %LOCALAPPDATA%\Programs\AutoHotkey\UX\
; "C:\Users\Jason\AppData\Local\Programs\AutoHotkey\v2\AutoHotkey64.exe"
; C:\Users\Jason\AppData\Local\Programs\AutoHotkey\v2
active_id := WinGetID("A")
WinActivate(active_id)
MouseGetPos &ogxpos, &ogypos
; FileDelete('log.txt')

; FileAppend("X11VNC :" StartTime ":" ElapsedTime "`n", "log.txt")
; Return Back to current editor
WinActivate(active_id)
MouseMove ogxpos, ogypos
Exit(0)
