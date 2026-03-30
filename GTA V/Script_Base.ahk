; Include at the start of the scripts

#MaxThreads 255 ; Enables the running of many instances of hotkeys at the same time
#MaxThreadsPerHotkey 3 ; Increases the maximum amount of simultanous threads for each hotkey to the minimal amount for toggle loops to work
#Requires AutoHotkey v2.0 ; Tells the compiler this script will run only on ahk v2.0
#SingleInstance force ; No prompt to reload script
A_HotkeyInterval := 0 ; Disables warning for too many keys pressed too quickly
KeyHistory 0 ; Disables key history entirely
ListLines false ; Disables logging of executed lines
ProcessSetPriority "H" ; Increases the process priority to high
SendMode "Event" ; Sets send mode to event allowing taps to be recognized
SetControlDelay -1 ; Causes the smallest possible delay after each control-modifying function
SetDefaultMouseSpeed 0 ; Causes the mouse cursor to be moved instantly
SetWinDelay -1 ; Causes the smallest possible delay after each windowing function
SetKeyDelay 0, 0 ; Causes the smallest possible delay and the smallest possible press length for each sending of a key
SetMouseDelay 0 ; Causes the smallest possible delay after each mouse movement or click

WindowName := "" ; Name of the window that's being checked (Needs to be set in script)

Enabled := 1

ExactSleep(Time) {
    Time := Time * 10000
    Last := 0
    DllCall("GetSystemTimeAsFileTime", "Int64*", &Last)
    Current := Last
    While (Current - Last < Time && Active()) {
        DllCall("GetSystemTimeAsFileTime", "Int64*", &Current)
    }
}

Active() {
    return WinActive(WindowName)
}

SleepUInt(time){
    return DllCall("Sleep", "UInt", time) 
}
