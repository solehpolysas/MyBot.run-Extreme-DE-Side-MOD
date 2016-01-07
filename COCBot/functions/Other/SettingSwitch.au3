Func switchRecSetting()
	Switch _GUICtrlComboBox_GetCurSel($cmbRecSetting)
	case 0 ;Custom
			Setlog("Settings changed to Custom mode")
	case 1 ;TH Snipe
		;Search
			GUICtrlSetState($chkDBEnableAfter, $GUI_UNCHECKED)
			_GUICtrlComboBox_SetCurSel($cmbSearchMode, 0)
			GUICtrlSetData ($txtDBMinGold,"999999")
			GUICtrlSetData ($txtDBMinElixir, "999999")
			_GUICtrlComboBox_SetCurSel($cmbDBMeetGE, 0)
			cmbDBGoldElixir()
			GUICtrlSetData ($txtDBMinDarkElixir, "0")
			GUICtrlSetState($chkDBMeetDE, $GUI_UNCHECKED)
			GUICtrlSetData ($txtDBMinTrophy, "0")
			GUICtrlSetState($chkDBMeetTrophy, $GUI_UNCHECKED)
			GUICtrlSetState($chkDBMeetTH, $GUI_UNCHECKED)
			GUICtrlSetState($chkDBMeetTHO, $GUI_UNCHECKED)
			GUICtrlSetState($chkDBWeakBase, $GUI_UNCHECKED)
			GUICtrlSetState($chkDBMeetOne, $GUI_UNCHECKED)
			GUICtrlSetState($chkSearchReduction, $GUI_UNCHECKED)
	;Attack Advanced
			GUICtrlSetState($chkTrophyMode, $GUI_CHECKED)
			GUICtrlSetState($chkAttackTH, $GUI_CHECKED)
			GUICtrlSetState($chkBullyMode, $GUI_UNCHECKED)
			GUICtrlSetData ($txtTHaddtiles, "1")
			_GUICtrlComboBox_SetCurSel($cmbAttackTHType, 3)
			_GUICtrlComboBox_SetCurSel($cmbTHSpellType, 1)
			_GUICtrlComboBox_SetCurSel($cmbAttackbottomType, 2)
			_GUICtrlComboBox_SetCurSel($cmbDetectTrapedTH, 1)
			GUICtrlSetState($chkUnbreakable, $GUI_UNCHECKED)
			$OptTrophyMode = 1
			_GUICtrlComboBox_SetCurSel($cmbTsSearchMode, 2)
	;Troop
			_GUICtrlComboBox_SetCurSel($cmbTroopComp, 9)
			GUICtrlSetData ($txtFullTroop, "90")
			GUICtrlSetData ($txtNumBarb, "40")
			GUICtrlSetData ($txtNumArch, "60")
			GUICtrlSetData ($txtNumGobl, "0")
			GUICtrlSetData ($txtNumGiant, "16")
			GUICtrlSetData ($txtNumWall, "0")
			GUICtrlSetData ($txtNumBall, "0")
			GUICtrlSetData ($txtNumWiza, "0")
			GUICtrlSetData ($txtNumHeal, "0")
			GUICtrlSetData ($txtNumDrag, "0")
			GUICtrlSetData ($txtNumPekk, "0")
			GUICtrlSetData ($txtNumMini, "0")
			GUICtrlSetData ($txtNumHogs, "0")
			GUICtrlSetData ($txtNumValk, "0")
			GUICtrlSetData ($txtNumGole, "0")
			GUICtrlSetData ($txtNumWitc, "0")
			GUICtrlSetData ($txtNumLava, "0")
			lblTotalCount()
	;Misc
			GUICtrlSetData ($txtdropTrophy, "5000")
			GUICtrlSetData ($txtMaxTrophy, "5000")
			GUICtrlSetState($chkTrophyHeroes, $GUI_CHECKED)
			GUICtrlSetState($chkTrophyAtkDead, $GUI_CHECKED)
			SetLog("Settings changed to Snipe only mode")

		Case 2 ;TH 8 (G + E)
	;Search
			GUICtrlSetState($chkDBEnableAfter, $GUI_UNCHECKED)
			_GUICtrlComboBox_SetCurSel($cmbSearchMode, 0)
			GUICtrlSetData ($txtDBMinGold,"120000")
			GUICtrlSetData ($txtDBMinElixir, "120000")
			_GUICtrlComboBox_SetCurSel($cmbDBMeetGE, 1)
			GUICtrlSetData ($txtDBMinDarkElixir, "0")
			GUICtrlSetState($chkDBMeetDE, $GUI_UNCHECKED)
			GUICtrlSetData ($txtDBMinTrophy, "0")
			GUICtrlSetState($chkDBMeetTrophy, $GUI_UNCHECKED)
			GUICtrlSetState($chkDBMeetTH, $GUI_UNCHECKED)
			GUICtrlSetState($chkDBMeetTHO, $GUI_UNCHECKED)
			GUICtrlSetState($chkDBWeakBase, $GUI_UNCHECKED)
			GUICtrlSetState($chkDBMeetOne, $GUI_UNCHECKED)
			GUICtrlSetState($chkSearchReduction, $GUI_CHECKED)
			GUICtrlSetData ($txtSearchReduceGold, "5000")
			GUICtrlSetData ($txtSearchReduceElixir, "5000")
			GUICtrlSetData ($txtSearchReduceGoldPlusElixir, "10000")
			GUICtrlSetData ($txtSearchReduceDark, "0")
			GUICtrlSetData ($txtSearchReduceTrophy, "0")
			cmbDBGoldElixir()
	;Attack
			_GUICtrlComboBox_SetCurSel($cmbDBDeploy, 4)
			_GUICtrlComboBox_SetCurSel($cmbDBUnitDelay, 0)
			_GUICtrlComboBox_SetCurSel($cmbDBWaveDelay, 0)
			GUICtrlSetState($chkDBSmartAttackRedArea, $GUI_UNCHECKED)
			GUICtrlSetState($chkDBKingAttack, $GUI_CHECKED)
			GUICtrlSetState($chkDBQueenAttack, $GUI_CHECKED)
			GUICtrlSetState($chkDBDropCC, $GUI_CHECKED)
			GUICtrlSetState($radAutoAbilities, $GUI_CHECKED)
	;Attack Advanced
			GUICtrlSetState($chkTrophyMode, $GUI_UNCHECKED)
			GUICtrlSetState($chkAttackTH, $GUI_UNCHECKED)
			GUICtrlSetState($chkBullyMode, $GUI_UNCHECKED)
			_GUICtrlComboBox_SetCurSel($cmbAttackTHType, 3)
		;	GUICtrlSetState($chkSpellNone, $GUI_UNCHECKED)
			_GUICtrlComboBox_SetCurSel($cmbTHSpellType, 1)
			_GUICtrlComboBox_SetCurSel($cmbAttackbottomType, 2)
			_GUICtrlComboBox_SetCurSel($cmbDetectTrapedTH, 1)
			GUICtrlSetState($chkUnbreakable, $GUI_UNCHECKED)
			$OptTrophyMode = 0
	;Troop
			_GUICtrlComboBox_SetCurSel($cmbTroopComp, 9)
			GUICtrlSetData ($txtFullTroop, "90")
			GUICtrlSetData ($txtNumBarb, "50")
			GUICtrlSetData ($txtNumArch, "50")
			GUICtrlSetData ($txtNumGobl, "0")
			GUICtrlSetData ($txtNumGiant, "0")
			GUICtrlSetData ($txtNumWall, "0")
			GUICtrlSetData ($txtNumBall, "0")
			GUICtrlSetData ($txtNumWiza, "0")
			GUICtrlSetData ($txtNumHeal, "0")
			GUICtrlSetData ($txtNumDrag, "0")
			GUICtrlSetData ($txtNumPekk, "0")
			GUICtrlSetData ($txtNumMini, "0")
			GUICtrlSetData ($txtNumHogs, "0")
			GUICtrlSetData ($txtNumValk, "0")
			GUICtrlSetData ($txtNumGole, "0")
			GUICtrlSetData ($txtNumWitc, "0")
			GUICtrlSetData ($txtNumLava, "0")
			lblTotalCount()
	;EndBattle
			GUICtrlSetState($chkTimeStopAtk, $GUI_CHECKED)
			GUICtrlSetState($chkTimeStopAtk2, $GUI_CHECKED)
			GUICtrlSetData ($txtMinGoldStopAtk2, "5000")
			GUICtrlSetData ($txtMinElixirStopAtk2, "5000")
			GUICtrlSetData ($txtMinDarkElixirStopAtk2, "50")
			GUICtrlSetState($chkEndNoResources, $GUI_CHECKED)
	;Misc
			GUICtrlSetData ($txtdropTrophy, "1200")
			GUICtrlSetData ($txtMaxTrophy, "1500")
			GUICtrlSetState($chkTrophyHeroes, $GUI_CHECKED)
			GUICtrlSetState($chkTrophyAtkDead, $GUI_CHECKED)

			SetLog("Settings changed to TownHall 8 (Gold + Elixir)")

		Case 3 ;TH 8 (G + E + DE)
	;Search
			GUICtrlSetState($chkDBEnableAfter, $GUI_UNCHECKED)
			GUICtrlSetState($chkABEnableAfter, $GUI_UNCHECKED)
			_GUICtrlComboBox_SetCurSel($cmbSearchMode, 2)
			GUICtrlSetData ($txtDBMinGoldPlusElixir, "250000")
			GUICtrlSetData ($txtABMinGoldPlusElixir, "0")
			GUICtrlSetData ($txtABMinGoldPlusElixirHero, "0")
			_GUICtrlComboBox_SetCurSel($cmbDBMeetGE, 2)
			GUICtrlSetData ($txtDBMinDarkElixir, "0")
			GUICtrlSetData ($txtABMinDarkElixir, "400")
			GUICtrlSetData ($txtABMinDarkElixirHero, "400")
			GUICtrlSetState($chkDBMeetDE, $GUI_UNCHECKED)
			GUICtrlSetState($chkABMeetDE, $GUI_CHECKED)
			GUICtrlSetState($chkABMeetDEHero, $GUI_CHECKED)
			GUICtrlSetData ($txtDBMinTrophy, "0")
			GUICtrlSetData ($txtABMinTrophy, "0")
			GUICtrlSetData ($txtABMinTrophyHero, "0")
			GUICtrlSetState($chkDBMeetTrophy, $GUI_UNCHECKED)
			GUICtrlSetState($chkABMeetTrophy, $GUI_UNCHECKED)
			GUICtrlSetState($chkABMeetTrophyHero, $GUI_UNCHECKED)
			GUICtrlSetState($chkDBMeetTH, $GUI_UNCHECKED)
			GUICtrlSetState($chkABMeetTH, $GUI_CHECKED)
			_GUICtrlComboBox_SetCurSel($cmbABTH, 2)
			GUICtrlSetState($chkABMeetTHHero, $GUI_CHECKED)
			_GUICtrlComboBox_SetCurSel($cmbABTHHero, 2)
			GUICtrlSetState($chkABMeetTHO, $GUI_UNCHECKED)
			GUICtrlSetState($chkABMeetTHOHero, $GUI_UNCHECKED)
			GUICtrlSetState($chkABWeakBase, $GUI_CHECKED)
			_GUICtrlComboBox_SetCurSel($cmbABWeakMortar, 5)
			_GUICtrlComboBox_SetCurSel($cmbABWeakWizTower, 5)
			GUICtrlSetState($chkABWeakBaseHero, $GUI_CHECKED)
			_GUICtrlComboBox_SetCurSel($cmbABWeakMortarHero, 5)
			_GUICtrlComboBox_SetCurSel($cmbABWeakWizTowerHero, 5)
			GUICtrlSetState($chkDBMeetOne, $GUI_UNCHECKED)
			GUICtrlSetState($chkABMeetOne, $GUI_UNCHECKED)
			GUICtrlSetState($chkABMeetOneHero, $GUI_UNCHECKED)
			GUICtrlSetState($chkSearchReduction, $GUI_CHECKED)
			GUICtrlSetData ($txtSearchReduceGold, "5000")
			GUICtrlSetData ($txtSearchReduceElixir, "5000")
			GUICtrlSetData ($txtSearchReduceGoldPlusElixir, "10000")
			GUICtrlSetData ($txtSearchReduceDark, "0")
			GUICtrlSetData ($txtSearchReduceTrophy, "0")
			GUICtrlSetState($chkLBBKFilter, $GUI_UNCHECKED)
			GUICtrlSetState($chkLBAQFilter, $GUI_UNCHECKED)
			cmbDBGoldElixir()
			cmbABGoldElixir()
			cmbABGoldElixirHero()
	;Attack
			_GUICtrlComboBox_SetCurSel($cmbDBDeploy, 4)
			_GUICtrlComboBox_SetCurSel($cmbDBUnitDelay, 0)
			_GUICtrlComboBox_SetCurSel($cmbDBWaveDelay, 0)
			GUICtrlSetState($chkDBSmartAttackRedArea, $GUI_UNCHECKED)
			GUICtrlSetState($chkDBKingAttack, $GUI_CHECKED)
			GUICtrlSetState($chkDBQueenAttack, $GUI_CHECKED)
			GUICtrlSetState($chkDBDropCC, $GUI_CHECKED)
			_GUICtrlComboBox_SetCurSel($cmbABDeploy, 5)
			_GUICtrlComboBox_SetCurSel($cmbABUnitDelay, 3)
			_GUICtrlComboBox_SetCurSel($cmbABWaveDelay, 7)
			GUICtrlSetState($chkABSmartAttackRedArea, $GUI_UNCHECKED)
			GUICtrlSetState($chkABKingAttack, $GUI_CHECKED)
			GUICtrlSetState($chkABQueenAttack, $GUI_CHECKED)
			GUICtrlSetState($chkABDropCC, $GUI_CHECKED)
			GUICtrlSetState($radAutoAbilities, $GUI_CHECKED)

	;Attack Advanced
			GUICtrlSetState($chkTrophyMode, $GUI_UNCHECKED)
			GUICtrlSetState($chkAttackTH, $GUI_UNCHECKED)
			GUICtrlSetState($chkBullyMode, $GUI_UNCHECKED)
			_GUICtrlComboBox_SetCurSel($cmbAttackTHType, 3)
	;		GUICtrlSetState($chkSpellNone, $GUI_UNCHECKED)
			_GUICtrlComboBox_SetCurSel($cmbTHSpellType, 1)
			_GUICtrlComboBox_SetCurSel($cmbAttackbottomType, 2)
			_GUICtrlComboBox_SetCurSel($cmbDetectTrapedTH, 1)
			GUICtrlSetState($chkUnbreakable, $GUI_UNCHECKED)
			$OptTrophyMode = 0
	;Troop
			_GUICtrlComboBox_SetCurSel($cmbTroopComp, 9)
			GUICtrlSetData ($txtFullTroop, "90")
			GUICtrlSetData ($txtNumBarb, "40")
			GUICtrlSetData ($txtNumArch, "60")
			GUICtrlSetData ($txtNumGobl, "0")
			GUICtrlSetData ($txtNumGiant, "12")
			GUICtrlSetData ($txtNumWall, "8")
			GUICtrlSetData ($txtNumBall, "0")
			GUICtrlSetData ($txtNumWiza, "0")
			GUICtrlSetData ($txtNumHeal, "0")
			GUICtrlSetData ($txtNumDrag, "0")
			GUICtrlSetData ($txtNumPekk, "0")
			GUICtrlSetData ($txtNumMini, "0")
			GUICtrlSetData ($txtNumHogs, "0")
			GUICtrlSetData ($txtNumValk, "0")
			GUICtrlSetData ($txtNumGole, "0")
			GUICtrlSetData ($txtNumWitc, "0")
			GUICtrlSetData ($txtNumLava, "0")
			lblTotalCount()
	;EndBattle
			GUICtrlSetState($chkTimeStopAtk, $GUI_CHECKED)
			GUICtrlSetState($chkTimeStopAtk2, $GUI_CHECKED)
			GUICtrlSetData ($txtMinGoldStopAtk2, "5000")
			GUICtrlSetData ($txtMinElixirStopAtk2, "5000")
			GUICtrlSetData ($txtMinDarkElixirStopAtk2, "50")
			GUICtrlSetState($chkEndNoResources, $GUI_CHECKED)
			GUICtrlSetState($chkDESideEB, $GUI_CHECKED)
			GUICtrlSetData ($txtDELowEndMin, "10")
			GUICtrlSetState($chkDisableOtherEBO, $GUI_CHECKED)
			GUICtrlSetState($chkDEEndOneStar, $GUI_CHECKED)
	;Misc
			GUICtrlSetData ($txtdropTrophy, "1500")
			GUICtrlSetData ($txtMaxTrophy, "1700")
			GUICtrlSetState($chkTrophyHeroes, $GUI_CHECKED)
			GUICtrlSetState($chkTrophyAtkDead, $GUI_CHECKED)

			SetLog("Your settings have been changed to TownHall 8 (Gold + Elixir + Dark Elixir)")
		Case 4 ;TH 8 (DE)
	;Search
			GUICtrlSetState($chkABEnableAfter, $GUI_UNCHECKED)
			_GUICtrlComboBox_SetCurSel($cmbSearchMode, 1)
			GUICtrlSetData ($txtABMinGoldPlusElixir, "0")
			GUICtrlSetData ($txtABMinGoldPlusElixirHero, "0")
			GUICtrlSetData ($txtABMinDarkElixir, "400")
			GUICtrlSetData ($txtABMinDarkElixirHero, "400")
			GUICtrlSetState($chkABMeetDE, $GUI_CHECKED)
			GUICtrlSetState($chkABMeetDEHero, $GUI_CHECKED)
			GUICtrlSetData ($txtABMinTrophy, "0")
			GUICtrlSetData ($txtABMinTrophyHero, "0")
			GUICtrlSetState($chkABMeetTrophy, $GUI_UNCHECKED)
			GUICtrlSetState($chkABMeetTrophyHero, $GUI_UNCHECKED)
			GUICtrlSetState($chkABMeetTH, $GUI_CHECKED)
			_GUICtrlComboBox_SetCurSel($cmbABTH, 2)
			GUICtrlSetState($chkABMeetTHHero, $GUI_CHECKED)
			_GUICtrlComboBox_SetCurSel($cmbABTHHero, 2)
			GUICtrlSetState($chkABMeetTHO, $GUI_UNCHECKED)
			GUICtrlSetState($chkABMeetTHOHero, $GUI_UNCHECKED)
			GUICtrlSetState($chkABWeakBase, $GUI_CHECKED)
			_GUICtrlComboBox_SetCurSel($cmbABWeakMortar, 5)
			_GUICtrlComboBox_SetCurSel($cmbABWeakWizTower, 5)
			GUICtrlSetState($chkABWeakBaseHero, $GUI_CHECKED)
			_GUICtrlComboBox_SetCurSel($cmbABWeakMortarHero, 5)
			_GUICtrlComboBox_SetCurSel($cmbABWeakWizTowerHero, 5)
			GUICtrlSetState($chkABMeetOne, $GUI_UNCHECKED)
			GUICtrlSetState($chkABMeetOneHero, $GUI_UNCHECKED)
			GUICtrlSetState($chkSearchReduction, $GUI_CHECKED)
			GUICtrlSetData ($txtSearchReduceGold, "5000")
			GUICtrlSetData ($txtSearchReduceElixir, "5000")
			GUICtrlSetData ($txtSearchReduceGoldPlusElixir, "10000")
			GUICtrlSetData ($txtSearchReduceDark, "0")
			GUICtrlSetData ($txtSearchReduceTrophy, "0")
			GUICtrlSetState($chkLBBKFilter, $GUI_UNCHECKED)
			GUICtrlSetState($chkLBAQFilter, $GUI_UNCHECKED)
			cmbABGoldElixir()
			cmbABGoldElixirHero()
	;Attack
			_GUICtrlComboBox_SetCurSel($cmbABDeploy, 5)
			_GUICtrlComboBox_SetCurSel($cmbABUnitDelay, 3)
			_GUICtrlComboBox_SetCurSel($cmbABWaveDelay, 7)
			GUICtrlSetState($chkABSmartAttackRedArea, $GUI_UNCHECKED)
			GUICtrlSetState($chkABKingAttack, $GUI_CHECKED)
			GUICtrlSetState($chkABQueenAttack, $GUI_CHECKED)
			GUICtrlSetState($chkABDropCC, $GUI_CHECKED)
			GUICtrlSetState($radAutoAbilities, $GUI_CHECKED)

	;Attack Advanced
			GUICtrlSetState($chkTrophyMode, $GUI_UNCHECKED)
			GUICtrlSetState($chkAttackTH, $GUI_UNCHECKED)
			GUICtrlSetState($chkBullyMode, $GUI_UNCHECKED)
			_GUICtrlComboBox_SetCurSel($cmbAttackTHType, 3)

			_GUICtrlComboBox_SetCurSel($cmbTHSpellType, 1)
			_GUICtrlComboBox_SetCurSel($cmbAttackbottomType, 2)
			_GUICtrlComboBox_SetCurSel($cmbDetectTrapedTH, 1)
			GUICtrlSetState($chkUnbreakable, $GUI_UNCHECKED)
			$OptTrophyMode = 0
	;Troop
			_GUICtrlComboBox_SetCurSel($cmbTroopComp, 9)
			GUICtrlSetData ($txtFullTroop, "90")
			GUICtrlSetData ($txtNumBarb, "40")
			GUICtrlSetData ($txtNumArch, "60")
			GUICtrlSetData ($txtNumGobl, "0")
			GUICtrlSetData ($txtNumGiant, "12")
			GUICtrlSetData ($txtNumWall, "8")
			GUICtrlSetData ($txtNumBall, "0")
			GUICtrlSetData ($txtNumWiza, "0")
			GUICtrlSetData ($txtNumHeal, "0")
			GUICtrlSetData ($txtNumDrag, "0")
			GUICtrlSetData ($txtNumPekk, "0")
			GUICtrlSetData ($txtNumMini, "0")
			GUICtrlSetData ($txtNumHogs, "0")
			GUICtrlSetData ($txtNumValk, "0")
			GUICtrlSetData ($txtNumGole, "0")
			GUICtrlSetData ($txtNumWitc, "0")
			GUICtrlSetData ($txtNumLava, "0")
			lblTotalCount()
	;EndBattle
			GUICtrlSetState($chkTimeStopAtk, $GUI_CHECKED)
			GUICtrlSetState($chkTimeStopAtk2, $GUI_CHECKED)
			GUICtrlSetData ($txtMinGoldStopAtk2, "5000")
			GUICtrlSetData ($txtMinElixirStopAtk2, "5000")
			GUICtrlSetData ($txtMinDarkElixirStopAtk2, "50")
			GUICtrlSetState($chkEndNoResources, $GUI_CHECKED)
			GUICtrlSetState($chkDESideEB, $GUI_CHECKED)
			GUICtrlSetData ($txtDELowEndMin, "10")
			GUICtrlSetState($chkDisableOtherEBO, $GUI_CHECKED)
			GUICtrlSetState($chkDEEndOneStar, $GUI_CHECKED)
	;Misc
			GUICtrlSetData ($txtdropTrophy, "1500")
			GUICtrlSetData ($txtMaxTrophy, "1700")
			GUICtrlSetState($chkTrophyHeroes, $GUI_CHECKED)
			GUICtrlSetState($chkTrophyAtkDead, $GUI_CHECKED)

			SetLog("Settings changed to TownHall 8 (Dark Elixir)")
		Case 5 ;TH 9 (G + E)
	;Search
			GUICtrlSetState($chkDBEnableAfter, $GUI_UNCHECKED)
			_GUICtrlComboBox_SetCurSel($cmbSearchMode, 0)
			GUICtrlSetData ($txtDBMinGold,"120000")
			GUICtrlSetData ($txtDBMinElixir, "120000")
			_GUICtrlComboBox_SetCurSel($cmbDBMeetGE, 1)
			GUICtrlSetData ($txtDBMinDarkElixir, "0")
			GUICtrlSetState($chkDBMeetDE, $GUI_UNCHECKED)
			GUICtrlSetData ($txtDBMinTrophy, "0")
			GUICtrlSetState($chkDBMeetTrophy, $GUI_UNCHECKED)
			GUICtrlSetState($chkDBMeetTH, $GUI_UNCHECKED)
			GUICtrlSetState($chkDBMeetTHO, $GUI_UNCHECKED)
			GUICtrlSetState($chkDBWeakBase, $GUI_UNCHECKED)
			GUICtrlSetState($chkDBMeetOne, $GUI_UNCHECKED)
			GUICtrlSetState($chkSearchReduction, $GUI_CHECKED)
			GUICtrlSetData ($txtSearchReduceGold, "5000")
			GUICtrlSetData ($txtSearchReduceElixir, "5000")
			GUICtrlSetData ($txtSearchReduceGoldPlusElixir, "10000")
			GUICtrlSetData ($txtSearchReduceDark, "0")
			GUICtrlSetData ($txtSearchReduceTrophy, "0")
			cmbDBGoldElixir()
	;Attack
			_GUICtrlComboBox_SetCurSel($cmbDBDeploy, 4)
			_GUICtrlComboBox_SetCurSel($cmbDBUnitDelay, 0)
			_GUICtrlComboBox_SetCurSel($cmbDBWaveDelay, 0)
			GUICtrlSetState($chkDBSmartAttackRedArea, $GUI_UNCHECKED)
			GUICtrlSetState($chkDBKingAttack, $GUI_CHECKED)
			GUICtrlSetState($chkDBQueenAttack, $GUI_CHECKED)
			GUICtrlSetState($chkDBDropCC, $GUI_CHECKED)
			GUICtrlSetState($radAutoAbilities, $GUI_CHECKED)
	;Attack Advanced
			GUICtrlSetState($chkTrophyMode, $GUI_UNCHECKED)
			GUICtrlSetState($chkAttackTH, $GUI_UNCHECKED)
			GUICtrlSetState($chkBullyMode, $GUI_UNCHECKED)
			_GUICtrlComboBox_SetCurSel($cmbAttackTHType, 3)

			_GUICtrlComboBox_SetCurSel($cmbTHSpellType, 1)
			_GUICtrlComboBox_SetCurSel($cmbAttackbottomType, 2)
			_GUICtrlComboBox_SetCurSel($cmbDetectTrapedTH, 1)
			GUICtrlSetState($chkUnbreakable, $GUI_UNCHECKED)
			$OptTrophyMode = 0
	;Troop
			_GUICtrlComboBox_SetCurSel($cmbTroopComp, 9)
			GUICtrlSetData ($txtFullTroop, "90")
			GUICtrlSetData ($txtNumBarb, "50")
			GUICtrlSetData ($txtNumArch, "50")
			GUICtrlSetData ($txtNumGobl, "0")
			GUICtrlSetData ($txtNumGiant, "0")
			GUICtrlSetData ($txtNumWall, "0")
			GUICtrlSetData ($txtNumBall, "0")
			GUICtrlSetData ($txtNumWiza, "0")
			GUICtrlSetData ($txtNumHeal, "0")
			GUICtrlSetData ($txtNumDrag, "0")
			GUICtrlSetData ($txtNumPekk, "0")
			GUICtrlSetData ($txtNumMini, "0")
			GUICtrlSetData ($txtNumHogs, "0")
			GUICtrlSetData ($txtNumValk, "0")
			GUICtrlSetData ($txtNumGole, "0")
			GUICtrlSetData ($txtNumWitc, "0")
			GUICtrlSetData ($txtNumLava, "0")
			lblTotalCount()
	;EndBattle
			GUICtrlSetState($chkTimeStopAtk, $GUI_CHECKED)
			GUICtrlSetState($chkTimeStopAtk2, $GUI_CHECKED)
			GUICtrlSetData ($txtMinGoldStopAtk2, "5000")
			GUICtrlSetData ($txtMinElixirStopAtk2, "5000")
			GUICtrlSetData ($txtMinDarkElixirStopAtk2, "50")
			GUICtrlSetState($chkEndNoResources, $GUI_CHECKED)
	;Misc
			GUICtrlSetData ($txtdropTrophy, "1600")
			GUICtrlSetData ($txtMaxTrophy, "1800")
			GUICtrlSetState($chkTrophyHeroes, $GUI_CHECKED)
			GUICtrlSetState($chkTrophyAtkDead, $GUI_CHECKED)

			SetLog("Settings changed to TownHall 9 (Gold + Elixir)")
		Case 6 ;TH 9 (G + E + DE)
	;Search
			GUICtrlSetState($chkDBEnableAfter, $GUI_UNCHECKED)
			GUICtrlSetState($chkABEnableAfter, $GUI_UNCHECKED)
			_GUICtrlComboBox_SetCurSel($cmbSearchMode, 2)
			GUICtrlSetData ($txtDBMinGoldPlusElixir, "250000")
			GUICtrlSetData ($txtABMinGoldPlusElixir, "0")
			GUICtrlSetData ($txtABMinGoldPlusElixirHero, "0")
			_GUICtrlComboBox_SetCurSel($cmbDBMeetGE, 2)
			GUICtrlSetData ($txtDBMinDarkElixir, "0")
			GUICtrlSetData ($txtABMinDarkElixir, "1000")
			GUICtrlSetData ($txtABMinDarkElixirHero, "1000")
			GUICtrlSetState($chkDBMeetDE, $GUI_UNCHECKED)
			GUICtrlSetState($chkABMeetDE, $GUI_CHECKED)
			GUICtrlSetState($chkABMeetDEHero, $GUI_CHECKED)
			GUICtrlSetData ($txtDBMinTrophy, "0")
			GUICtrlSetData ($txtABMinTrophy, "0")
			GUICtrlSetData ($txtABMinTrophyHero, "0")
			GUICtrlSetState($chkDBMeetTrophy, $GUI_UNCHECKED)
			GUICtrlSetState($chkABMeetTrophy, $GUI_UNCHECKED)
			GUICtrlSetState($chkABMeetTrophyHero, $GUI_UNCHECKED)
			GUICtrlSetState($chkDBMeetTH, $GUI_UNCHECKED)
			GUICtrlSetState($chkABMeetTH, $GUI_CHECKED)
			_GUICtrlComboBox_SetCurSel($cmbABTH, 2)
			GUICtrlSetState($chkABMeetTHHero, $GUI_CHECKED)
			_GUICtrlComboBox_SetCurSel($cmbABTHHero, 2)
			GUICtrlSetState($chkDBMeetTHO, $GUI_UNCHECKED)
			GUICtrlSetState($chkABMeetTHO, $GUI_UNCHECKED)
			GUICtrlSetState($chkABMeetTHOHero, $GUI_UNCHECKED)
			GUICtrlSetState($chkDBWeakBase, $GUI_UNCHECKED)
			GUICtrlSetState($chkABWeakBase, $GUI_UNCHECKED)
			GUICtrlSetState($chkABWeakBaseHero, $GUI_UNCHECKED)
			GUICtrlSetState($chkDBMeetOne, $GUI_UNCHECKED)
			GUICtrlSetState($chkABMeetOne, $GUI_UNCHECKED)
			GUICtrlSetState($chkABMeetOneHero, $GUI_UNCHECKED)
			GUICtrlSetState($chkSearchReduction, $GUI_CHECKED)
			GUICtrlSetData ($txtSearchReduceGold, "5000")
			GUICtrlSetData ($txtSearchReduceElixir, "5000")
			GUICtrlSetData ($txtSearchReduceGoldPlusElixir, "10000")
			GUICtrlSetData ($txtSearchReduceDark, "0")
			GUICtrlSetData ($txtSearchReduceTrophy, "0")
			GUICtrlSetState($chkLBBKFilter, $GUI_UNCHECKED)
			GUICtrlSetState($chkLBAQFilter, $GUI_UNCHECKED)
			cmbDBGoldElixir()
			cmbABGoldElixir()
			cmbABGoldElixirHero()
	;Attack
			_GUICtrlComboBox_SetCurSel($cmbDBDeploy, 4)
			_GUICtrlComboBox_SetCurSel($cmbDBUnitDelay, 0)
			_GUICtrlComboBox_SetCurSel($cmbDBWaveDelay, 0)
			GUICtrlSetState($chkDBSmartAttackRedArea, $GUI_UNCHECKED)
			GUICtrlSetState($chkDBKingAttack, $GUI_CHECKED)
			GUICtrlSetState($chkDBQueenAttack, $GUI_CHECKED)
			GUICtrlSetState($chkDBDropCC, $GUI_CHECKED)
			_GUICtrlComboBox_SetCurSel($cmbABDeploy, 5)
			_GUICtrlComboBox_SetCurSel($cmbABUnitDelay, 3)
			_GUICtrlComboBox_SetCurSel($cmbABWaveDelay, 7)
			GUICtrlSetState($chkABSmartAttackRedArea, $GUI_UNCHECKED)
			GUICtrlSetState($chkABKingAttack, $GUI_CHECKED)
			GUICtrlSetState($chkABQueenAttack, $GUI_CHECKED)
			GUICtrlSetState($chkABDropCC, $GUI_CHECKED)
			GUICtrlSetState($radAutoAbilities, $GUI_CHECKED)

	;Attack Advanced
			GUICtrlSetState($chkTrophyMode, $GUI_UNCHECKED)
			GUICtrlSetState($chkAttackTH, $GUI_UNCHECKED)
			GUICtrlSetState($chkBullyMode, $GUI_UNCHECKED)
			_GUICtrlComboBox_SetCurSel($cmbAttackTHType, 3)
			;GUICtrlSetState($chkSpellNone, $GUI_UNCHECKED)
			_GUICtrlComboBox_SetCurSel($cmbTHSpellType, 1)
			_GUICtrlComboBox_SetCurSel($cmbAttackbottomType, 2)
			_GUICtrlComboBox_SetCurSel($cmbDetectTrapedTH, 1)
			GUICtrlSetState($chkUnbreakable, $GUI_UNCHECKED)
			$OptTrophyMode = 0
	;Troop
			_GUICtrlComboBox_SetCurSel($cmbTroopComp, 9)
			GUICtrlSetData ($txtFullTroop, "90")
			GUICtrlSetData ($txtNumBarb, "40")
			GUICtrlSetData ($txtNumArch, "60")
			GUICtrlSetData ($txtNumGobl, "0")
			GUICtrlSetData ($txtNumGiant, "12")
			GUICtrlSetData ($txtNumWall, "8")
			GUICtrlSetData ($txtNumBall, "0")
			GUICtrlSetData ($txtNumWiza, "0")
			GUICtrlSetData ($txtNumHeal, "0")
			GUICtrlSetData ($txtNumDrag, "0")
			GUICtrlSetData ($txtNumPekk, "0")
			GUICtrlSetData ($txtNumMini, "0")
			GUICtrlSetData ($txtNumHogs, "0")
			GUICtrlSetData ($txtNumValk, "0")
			GUICtrlSetData ($txtNumGole, "0")
			GUICtrlSetData ($txtNumWitc, "0")
			GUICtrlSetData ($txtNumLava, "0")
			lblTotalCount()
	;EndBattle
			GUICtrlSetState($chkTimeStopAtk, $GUI_CHECKED)
			GUICtrlSetState($chkTimeStopAtk2, $GUI_CHECKED)
			GUICtrlSetData ($txtMinGoldStopAtk2, "5000")
			GUICtrlSetData ($txtMinElixirStopAtk2, "5000")
			GUICtrlSetData ($txtMinDarkElixirStopAtk2, "50")
			GUICtrlSetState($chkEndNoResources, $GUI_CHECKED)
			GUICtrlSetState($chkDESideEB, $GUI_CHECKED)
			GUICtrlSetData ($txtDELowEndMin, "10")
			GUICtrlSetState($chkDisableOtherEBO, $GUI_CHECKED)
			GUICtrlSetState($chkDEEndOneStar, $GUI_CHECKED)
	;Misc
			GUICtrlSetData ($txtdropTrophy, "1800")
			GUICtrlSetData ($txtMaxTrophy, "2000")
			GUICtrlSetState($chkTrophyHeroes, $GUI_CHECKED)
			GUICtrlSetState($chkTrophyAtkDead, $GUI_CHECKED)

			SetLog("Your settings have been changed to TownHall 9 (Gold + Elixir + Dark Elixir)")
		Case 7 ;TH 9 (DE)
	;Search
			GUICtrlSetState($chkABEnableAfter, $GUI_UNCHECKED)
			_GUICtrlComboBox_SetCurSel($cmbSearchMode, 1)
			GUICtrlSetData ($txtABMinGoldPlusElixir, "0")
			GUICtrlSetData ($txtABMinGoldPlusElixirHero, "0")
			GUICtrlSetData ($txtABMinDarkElixir, "1000")
			GUICtrlSetData ($txtABMinDarkElixirHero, "1000")
			GUICtrlSetState($chkABMeetDE, $GUI_CHECKED)
			GUICtrlSetState($chkABMeetDEHero, $GUI_CHECKED)
			GUICtrlSetData ($txtABMinTrophy, "0")
			GUICtrlSetData ($txtABMinTrophyHero, "0")
			GUICtrlSetState($chkABMeetTrophy, $GUI_UNCHECKED)
			GUICtrlSetState($chkABMeetTrophyHero, $GUI_UNCHECKED)
			GUICtrlSetState($chkABMeetTH, $GUI_CHECKED)
			_GUICtrlComboBox_SetCurSel($cmbABTH, 2)
			GUICtrlSetState($chkABMeetTHHero, $GUI_CHECKED)
			_GUICtrlComboBox_SetCurSel($cmbABTHHero, 2)
			GUICtrlSetState($chkABMeetTHO, $GUI_UNCHECKED)
			GUICtrlSetState($chkABMeetTHOHero, $GUI_UNCHECKED)
			GUICtrlSetState($chkABWeakBase, $GUI_UNCHECKED)
			GUICtrlSetState($chkABWeakBaseHero, $GUI_UNCHECKED)
			GUICtrlSetState($chkABMeetOne, $GUI_UNCHECKED)
			GUICtrlSetState($chkABMeetOneHero, $GUI_UNCHECKED)
			GUICtrlSetState($chkSearchReduction, $GUI_CHECKED)
			GUICtrlSetData ($txtSearchReduceGold, "5000")
			GUICtrlSetData ($txtSearchReduceElixir, "5000")
			GUICtrlSetData ($txtSearchReduceGoldPlusElixir, "10000")
			GUICtrlSetData ($txtSearchReduceDark, "0")
			GUICtrlSetData ($txtSearchReduceTrophy, "0")
			GUICtrlSetState($chkLBBKFilter, $GUI_UNCHECKED)
			GUICtrlSetState($chkLBAQFilter, $GUI_UNCHECKED)
			cmbABGoldElixir()
			cmbABGoldElixirHero()
	;Attack
			_GUICtrlComboBox_SetCurSel($cmbABDeploy, 5)
			_GUICtrlComboBox_SetCurSel($cmbABUnitDelay, 3)
			_GUICtrlComboBox_SetCurSel($cmbABWaveDelay, 7)
			GUICtrlSetState($chkABSmartAttackRedArea, $GUI_UNCHECKED)
			GUICtrlSetState($chkABKingAttack, $GUI_CHECKED)
			GUICtrlSetState($chkABQueenAttack, $GUI_CHECKED)
			GUICtrlSetState($chkABDropCC, $GUI_CHECKED)
			GUICtrlSetState($radAutoAbilities, $GUI_CHECKED)
	;Attack Advanced
			GUICtrlSetState($chkTrophyMode, $GUI_UNCHECKED)
			GUICtrlSetState($chkAttackTH, $GUI_UNCHECKED)
			GUICtrlSetState($chkBullyMode, $GUI_UNCHECKED)
			_GUICtrlComboBox_SetCurSel($cmbAttackTHType, 3)
		;	GUICtrlSetState($chkSpellNone, $GUI_UNCHECKED)
			_GUICtrlComboBox_SetCurSel($cmbTHSpellType, 1)
			_GUICtrlComboBox_SetCurSel($cmbAttackbottomType, 2)
			_GUICtrlComboBox_SetCurSel($cmbDetectTrapedTH, 1)
			GUICtrlSetState($chkUnbreakable, $GUI_UNCHECKED)
			$OptTrophyMode = 0
	;Troop
			_GUICtrlComboBox_SetCurSel($cmbTroopComp, 9)
			GUICtrlSetData ($txtFullTroop, "90")
			GUICtrlSetData ($txtNumBarb, "40")
			GUICtrlSetData ($txtNumArch, "60")
			GUICtrlSetData ($txtNumGobl, "0")
			GUICtrlSetData ($txtNumGiant, "12")
			GUICtrlSetData ($txtNumWall, "8")
			GUICtrlSetData ($txtNumBall, "0")
			GUICtrlSetData ($txtNumWiza, "0")
			GUICtrlSetData ($txtNumHeal, "0")
			GUICtrlSetData ($txtNumDrag, "0")
			GUICtrlSetData ($txtNumPekk, "0")
			GUICtrlSetData ($txtNumMini, "0")
			GUICtrlSetData ($txtNumHogs, "0")
			GUICtrlSetData ($txtNumValk, "0")
			GUICtrlSetData ($txtNumGole, "0")
			GUICtrlSetData ($txtNumWitc, "0")
			GUICtrlSetData ($txtNumLava, "0")
			lblTotalCount()
	;EndBattle
			GUICtrlSetState($chkTimeStopAtk, $GUI_CHECKED)
			GUICtrlSetState($chkTimeStopAtk2, $GUI_CHECKED)
			GUICtrlSetData ($txtMinGoldStopAtk2, "5000")
			GUICtrlSetData ($txtMinElixirStopAtk2, "5000")
			GUICtrlSetData ($txtMinDarkElixirStopAtk2, "50")
			GUICtrlSetState($chkEndNoResources, $GUI_CHECKED)
			GUICtrlSetState($chkDESideEB, $GUI_CHECKED)
			GUICtrlSetData ($txtDELowEndMin, "10")
			GUICtrlSetState($chkDisableOtherEBO, $GUI_CHECKED)
			GUICtrlSetState($chkDEEndOneStar, $GUI_CHECKED)
	;Misc
			GUICtrlSetData ($txtdropTrophy, "1800")
			GUICtrlSetData ($txtMaxTrophy, "2000")
			GUICtrlSetState($chkTrophyHeroes, $GUI_CHECKED)
			GUICtrlSetState($chkTrophyAtkDead, $GUI_CHECKED)

			SetLog("Settings changed to TownHall 9 (Dark Elixir)")
		Case 8 ;TH 10 (G + E)
	;Search
			GUICtrlSetState($chkDBEnableAfter, $GUI_UNCHECKED)
			_GUICtrlComboBox_SetCurSel($cmbSearchMode, 0)
			GUICtrlSetData ($txtDBMinGold,"120000")
			GUICtrlSetData ($txtDBMinElixir, "120000")
			_GUICtrlComboBox_SetCurSel($cmbDBMeetGE, 1)
			GUICtrlSetData ($txtDBMinDarkElixir, "0")
			GUICtrlSetState($chkDBMeetDE, $GUI_UNCHECKED)
			GUICtrlSetData ($txtDBMinTrophy, "0")
			GUICtrlSetState($chkDBMeetTrophy, $GUI_UNCHECKED)
			GUICtrlSetState($chkDBMeetTH, $GUI_UNCHECKED)
			GUICtrlSetState($chkDBMeetTHO, $GUI_UNCHECKED)
			GUICtrlSetState($chkDBWeakBase, $GUI_UNCHECKED)
			GUICtrlSetState($chkDBMeetOne, $GUI_UNCHECKED)
			GUICtrlSetState($chkSearchReduction, $GUI_CHECKED)
			GUICtrlSetData ($txtSearchReduceGold, "5000")
			GUICtrlSetData ($txtSearchReduceElixir, "5000")
			GUICtrlSetData ($txtSearchReduceGoldPlusElixir, "10000")
			GUICtrlSetData ($txtSearchReduceDark, "0")
			GUICtrlSetData ($txtSearchReduceTrophy, "0")
			cmbDBGoldElixir()
	;Attack
			_GUICtrlComboBox_SetCurSel($cmbDBDeploy, 4)
			_GUICtrlComboBox_SetCurSel($cmbDBUnitDelay, 0)
			_GUICtrlComboBox_SetCurSel($cmbDBWaveDelay, 0)
			GUICtrlSetState($chkDBSmartAttackRedArea, $GUI_UNCHECKED)
			GUICtrlSetState($chkDBKingAttack, $GUI_CHECKED)
			GUICtrlSetState($chkDBQueenAttack, $GUI_CHECKED)
			GUICtrlSetState($chkDBDropCC, $GUI_CHECKED)
			GUICtrlSetState($radAutoAbilities, $GUI_CHECKED)
	;Attack Advanced
			GUICtrlSetState($chkTrophyMode, $GUI_UNCHECKED)
			GUICtrlSetState($chkAttackTH, $GUI_UNCHECKED)
			GUICtrlSetState($chkBullyMode, $GUI_UNCHECKED)
			_GUICtrlComboBox_SetCurSel($cmbAttackTHType, 3)
		;	GUICtrlSetState($chkSpellNone, $GUI_UNCHECKED)
			_GUICtrlComboBox_SetCurSel($cmbTHSpellType, 1)
			_GUICtrlComboBox_SetCurSel($cmbAttackbottomType, 2)
			_GUICtrlComboBox_SetCurSel($cmbDetectTrapedTH, 1)
			GUICtrlSetState($chkUnbreakable, $GUI_UNCHECKED)
			$OptTrophyMode = 0
	;Troop
			_GUICtrlComboBox_SetCurSel($cmbTroopComp, 9)
			GUICtrlSetData ($txtFullTroop, "90")
			GUICtrlSetData ($txtNumBarb, "50")
			GUICtrlSetData ($txtNumArch, "50")
			GUICtrlSetData ($txtNumGobl, "0")
			GUICtrlSetData ($txtNumGiant, "0")
			GUICtrlSetData ($txtNumWall, "0")
			GUICtrlSetData ($txtNumBall, "0")
			GUICtrlSetData ($txtNumWiza, "0")
			GUICtrlSetData ($txtNumHeal, "0")
			GUICtrlSetData ($txtNumDrag, "0")
			GUICtrlSetData ($txtNumPekk, "0")
			GUICtrlSetData ($txtNumMini, "0")
			GUICtrlSetData ($txtNumHogs, "0")
			GUICtrlSetData ($txtNumValk, "0")
			GUICtrlSetData ($txtNumGole, "0")
			GUICtrlSetData ($txtNumWitc, "0")
			GUICtrlSetData ($txtNumLava, "0")
			lblTotalCount()
	;EndBattle
			GUICtrlSetState($chkTimeStopAtk, $GUI_CHECKED)
			GUICtrlSetState($chkTimeStopAtk2, $GUI_CHECKED)
			GUICtrlSetData ($txtMinGoldStopAtk2, "5000")
			GUICtrlSetData ($txtMinElixirStopAtk2, "5000")
			GUICtrlSetData ($txtMinDarkElixirStopAtk2, "50")
			GUICtrlSetState($chkEndNoResources, $GUI_CHECKED)
	;Misc
			GUICtrlSetData ($txtdropTrophy, "1600")
			GUICtrlSetData ($txtMaxTrophy, "1800")
			GUICtrlSetState($chkTrophyHeroes, $GUI_CHECKED)
			GUICtrlSetState($chkTrophyAtkDead, $GUI_CHECKED)

			SetLog("Settings changed to TownHall 10 (Gold + Elixir)")
		Case 9 ;TH 10 (G + E + DE)
	;Search
			GUICtrlSetState($chkDBEnableAfter, $GUI_UNCHECKED)
			GUICtrlSetState($chkABEnableAfter, $GUI_UNCHECKED)
			_GUICtrlComboBox_SetCurSel($cmbSearchMode, 2)
			GUICtrlSetData ($txtDBMinGoldPlusElixir, "250000")
			GUICtrlSetData ($txtABMinGoldPlusElixir, "0")
			GUICtrlSetData ($txtABMinGoldPlusElixirHero, "0")
			_GUICtrlComboBox_SetCurSel($cmbDBMeetGE, 2)
			GUICtrlSetData ($txtDBMinDarkElixir, "0")
			GUICtrlSetData ($txtABMinDarkElixir, "1000")
			GUICtrlSetData ($txtABMinDarkElixirHero, "1000")
			GUICtrlSetState($chkDBMeetDE, $GUI_UNCHECKED)
			GUICtrlSetState($chkABMeetDE, $GUI_CHECKED)
			GUICtrlSetState($chkABMeetDEHero, $GUI_CHECKED)
			GUICtrlSetData ($txtDBMinTrophy, "0")
			GUICtrlSetData ($txtABMinTrophy, "0")
			GUICtrlSetData ($txtABMinTrophyHero, "0")
			GUICtrlSetState($chkDBMeetTrophy, $GUI_UNCHECKED)
			GUICtrlSetState($chkABMeetTrophy, $GUI_UNCHECKED)
			GUICtrlSetState($chkABMeetTrophyHero, $GUI_UNCHECKED)
			GUICtrlSetState($chkDBMeetTH, $GUI_UNCHECKED)
			GUICtrlSetState($chkABMeetTH, $GUI_CHECKED)
			_GUICtrlComboBox_SetCurSel($cmbABTH, 3)
			GUICtrlSetState($chkABMeetTHHero, $GUI_CHECKED)
			_GUICtrlComboBox_SetCurSel($cmbABTHHero, 3)
			GUICtrlSetState($chkDBMeetTHO, $GUI_UNCHECKED)
			GUICtrlSetState($chkABMeetTHO, $GUI_UNCHECKED)
			GUICtrlSetState($chkABMeetTHOHero, $GUI_UNCHECKED)
			GUICtrlSetState($chkDBWeakBase, $GUI_UNCHECKED)
			GUICtrlSetState($chkABWeakBase, $GUI_CHECKED)
			_GUICtrlComboBox_SetCurSel($cmbABWeakMortar, 6)
			_GUICtrlComboBox_SetCurSel($cmbABWeakWizTower, 5)
			GUICtrlSetState($chkABWeakBaseHero, $GUI_CHECKED)
			_GUICtrlComboBox_SetCurSel($cmbABWeakMortarHero, 6)
			_GUICtrlComboBox_SetCurSel($cmbABWeakWizTowerHero, 5)
			GUICtrlSetState($chkDBMeetOne, $GUI_UNCHECKED)
			GUICtrlSetState($chkABMeetOne, $GUI_UNCHECKED)
			GUICtrlSetState($chkABMeetOneHero, $GUI_UNCHECKED)
			GUICtrlSetState($chkSearchReduction, $GUI_CHECKED)
			GUICtrlSetData ($txtSearchReduceGold, "5000")
			GUICtrlSetData ($txtSearchReduceElixir, "5000")
			GUICtrlSetData ($txtSearchReduceGoldPlusElixir, "10000")
			GUICtrlSetData ($txtSearchReduceDark, "0")
			GUICtrlSetData ($txtSearchReduceTrophy, "0")
			GUICtrlSetState($chkLBBKFilter, $GUI_UNCHECKED)
			GUICtrlSetState($chkLBAQFilter, $GUI_UNCHECKED)
			cmbDBGoldElixir()
			cmbABGoldElixir()
			cmbABGoldElixirHero()
	;Attack
			_GUICtrlComboBox_SetCurSel($cmbDBDeploy, 4)
			_GUICtrlComboBox_SetCurSel($cmbDBUnitDelay, 0)
			_GUICtrlComboBox_SetCurSel($cmbDBWaveDelay, 0)
			GUICtrlSetState($chkDBSmartAttackRedArea, $GUI_UNCHECKED)
			GUICtrlSetState($chkDBKingAttack, $GUI_CHECKED)
			GUICtrlSetState($chkDBQueenAttack, $GUI_CHECKED)
			GUICtrlSetState($chkDBDropCC, $GUI_CHECKED)
			_GUICtrlComboBox_SetCurSel($cmbABDeploy, 5)
			_GUICtrlComboBox_SetCurSel($cmbABUnitDelay, 3)
			_GUICtrlComboBox_SetCurSel($cmbABWaveDelay, 7)
			GUICtrlSetState($chkABSmartAttackRedArea, $GUI_UNCHECKED)
			GUICtrlSetState($chkABKingAttack, $GUI_CHECKED)
			GUICtrlSetState($chkABQueenAttack, $GUI_CHECKED)
			GUICtrlSetState($chkABDropCC, $GUI_CHECKED)
			GUICtrlSetState($radAutoAbilities, $GUI_CHECKED)

	;Attack Advanced
			GUICtrlSetState($chkTrophyMode, $GUI_UNCHECKED)
			GUICtrlSetState($chkAttackTH, $GUI_UNCHECKED)
			GUICtrlSetState($chkBullyMode, $GUI_UNCHECKED)
			_GUICtrlComboBox_SetCurSel($cmbAttackTHType, 3)
		;	GUICtrlSetState($chkSpellNone, $GUI_UNCHECKED)
			_GUICtrlComboBox_SetCurSel($cmbTHSpellType, 1)
			_GUICtrlComboBox_SetCurSel($cmbAttackbottomType, 2)
			_GUICtrlComboBox_SetCurSel($cmbDetectTrapedTH, 1)
			GUICtrlSetState($chkUnbreakable, $GUI_UNCHECKED)
			$OptTrophyMode = 0
	;Troop
			_GUICtrlComboBox_SetCurSel($cmbTroopComp, 9)
			GUICtrlSetData ($txtFullTroop, "90")
			GUICtrlSetData ($txtNumBarb, "40")
			GUICtrlSetData ($txtNumArch, "60")
			GUICtrlSetData ($txtNumGobl, "0")
			GUICtrlSetData ($txtNumGiant, "16")
			GUICtrlSetData ($txtNumWall, "8")
			GUICtrlSetData ($txtNumBall, "0")
			GUICtrlSetData ($txtNumWiza, "0")
			GUICtrlSetData ($txtNumHeal, "0")
			GUICtrlSetData ($txtNumDrag, "0")
			GUICtrlSetData ($txtNumPekk, "0")
			GUICtrlSetData ($txtNumMini, "0")
			GUICtrlSetData ($txtNumHogs, "0")
			GUICtrlSetData ($txtNumValk, "0")
			GUICtrlSetData ($txtNumGole, "0")
			GUICtrlSetData ($txtNumWitc, "0")
			GUICtrlSetData ($txtNumLava, "0")
			lblTotalCount()
	;EndBattle
			GUICtrlSetState($chkTimeStopAtk, $GUI_CHECKED)
			GUICtrlSetState($chkTimeStopAtk2, $GUI_CHECKED)
			GUICtrlSetData ($txtMinGoldStopAtk2, "5000")
			GUICtrlSetData ($txtMinElixirStopAtk2, "5000")
			GUICtrlSetData ($txtMinDarkElixirStopAtk2, "50")
			GUICtrlSetState($chkEndNoResources, $GUI_CHECKED)
			GUICtrlSetState($chkDESideEB, $GUI_CHECKED)
			GUICtrlSetData ($txtDELowEndMin, "10")
			GUICtrlSetState($chkDisableOtherEBO, $GUI_CHECKED)
			GUICtrlSetState($chkDEEndOneStar, $GUI_CHECKED)
	;Misc
			GUICtrlSetData ($txtdropTrophy, "2000")
			GUICtrlSetData ($txtMaxTrophy, "2200")
			GUICtrlSetState($chkTrophyHeroes, $GUI_CHECKED)
			GUICtrlSetState($chkTrophyAtkDead, $GUI_CHECKED)

			SetLog("Your settings have been changed to TownHall 10 (Gold + Elixir + Dark Elixir)")
		Case 10;TH 10 (DE)
	;Search
			GUICtrlSetState($chkABEnableAfter, $GUI_UNCHECKED)
			_GUICtrlComboBox_SetCurSel($cmbSearchMode, 1)
			GUICtrlSetData ($txtABMinGoldPlusElixir, "0")
			GUICtrlSetData ($txtABMinGoldPlusElixirHero, "0")
			GUICtrlSetData ($txtABMinDarkElixir, "1000")
			GUICtrlSetData ($txtABMinDarkElixirHero, "1000")
			GUICtrlSetState($chkABMeetDE, $GUI_CHECKED)
			GUICtrlSetState($chkABMeetDEHero, $GUI_CHECKED)
			GUICtrlSetData ($txtABMinTrophy, "0")
			GUICtrlSetData ($txtABMinTrophyHero, "0")
			GUICtrlSetState($chkABMeetTrophy, $GUI_UNCHECKED)
			GUICtrlSetState($chkABMeetTrophyHero, $GUI_UNCHECKED)
			GUICtrlSetState($chkABMeetTH, $GUI_CHECKED)
			_GUICtrlComboBox_SetCurSel($cmbABTH, 2)
			GUICtrlSetState($chkABMeetTHHero, $GUI_CHECKED)
			_GUICtrlComboBox_SetCurSel($cmbABTHHero, 2)
			GUICtrlSetState($chkABMeetTHO, $GUI_UNCHECKED)
			GUICtrlSetState($chkABMeetTHOHero, $GUI_UNCHECKED)
			GUICtrlSetState($chkABWeakBase, $GUI_CHECKED)
			_GUICtrlComboBox_SetCurSel($cmbABWeakMortar, 6)
			_GUICtrlComboBox_SetCurSel($cmbABWeakWizTower, 5)
			GUICtrlSetState($chkABWeakBaseHero, $GUI_CHECKED)
			_GUICtrlComboBox_SetCurSel($cmbABWeakMortarHero, 6)
			_GUICtrlComboBox_SetCurSel($cmbABWeakWizTowerHero, 5)
			GUICtrlSetState($chkABMeetOne, $GUI_UNCHECKED)
			GUICtrlSetState($chkABMeetOneHero, $GUI_UNCHECKED)
			GUICtrlSetState($chkSearchReduction, $GUI_CHECKED)
			GUICtrlSetData ($txtSearchReduceGold, "5000")
			GUICtrlSetData ($txtSearchReduceElixir, "5000")
			GUICtrlSetData ($txtSearchReduceGoldPlusElixir, "10000")
			GUICtrlSetData ($txtSearchReduceDark, "0")
			GUICtrlSetData ($txtSearchReduceTrophy, "0")
			GUICtrlSetState($chkLBBKFilter, $GUI_UNCHECKED)
			GUICtrlSetState($chkLBAQFilter, $GUI_UNCHECKED)
			cmbABGoldElixir()
			cmbABGoldElixirHero()
	;Attack
			_GUICtrlComboBox_SetCurSel($cmbABDeploy, 5)
			_GUICtrlComboBox_SetCurSel($cmbABUnitDelay, 3)
			_GUICtrlComboBox_SetCurSel($cmbABWaveDelay, 7)
			GUICtrlSetState($chkABSmartAttackRedArea, $GUI_UNCHECKED)
			GUICtrlSetState($chkABKingAttack, $GUI_CHECKED)
			GUICtrlSetState($chkABQueenAttack, $GUI_CHECKED)
			GUICtrlSetState($chkABDropCC, $GUI_CHECKED)
			GUICtrlSetState($radAutoAbilities, $GUI_CHECKED)

	;Attack Advanced
			GUICtrlSetState($chkTrophyMode, $GUI_UNCHECKED)
			GUICtrlSetState($chkAttackTH, $GUI_UNCHECKED)
			GUICtrlSetState($chkBullyMode, $GUI_UNCHECKED)
			_GUICtrlComboBox_SetCurSel($cmbAttackTHType, 3)
		;	GUICtrlSetState($chkSpellNone, $GUI_UNCHECKED)
			_GUICtrlComboBox_SetCurSel($cmbTHSpellType, 1)
			_GUICtrlComboBox_SetCurSel($cmbAttackbottomType, 2)
			_GUICtrlComboBox_SetCurSel($cmbDetectTrapedTH, 1)
			GUICtrlSetState($chkUnbreakable, $GUI_UNCHECKED)
			$OptTrophyMode = 0
	;Troop
			_GUICtrlComboBox_SetCurSel($cmbTroopComp, 9)
			GUICtrlSetData ($txtFullTroop, "90")
			GUICtrlSetData ($txtNumBarb, "40")
			GUICtrlSetData ($txtNumArch, "60")
			GUICtrlSetData ($txtNumGobl, "0")
			GUICtrlSetData ($txtNumGiant, "16")
			GUICtrlSetData ($txtNumWall, "8")
			GUICtrlSetData ($txtNumBall, "0")
			GUICtrlSetData ($txtNumWiza, "0")
			GUICtrlSetData ($txtNumHeal, "0")
			GUICtrlSetData ($txtNumDrag, "0")
			GUICtrlSetData ($txtNumPekk, "0")
			GUICtrlSetData ($txtNumMini, "0")
			GUICtrlSetData ($txtNumHogs, "0")
			GUICtrlSetData ($txtNumValk, "0")
			GUICtrlSetData ($txtNumGole, "0")
			GUICtrlSetData ($txtNumWitc, "0")
			GUICtrlSetData ($txtNumLava, "0")
			lblTotalCount()
	;EndBattle
			GUICtrlSetState($chkTimeStopAtk, $GUI_CHECKED)
			GUICtrlSetState($chkTimeStopAtk2, $GUI_CHECKED)
			GUICtrlSetData ($txtMinGoldStopAtk2, "5000")
			GUICtrlSetData ($txtMinElixirStopAtk2, "5000")
			GUICtrlSetData ($txtMinDarkElixirStopAtk2, "50")
			GUICtrlSetState($chkEndNoResources, $GUI_CHECKED)
			GUICtrlSetState($chkDESideEB, $GUI_CHECKED)
			GUICtrlSetData ($txtDELowEndMin, "10")
			GUICtrlSetState($chkDisableOtherEBO, $GUI_CHECKED)
			GUICtrlSetState($chkDEEndOneStar, $GUI_CHECKED)
	;Misc
			GUICtrlSetData ($txtdropTrophy, "2000")
			GUICtrlSetData ($txtMaxTrophy, "2200")
			GUICtrlSetState($chkTrophyHeroes, $GUI_CHECKED)
			GUICtrlSetState($chkTrophyAtkDead, $GUI_CHECKED)

			SetLog("Settings changed to TownHall 10 (Dark Elixir)")
	EndSwitch

	GUICtrlSetState($tabSearch, $GUI_HIDE)
	GUICtrlSetState($tabAttack, $GUI_HIDE)
	GUICtrlSetState($tabAttackAdv, $GUI_HIDE)
	GUICtrlSetState($tabTroops, $GUI_HIDE)
	GUICtrlSetState($tabEndBattle, $GUI_HIDE)
	GUICtrlSetState($tabMisc, $GUI_HIDE)
	GUICtrlSetState($tabSearch, $GUI_SHOW)
	GUICtrlSetState($tabAttack, $GUI_SHOW)
	GUICtrlSetState($tabAttackAdv, $GUI_SHOW)
	GUICtrlSetState($tabTroops, $GUI_SHOW)
	GUICtrlSetState($tabEndBattle, $GUI_SHOW)
	GUICtrlSetState($tabMisc, $GUI_SHOW)
	hidenormal()
EndFunc
