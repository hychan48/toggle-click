#Requires AutoHotkey v2.0
#SingleInstance

T := 'gui_runner.ahk'
; ControlSendText('hello',"Edit1",T)
session_id := 0
if(A_Args.Length == 1){
    session_id := A_Args[1]
} 
ControlSetText('hello psexec ' session_id,"Edit1",T)
; mousemove 100, 100
Exit(0)
