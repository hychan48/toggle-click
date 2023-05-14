#Requires AutoHotkey v2.0
#SingleInstance
DetectHiddenWindows True
T := 'gui_runner.ahk'
; ControlSendText('hello',"Edit1",T)
ControlSetText('hello 1',"Edit1",T)
ControlClick("Button1",T)
; mousemove 100, 100
WinShow(T)
Exit(0)
