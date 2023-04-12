#Requires AutoHotkey v2.0
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

ids := WinGetList("Vite + Vue — Mozilla Firefox")
; would need to search for the title
tooltip(ids[1])
WinActivate(ids[1])


Exit(0)
