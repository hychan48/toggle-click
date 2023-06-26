#Requires AutoHotkey v2.0
#SingleInstance
#include "C:\Users\Jason\Downloads\UIA-v2-main\Lib\UIA.ahk"
editor_a := WinGetID('A')
CodeEl := UIA.ElementFromHandle("ahk_exe Code.exe")
DetectHiddenWindows 1
; CodeEl := UIA.ElementFromHandle("ahk_pid " 1988)
; tmp := CodeEl.ElementFromPath("VXV") ; is the edit

tmp := CodeEl.ElementFromPath("VX4/") ; is the edhiit top
;Type: 50004 (Edit) Name: "Terminal 11, AutoHotkeyUX Run the command: Toggle Screen Reader Accessibility Mode for an optimized screen reader experience Use Alt+F1 for terminal accessibility help" LocalizedType: "edit"
; tmp := CodeEl.ElementFromPath("VXV") ; is the TermBuffehirhi
; FileAppend("Value:" tmp.Value "`n", "log.txt")
FileDelete("log.txt")
cid := tmp.GetControlId()
FileAppend("GetControlId:" cid "`n", "log.txt")
FileAppend("ControlGetClassNN:" ControlGetClassNN(cid) "`n", "log.txt")
FileAppend("Dump:" tmp.Dump() "`n", "log.txt")
FileAppend("Name:" tmp.Name "`n", "log.txt") ; empty...
FileAppend("Value:" tmp.Value "`n", "log.txt") ; empty...
FileAppend("IsReadOnly:" tmp.IsReadOnly "`n", "log.txt") ; empty...
FileAppend("gettext:" ControlGetText(cid) "`n", "log.txt")
FileAppend("WinGetText:" WinGetText(cid) "`n", "log.txt")
; tmp.Highlight()
; ControlClick(cid)
; WinActivate(cid)
; ControlSendText('hi',cid) ; this seem to buffer something
; ControlSendText('hi',cid) ; this seem to buffer something
; WinActivate("ahk_id " cid)
; tmp.SetFocus()
; ControlFocus(cid)
; tmp.ControlClick()

tmp.Invoke()
ControlSend('echo helloWorld{enter}',cid)
; EditPaste('echo helloWorld{enter}',"Chrome_RenderWidgetHostHWND1")
; ControlSendText('echo helloWorld{enter}',cid)

FileAppend("DocumentRange.GetText:" tmp.DocumentRange.GetText() "`n", "log.txt")
; ControlSend("{Enter}",cid,"ahk_exe Code.exe")
WinActivate("ahk_id " editor_a)
; ControlSetText('hi',cid)
; ControlSendText('hi',cid)
