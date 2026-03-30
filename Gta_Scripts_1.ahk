#Include Script_Base.ahk
#Include Configuration.ahk

WindowName := "Grand Theft Auto V"
; --- AUTO-EXIT SETUP ---
SetTimer(CheckGameStatus, 1000) ; 

ToggleHeavyReloadCancel := false
ToggleSniperReloadCancel := false

CheckGameStatus() {
    global WindowName
    ;//
    ; Modify hotkeys ONLY in "".
    Hotkey("~$xbutton2", HeavyReloadCancel) ; Side Forward Mouse Button
    Hotkey("~$xbutton1", SniperReloadCancel) ; Side Backward Mouse Button
    Hotkey("~$end", EWOisAbitch) ; End

    ;ToggleHeavyReloadCancel := false
    HeavyReloadCancel(Hotkey) {
        global ToggleHeavyReloadCancel ; Access the global Toggle variable
        ToggleHeavyReloadCancel := !ToggleHeavyReloadCancel ; Toggle the loop on/off

        if (ToggleHeavyReloadCancel) {
            ; Start the loop
            while (ToggleHeavyReloadCancel) { ; Loop as long as Toggle is true
                if (!Active()) {
                    return
                }
                SendInput("{" . KeyBindSpecialWeapon . " down}")
                ExactSleep(40) 
                SendInput("{" . KeyBindSpecialWeapon . " up}")
                ExactSleep(40)
                SendInput("{" . KeyBindHeavyWeapon . " down}")
                ExactSleep(40)
                SendInput("{" . KeyBindHeavyWeapon . " up}")
                ExactSleep(60)
                SendInput("{" . KeyBindWeaponWheel . " down}")
                ExactSleep(40)
                SendInput("{" . KeyBindWeaponWheel . " up}")
                ExactSleep(150) 
                SendInput("{" . KeyBindShootButton . " down}")
                ExactSleep(120) 
                SendInput("{" . KeyBindShootButton . " up}")
                ExactSleep(150) 
            }
        } else {
            ; Toggle is false, so the loop will exit naturally
        }
    }

    ;ToggleSniperReloadCancel := false
    SniperReloadCancel(Hotkey) {
        global ToggleSniperReloadCancel ; Access the global Toggle variable
        ToggleSniperReloadCancel := !ToggleSniperReloadCancel ; Toggle the loop on/off

        if (ToggleSniperReloadCancel) {
            ; Start the loop
            while (ToggleSniperReloadCancel) { ; Loop as long as Toggle is true
                if (!Active()) {
                    return
                }
                SendInput("{" . KeyBindSpecialWeapon . " down}")
                ExactSleep(40) 
                SendInput("{" . KeyBindSpecialWeapon . " up}")
                ExactSleep(40)
                SendInput("{" . KeyBindSniper . " down}")
                ExactSleep(40)
                SendInput("{" . KeyBindSniper . " up}")
                ExactSleep(60)
                SendInput("{" . KeyBindWeaponWheel . " down}")
                ExactSleep(40)
                SendInput("{" . KeyBindWeaponWheel . " up}")
                ExactSleep(150) 
                SendInput("{" . KeyBindShootButton . " down}")
                ExactSleep(120) 
                SendInput("{" . KeyBindShootButton . " up}")
                ExactSleep(150) 
            }
        } else {
            ; Toggle is false, so the loop will exit naturally
        }
    }

    EWOisAbitch(Hotkey) {
        if (!Active()) {
            return
        }
        SendInput("{" . KeyBindLookBehind . " down}{" . KeybindMoveBackward . " down}")
        ExactSleep(50)
        SendInput("{" . KeyBindMelee . " down}")
        ExactSleep(50)
        SendInput("{" . KeyBindMelee . " up}")
        ExactSleep(50)
        SendInput("{" . KeyBindSpecialWeapon . " down}")
        ExactSleep(50)
        SendInput("{" . KeyBindSpecialWeapon . " up}")
        ExactSleep(50)
        SendInput("{" . KeyBindWeaponWheel . " down}")
        ExactSleep(50)
        SendInput("{" . KeyBindWeaponWheel . " up}")
        ExactSleep(100)
        SendInput("{" . KeyBindShootButton . " down}")
        ExactSleep(50) 
        SendInput("{" . KeyBindShootButton . " up}")
        ExactSleep(500)
        SendInput("{" . KeyBindLookBehind . " up}{" . KeybindMoveBackward . " up}")
        if (!Enabled){
            return
        }
        Critical ; ScanCodes
        Send("{" . SC_F6 . " down}")
        SleepUInt(500)
        Send("{" . SC_G . " down}")
        SleepUInt(10)
        Send("{" . SC_G . " up}")
        SleepUInt(10)
        Send("{" . SC_G . " down}")
        SleepUInt(10)
        Send("{" . SC_F6 . " up}")
        SleepUInt(20)
        Send("{" . SC_G . " up}")
        SleepUInt(250)
        Send("{" . SC_Escape . " down}")
        SleepUInt(20)
        Send("{" . SC_Escape . " up}")
    }
    if !WinExist(WindowName) {
        ExitApp()
    }
}


