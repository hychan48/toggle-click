#Requires AutoHotkey v2.0
#SingleInstance
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
