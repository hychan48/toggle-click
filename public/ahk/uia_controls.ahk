#Requires AutoHotkey v2.0
#SingleInstance
; FileDelete('log.txt')
; FileAppend("X11VNC :" StartTime ":" ElapsedTime "`n", "log.txt")


; T := "ahk_exe powershell_ise.exe"

; can just invoke in the UIAViewer... so makes no sense
; RunScriptButton
; ControlSend("{Enter}","RunScriptButton",T)
; C:\Users\Jason\Downloads\UIA-v2-main\Lib
; https://github.com/Descolada/UIA-v2/tree/main/Examples
;include <UIA> ; Uncomment if you have moved UIA.ahk to your main Lib folder
; #include C:\Users\%A_UserName%\Downloads\UIA-v2-main\Lib
#include C:\Users\Jason\Downloads\UIA-v2-main\Lib\UIA.ahk
; #include C:\Users\Jason\Downloads\UIA-v2-main\Lib\
; #include %A_DESKTOP%\..\..\Downloads\UIA-v2-main\Lib\UIA.ahk

; WinActivate "Local Group Policy Editor ahk_exe mmc.exe"
; WinWaitActive "Local Group Policy Editor ahk_exe mmc.exe"
mmcEl := UIA.ElementFromHandle("Local Group Policy Editor ahk_exe mmc.exe")

; First element,,, run this ad admin too
; Type: 50024 (TreeItem) Name: "Local Computer Policy" Value: "Local Computer Policy" LocalizedType: "tree item"
editor_a := WinGetID('A')
firstItem := mmcEl.ElementFromPath("YXYNO/")
; firstItem.ControlClick(,2) ; control click doesnt work for w/e reason
; firstItem.Click(,2)
; sleep 1000
; firstItem.ControlClick(,2,'NA')
; firstItem.ControlClick("left",2)
; firstItem.Collapse()
firstItem.Expand()

; mmcEl.FindElement({Type:"TreeItem"}).Collapse()
; mmcEl.FindElement({Name: "Local Computer Policy"}).Collapse() ; no works, name might be more like id...
mmcEl.FindElement({Value: "Local Computer Policy"}).Collapse() ; works
; MsgBox firstItem.Dump()




WinActivate("ahk_id " editor_a)
; mmcEl.ElementFromPath("YXYNOOO/").Expand()
; ; mmcEl.ElementFromPath("YXYNOOO/OvOyuO").ScrollIntoView()
; mmcEl.ElementFromPath("YXYNOOO/OvOyuO/Ox").ScrollIntoView()
; mmcEl.ElementFromPath("YXYNOOO/OvOyuO/Ox").ControlClick()
; mmcEl.ElementFromPath("YXYNOOO/OvOyuO/Ox").ControlClick()

; MsgBox "The first MenuItem element: " npEl.FindElement({Type:"MenuItem"}).Highlight().Dump()
; Type: 50033 (Pane) Name: "Workspace" LocalizedType: "pane" AutomationId: "59648" ClassName: "MDIClient"


; it's in the window text.. the path
;Local Computer Policy\Computer Configuration\Administrative Templates\Windows Components\Remote Desktop Services\Remote Desktop Session Host\Session Time Limits


ExitApp
