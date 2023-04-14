#Requires AutoHotkey v2.0
#SingleInstance
; Get VSCode and Original Position to return to after
active_id := WinGetID("A")
WinActivate(active_id)
MouseGetPos &ogxpos, &ogypos

; Try Creating a timeout function
CX := 41
CY := 200
StartTime := A_TickCount
initial_color := PixelGetColor(CX, CY)
; one second
CheckPixelColorUntil(xSleep := 10, i := 1000/10){
    Loop i
    {
        color := PixelGetColor(CX, CY)
        if(color == initial_color){
            sleep 10
            
        }else{
            return A_TickCount - StartTime ; ElapsedTime
        }
      
        
    }
    return -1
}
ElapsedTime := CheckPixelColorUntil()

FileAppend(StartTime ":" ElapsedTime "`n", "log.txt")

; Return Back to current editor
MouseMove ogxpos, ogypos
WinActivate(active_id)
Exit(0)
