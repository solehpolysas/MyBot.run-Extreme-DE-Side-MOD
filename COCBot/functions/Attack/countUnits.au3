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

Func unitCount($unitName)
	Local $numUnits = 0
	Local $unitText = getTranslatedTroopName($unitName)

	For $j = 0 To UBound($atkTroops) - 1
		If $atkTroops[$j][0] = $unitName Then
			$numUnits = $atkTroops[$j][1]
			SetLog($numUnits & " " & $unitText & "'s in slot " & $j)
		EndIf
	Next

	Return $numSpells
EndFunc

Func spellCount($spellName) ; Gets a count of the number of spells of the type specified.
	Local $numSpells = 0
	Local $spellText = getTranslatedTroopName($spellName)

	For $j = 0 To UBound($atkTroops) - 1
		If $atkTroops[$j][0] = $spellName Then
			;With donate spells, there might be more than one slot with earth spell
			If $CCSpellType = $spellName Then

				; Clan castle spell is earthquake so add one extra to the total
				$numSpells = $atkTroops[$j][1] + 1
				SetLog(($numSpells - 1) & " " & $spellText & "'s in slot " & $j & " and 1 " & $spellText & " in the Clan Castle")
			Else
				$numSpells = $atkTroops[$j][1]
				SetLog($numSpells & " " & $spellText & "'s in slot " & $j)
			EndIf
		EndIf
	Next

	Return $numSpells
EndFunc   ;==>spellCount