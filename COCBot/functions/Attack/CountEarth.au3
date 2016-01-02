; #FUNCTION# ====================================================================================================================
; Name ..........: countEarth.au3
; Description ...: Counts the number of available earthquake spells
; Syntax ........: countEarth()
; Parameters ....: NA
; Return values .: NA
; Author ........:
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Func countEarth() ;Applies the data from config to the controls in GUI
	Local $numEarthSpells = 0
	For $j = 0 To UBound($atkTroops) - 1
		If $atkTroops[$j][0] = $eESpell Then
			;With donate spells, there might be more than one slot with earth spell
			If $CCSpellType = $eESpell Then
				; Clan castle spell is earthquake so add one extra to the total
				SetLog($atkTroops[$j][1] & " earthquake spells in slot " & $j & " and 1 earthquake spell in the clan castle")
				$numEarthSpells = $numEarthSpells + $atkTroops[$j][1] + 1
			Else
				SetLog($atkTroops[$j][1] & " earthquake spells in slot " & $j)
				$numEarthSpells = $numEarthSpells + $atkTroops[$j][1]
			EndIf
		EndIf
	Next
	Return $numEarthSpells
EndFunc   ;==>countEarth

