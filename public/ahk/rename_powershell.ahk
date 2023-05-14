#Requires AutoHotkey v2.0
#SingleInstance
; Get VSCode and Original Position to return to after
active_id := WinGetID("A")
WinActivate(active_id)
MouseGetPos &ogxpos, &ogypos
FileDelete('log.txt')
Run("powershell.exe",,,&pid)
; rename


FileAppend("pid:" pid "`n", "log.txt")
; FileAppend("tmp:&pid" "`n", "log.txt")
; FileAppend("tmp:%pid%" "`n", "log.txt")
; WinClose("A")


WinWait "ahk_pid " pid
; for win11...
ControlSendText("$host.ui.RawUI.WindowTitle = “Changed Title”","Windows.UI.Composition.DesktopWindowContentBridge1","ahk_pid" pid)
; sleep 10
ControlSend("{Enter}",,"ahk_pid" pid)
; 


; WinSetTitle("AHKPS","ahk_pid" pid) # gets overridden though...
; sleep 5000
; WinClose("ahk_pid " pid)11
; sleep 100

; Return Back to current editor
WinActivate(active_id)
WinWait "ahk_id" active_id
; sleep 100
MouseMove ogxpos, ogypos
Exit(0)
