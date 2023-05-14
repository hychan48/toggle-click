#Requires AutoHotkey v2.0
#SingleInstance
; FileDelete('log.txt')
; FileAppend("X11VNC :" StartTime ":" ElapsedTime "`n", "log.txt")


T := "ahk_exe powershell_ise.exe"

; can just invoke in the UIAViewer... so makes no sense
; RunScriptButton
ControlSend("{Enter}","RunScriptButton",T)



Exit(0)
