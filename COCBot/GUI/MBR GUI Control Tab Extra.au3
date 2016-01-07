; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Controls Options
; Description ...: This file Includes GUI Design
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........:
; Modified ......: solehpolysas a.k.a Rizor
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

;MBR GUI_EXTRA CONTROLS
; ===============================================================================================================================

Func chkSWTGreedy()
	If GUICtrlRead($ChkSnipeWhileTrain) = $GUI_CHECKED Then
		$iChkSnipeWhileTrain = 1
		GUICtrlSetState($chkSWTGreedy, $GUI_ENABLE)
	Else
		$iChkSnipeWhileTrain = 0
		GUICtrlSetState($chkSWTGreedy, $GUI_DISABLE)
	EndIf
	GUICtrlSetState($ChkSnipeWhileTrain, $GUI_ENABLE)

EndFunc   ;==>chkSWTGreedy

Func chkGreedy()
	If GUICtrlRead($chkTrophyMode) = $GUI_CHECKED Then
		$OptTrophyMode = 1
		GUICtrlSetState($chkGreedy, $GUI_ENABLE)
	Else
		$OptTrophyMode = 0
		GUICtrlSetState($chkGreedy, $GUI_DISABLE)
	EndIf
EndFunc   ;==>chkSWTGreedy
