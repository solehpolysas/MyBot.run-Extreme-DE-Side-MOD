Func getTranslatedTroopName($kind)
    ;Troop string as an array
	;This order must exactly match the troops enum from MBR Global Variables.au3
    Local $aTroopNames[$eHaSpell + 2] = [GetTranslated(1,17,"Barbarians") _
	                                   ,GetTranslated(1,18,"Archers") _
								       ,GetTranslated(1,19,"Giants") _
								       ,GetTranslated(1,20,"Goblins") _
								       ,GetTranslated(1,21,"Wall Breakers") _
								       ,GetTranslated(1,22,"Balloons") _
								       ,GetTranslated(1,23,"Wizards") _
								       ,GetTranslated(1,24,"Healers") _
								       ,GetTranslated(1,25,"Dragons") _
								       ,GetTranslated(1,26,"Pekkas") _
								       ,GetTranslated(1,48,"Minions") _
								       ,GetTranslated(1,49,"Hog Riders") _
								       ,GetTranslated(1,50,"Valkyries") _
								       ,GetTranslated(1,51,"Golems") _
								       ,GetTranslated(1,52,"Witches") _
								       ,GetTranslated(1,53,"Lava Hounds") _
								       ,GetTranslated(7,79,"King") _
								       ,GetTranslated(7,81,"Queen") _
								       ,GetTranslated(7,94,"Grand Warden") _
								       ,GetTranslated(7,70,"Clan Castle") _
								       ,GetTranslated(8,15,"Lightning Spell") _
								       ,GetTranslated(8,16,"Healing Spell") _
								       ,GetTranslated(8,17,"Rage Spell") _
								       ,GetTranslated(8,18,"Jump Spell") _
								       ,GetTranslated(8,19,"Freeze Spell") _
								       ,GetTranslated(8,20,"Poison Spell") _
								       ,GetTranslated(8,21,"EarthQuake Spell") _
								       ,GetTranslated(8,22,"Haste Spell") _
								       ,$DeDeployEmptyString]

	Return $aTroopNames[$kind]
EndFunc

Func NameOfTroop($kind, $plurial = 0)
	Switch $kind
		Case $eBarb
			Return "Barbarians"
		Case $eArch
			Return "Archers"
		Case $eGobl
			Return "Goblins"
		Case $eGiant
			Return "Giants"
		Case $eWall
			Return "Wall Breakers"
		Case $eWiza
			Return "Wizards"
		Case $eBall
			Return "Balloons"
	    Case $eHeal
			Return "Healers"
	    Case $eDrag
			Return "Dragons"
	    Case $ePekk
			Return "Pekkas"
		Case $eMini
			Return "Minions"
		Case $eHogs
			Return "Hog Riders"
		Case $eValk
			Return "Valkyries"
		Case $eWitc
			Return "Witches"
		Case $eGole
			Return "Golems"
		Case $eLava
			Return "Lava Hounds"
		Case $eKing
			Return "King"
		Case $eQueen
			Return "Queen"
		Case $eCastle
			Return "Clan Castle"
		Case $eLSpell
			Return "Lightning Spells"
		Case $eHSpell
			Return "Heal Spells"
		Case $eRSpell
			Return "Rage Spells"
	    Case $eJSpell
			Return "Jump Spells"
		Case $eFSpell
			Return "Freeze Spells"
		Case $ePSpell
			Return "Poison Spells"
		Case $eESpell
			Return "Earthquake Spells"
		Case $eHaSpell
			Return "Haste Spells"
		Case $eWarden
			Return "Grand Warden"
		Case Else
			Return ""
	EndSwitch
EndFunc   ;==>NameOfTroop
