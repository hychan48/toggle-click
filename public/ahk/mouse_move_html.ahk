#Requires AutoHotkey v2.0
#SingleInstance Force
; https://www.autohotkey.com/docs/
; https://hychan48.github.io/toggle-click/
; 94, 125 (default) ; for background color
; Color:  242424 (Red=24 Green=24 Blue=24) ; grey
; Color:  000000 (Red=00 Green=00 Blue=00) ; black
; Client: 57, 138 (default)

; Find Firefox window

; Vite + Vue — Mozilla Firefox
; ahk_class MozillaWindowClass
; ahk_exe firefox.exe
; ahk_pid 1176
; ahk_id 2363728
active_id := WinGetID("A")
ids := WinGetList("mouse_move.html")
tooltip(ids[1])
WinActivate(ids[1])
MouseGetPos &xpos, &ypos 

; Click on button / can also trigger f11 or something for fullscreen / or check for fullscreen

StartTime := A_TickCount ; in milliseconds

MouseMove 100,188 + 112 ; 300 is 188...
sleep 1000
MouseMove 200,200 + 112 ; 300 is 188...

sleep 1000

; this works perfectly...


ElapsedTime := A_TickCount - StartTime
FileAppend("mouse_move.html :" StartTime ":" ElapsedTime "`n", "log.txt")


; Return Back to current editor
MouseMove xpos, ypos 
WinActivate(active_id)
Exit(0)
