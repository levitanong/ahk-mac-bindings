#SingleInstance Force

SendMode("Input")  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir(A_ScriptDir)  ; Ensures a consistent starting directory.

!o:: SendInput("ö")
!+o:: SendInput("Ö")
!u:: SendInput("ü")
!+u:: SendInput("Ü")
!n:: SendInput("ñ")
!+n:: SendInput("Ñ")

!=:: SendInput("≠")