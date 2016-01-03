; #FUNCTION# ====================================================================================================================
; Name ..........: Drops EarthQuake and CC Spell (EarthQuake)
; Description ...: Drops EarthQuake, given the spell and x, y coordinates.
; Syntax ........: dropEarth($x, $y, $spell)
; Parameters ....: $x                   - X location.
;                  $y                   - Y location.
;                  $spell               - spell
; Return values .: None
; Author ........:
; Modified ......: Lakereng 2016 And Extreme De Side MOD TeaM
; Remarks .......: This file is part of ClashGameBot. Copyright 2015
;                  ClashGameBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func dropEarth($x, $y, $spell)
	If $LBBKEQFilter = 1 And $King = -1 Then
		SetLog("Saving earthquake for when the king is present")
		Return
	EndIf

	If $spell <> -1 Then
		For $i = 0 To UBound($atkTroops) - 1
			If $atkTroops[$i][0] = $eEspell Then
				$spell = $i
				If _Sleep(100) Then Return
				If $debugsetlog = 1 Then SetLog("Dropping spell in slot " & $i, $COLOR_BLUE)
				Click(GetXPosOfArmySlot($i, 68), 595 + $bottomOffsetY, 1, 0, "#0094")
				If $debugsetlog = 1 Then SetLog("Number of Earth Spells: " & $numEarthSpells, $COLOR_PURPLE)
				SetLog(" Dropping EARTHQUAKE SPELL", $COLOR_RED)
				Click($x, $y, 4, 50)
			    If $CCSpellType = $eEspell Then
                    Click(GetXPosOfArmySlot($i, 68) + 80, 595 + $bottomOffsetY,1,0,"#0094")
			        SetLog(" Dropping CC SPELL" , $COLOR_RED)
			        Click($x, $y, 1, 50)
				EndIf
				ExitLoop
			EndIf
		Next
	EndIf
EndFunc   ;==>dropEarth
