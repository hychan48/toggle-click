#Requires AutoHotkey v2.0
#SingleInstance
#include C:\Users\Jason\Downloads\UIA-v2-main\Lib\UIA.ahk

; gpedit.msc
; Local Group Policy Editor
editor_a := WinGetID('A')
mmcEl := UIA.ElementFromHandle("Local Group Policy Editor ahk_exe mmc.exe")
if(FileExist('log.txt')){
    FileDelete('log.txt')
} 

; https://github.com/Descolada/AHK-v2-libraries
; need parameter... or from clipboard or something
strInput := "Local Computer Policy\Computer Configuration\Administrative Templates\Windows Components\Remote Desktop Services\Remote Desktop Session Host\Session Time Limits"
; strKeys := StrSplit(strInput, "\"," `t")
strKeys := StrSplit(strInput, "\")
lastKey := strKeys.Pop()
; last array doest need to expanded...
mmcEl.FindElement({Value: "Local Computer Policy"}).Collapse() ; works

for str_key in strKeys {
    mmcEl.FindElement({Value: str_key}).Expand()
    ; FileAppend(str_key "`n", "log.txt")
}
lastElement := mmcEl.FindElement({Value:lastKey})
lastElement.ScrollintoView()
lastElement.Click()


learn(){
    FileAppend('WinGetTextO: ' WinGetText('A') "`n", "log.txt") ; old way
    ; class IUIAutomationElement extends UIA.IUIAutomationBase {
    FileAppend('GetControlId: ' lastElement.GetControlId() "`n", "log.txt")
    FileAppend('GetWinId: ' lastElement.GetWinId() "`n", "log.txt")
    FileAppend('WinGetText: ' WinGetText("ahk_id " lastElement.GetControlId()) "`n", "log.txt")
    FileAppend('ControlGetText: ' ControlGetText(lastElement.GetControlId()) "`n", "log.txt")
    
    FileAppend('ControlGetText: ' ControlGetText(lastElement.GetWinId()) "`n", "log.txt") ; purely title...
    FileAppend('WinGetText: ' WinGetText("ahk_id " lastElement.GetWinId()) "`n", "log.txt") ; purely title...
    FileAppend('ONE_LINE: ' StrSplit(WinGetText("ahk_id " lastElement.GetWinId()),'`r`n')[1] "`n", "log.txt") ; purely title...
    FileAppend('ChildId: ' lastElement.ChildId "`n", "log.txt") ; purely title...
    
    ; FileAppend("GetPos: " lastElement.GetPos().x "`n", "log.txt")
    FileAppend("GetPos: " lastElement.GetPos().x "`n", "log.txt")
    ; FileAppend("GetPropertyValue: " lastElement.GetPropertyValue("Text") "`n", "log.txt")
}
learn()


;Local Computer Policy\Computer Configuration\Administrative Templates\Windows Components\Remote Desktop Services\Remote Desktop Session Host\Session Time Limits
; FileAppend("X11VNC :" StartTime ":" ElapsedTime "`n", "log.txt")


; mmcEl.FindElement({Value: "Local Computer Policy"}).Collapse() ; works





WinActivate("ahk_id " editor_a)
ExitApp
