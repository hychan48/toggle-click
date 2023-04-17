#Requires AutoHotkey v2.0
#SingleInstance
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
; ids := WinGetList("hychan48/toggle-click — Mozilla Firefox")
ids := WinGetList("toggle-click — Mozilla Firefox")
; ids := WinGetList("vdiadminq1-01:5900 (vdiadminq1-01) - VNC Viewer")
; todo would need to search for the title
tooltip(ids[1])
WinActivate(ids[1])
MouseGetPos &xpos, &ypos 
; Click on button / can also trigger f11 or something for fullscreen / or check for fullscreen
; MouseClick "left",41,111
CX := 41
CY := 200

initial_color := PixelGetColor(CX, CY)
; todo get timestamp
; https://www.autohotkey.com/boards/viewtopic.php?t=82405
; https://www.autohotkey.com/docs/v2/Variables.htm#NowUTC
;;;;;@Ahk2Exe-ConsoleApp
StartTime := A_TickCount ; in milliseconds
; sOutputvar := StrGet(StartTime)
; sOutputvar := StartTime
; ToolTip sOutputvar
; FileAppend("%sOutputvar%.`n", "Test.txt")
; MouseClick "left",35,16
; MouseMove 35,16
MouseMove CX,CY
StartTime := A_TickCount
MouseClick "left"

; Outside of the screen... can just hardcode the color here...
; MouseMove 41, 200
; MouseGetPos &MouseX, &MouseY
; todo loop this and compare with the original
; PixelGetColor(MouseX, MouseY)
; https://www.autohotkey.com/docs/v2/lib/If.htm
color := PixelGetColor(CX, CY)
while color == initial_color {
    sleep 10
    color := PixelGetColor(CX, CY)
}
ElapsedTime := A_TickCount - StartTime
; todo get time
; ToolTip color
; A_Clipboard := color

; 200 ms... interesting.. actually 47 ms if i optimize it
; i guess i can test by deliberately adding a delay to the click...
; ToolTip ElapsedTime
; A_Clipboard := ElapsedTime

FileAppend("Firefox:" StartTime ":" ElapsedTime "`n", "log.txt")


; Return Back to current editor
MouseMove xpos, ypos 
WinActivate(active_id)
Exit(0)
