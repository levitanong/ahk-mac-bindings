#Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance Force
SendMode("Input")  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir(A_ScriptDir)  ; Ensures a consistent starting directory.

;; otherWindow is the ID of some other window
global otherWindow := ""

^Esc:: {
    ;; Is Windows Terminal on top of all other windows?
    if WinActive("ahk_exe WindowsTerminal.exe") {
        if (otherWindow) {
            ;; If another window was previously on top, show that
            WinActivate("ahk_id " otherWindow)
        } else {
            ;; Otherwise, minimize
            WinMinimize("ahk_exe WindowsTerminal.exe")
        }
    } else {
        ;; Something else is on top. Save it.
        otherWindow := WinExist("A")
        ;; Bring Windows Terminal to forefront if it's already running. Otherwise, run it.
        if WinExist("ahk_exe WindowsTerminal.exe") {
            WinActivate("ahk_exe WindowsTerminal.exe")
        } else {
            ;; If this fails, chances are there's a problem with app execution aliases.
            ;; Open windows settings, search of "app execution aliases",
            ;; Then look for the entry with Windows Terminal. If it's off, turn it on.
            ;; If it's on, turn it off and on again.
            Run("wt")
        }
    }
        
    return
}

;; Mac style quit
^q:: {
    WinClose("A")

    return
}