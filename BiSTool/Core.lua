local addon, namespace = ...



Settings = {
	ButtonSize = { x = 125, y = 30 },
	ButtonTextColor = "|cffffffff",
}

Core = {}

Buttons = {}

ClassTitles = {}



--#region UI Functions

-- Creates the addon main menu.
function CreateAddonMainMenu()
	Core.MainWindow = CreateFrame("Frame", nil, UIParent, "UIPanelDialogTemplate")	
	Core.MainWindow:SetSize(500,500)
	Core.MainWindow:SetPoint("CENTER", UIParent, "CENTER");
	Core.MainWindow:Show()
	Core.MainWindow:SetMovable(true);
	Core.MainWindow:EnableMouse(true);
	Core.MainWindow:RegisterForDrag("LeftButton")
	Core.MainWindow:SetScript("OnMouseDown", function(self, button)
		if button == "LeftButton" and not self.isMoving then
		  self:StartMoving();
		  self.isMoving = true;
		 end
	   end)
	   Core.MainWindow:SetScript("OnMouseUp", function(self, button)
		 if button == "LeftButton" and self.isMoving then
		  self:StopMovingOrSizing();
		  self.isMoving = false;
		 end
	   end)
	   Core.MainWindow:SetScript("OnHide", function(self)
		 if ( self.isMoving ) then
		  self:StopMovingOrSizing();
		  self.isMoving = false;
		 end
	   end)

	Core.mainWindowTitle = Core.MainWindow:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	Core.mainWindowTitle:SetPoint("CENTER", Core.MainWindow, "TOP", 0, -15);
	Core.mainWindowTitle:SetText("BiS Tool ( " .. "|cff00ff00Created By Sylian |r)");

	Core.MainWindow:Hide()
end

function CreateButtons()

	--#region DeathKnight BTNs

	Buttons.DK_BLOOD = CreateFrame("Button", nil, Core.MainWindow, "UIPanelButtonTemplate")
	Buttons.DK_BLOOD:SetPoint("CENTER", Core.MainWindow, "CENTER", -175, 175)
	Buttons.DK_BLOOD:SetSize(Settings.ButtonSize.x, Settings.ButtonSize.y)
	Buttons.DK_BLOOD:SetText(Settings.ButtonTextColor .. "Blood")
	Buttons.DK_BLOOD:SetNormalTexture("Interface/Buttons/UI-Panel-Button-Up")
    Buttons.DK_BLOOD:SetHighlightTexture("Interface/Buttons/UI-Panel-Button-Highlight")
    Buttons.DK_BLOOD:SetPushedTexture("Interface/Buttons/UI-Panel-Button-Down")
	Buttons.DK_BLOOD:UnregisterAllEvents()
	Buttons.DK_BLOOD:SetScript("OnClick", function(self, button)
		namespace.Commands.DeathKnightGear(1)		-- The first one is the tier, second argument is the spec.
	end)


	Buttons.DK_FROST = CreateFrame("Button", nil, Core.MainWindow, "UIPanelButtonTemplate")
	Buttons.DK_FROST:SetPoint("CENTER", Core.MainWindow, "CENTER", -175, 145)
	Buttons.DK_FROST:SetSize(Settings.ButtonSize.x, Settings.ButtonSize.y)
	Buttons.DK_FROST:SetText(Settings.ButtonTextColor .. "Frost")
	Buttons.DK_FROST:SetNormalTexture("Interface/Buttons/UI-Panel-Button-Up")
    Buttons.DK_FROST:SetHighlightTexture("Interface/Buttons/UI-Panel-Button-Highlight")
    Buttons.DK_FROST:SetPushedTexture("Interface/Buttons/UI-Panel-Button-Down")
	Buttons.DK_FROST:UnregisterAllEvents()
	Buttons.DK_FROST:SetScript("OnClick", function(self, button)
		namespace.Commands.DeathKnightGear(2)		-- The first one is the tier, second argument is the spec.
	end)


	Buttons.DK_UNHOLY = CreateFrame("Button", nil, Core.MainWindow, "UIPanelButtonTemplate")
	Buttons.DK_UNHOLY:SetPoint("CENTER", Core.MainWindow, "CENTER", -175, 115)
	Buttons.DK_UNHOLY:SetSize(Settings.ButtonSize.x, Settings.ButtonSize.y)
	Buttons.DK_UNHOLY:SetText(Settings.ButtonTextColor .. "Unholy")
	Buttons.DK_UNHOLY:SetNormalTexture("Interface/Buttons/UI-Panel-Button-Up")
    Buttons.DK_UNHOLY:SetHighlightTexture("Interface/Buttons/UI-Panel-Button-Highlight")
    Buttons.DK_UNHOLY:SetPushedTexture("Interface/Buttons/UI-Panel-Button-Down")
	Buttons.DK_UNHOLY:UnregisterAllEvents()
	Buttons.DK_UNHOLY:SetScript("OnClick", function(self, button)
		namespace.Commands.DeathKnightGear(3)		-- The first one is the tier, second argument is the spec.
	end)
	--#endregion

	--#region Druid BTNs
	Buttons.DRUID_BALANCE = CreateFrame("Button", nil, Core.MainWindow, "UIPanelButtonTemplate")
	Buttons.DRUID_BALANCE:SetPoint("CENTER", Core.MainWindow, "CENTER", -175, 50)
	Buttons.DRUID_BALANCE:SetSize(Settings.ButtonSize.x, Settings.ButtonSize.y)
	Buttons.DRUID_BALANCE:SetText(Settings.ButtonTextColor .. "Balance")
	Buttons.DRUID_BALANCE:SetNormalTexture("Interface/Buttons/UI-Panel-Button-Up")
    Buttons.DRUID_BALANCE:SetHighlightTexture("Interface/Buttons/UI-Panel-Button-Highlight")
    Buttons.DRUID_BALANCE:SetPushedTexture("Interface/Buttons/UI-Panel-Button-Down")
	Buttons.DRUID_BALANCE:UnregisterAllEvents()
	Buttons.DRUID_BALANCE:SetScript("OnClick", function(self, button)
		namespace.Commands.Druid(1)		-- The first one is the tier, second argument is the spec.
	end)


	Buttons.DRUID_FERAL = CreateFrame("Button", nil, Core.MainWindow, "UIPanelButtonTemplate")
	Buttons.DRUID_FERAL:SetPoint("CENTER", Core.MainWindow, "CENTER", -175, 20)
	Buttons.DRUID_FERAL:SetSize(Settings.ButtonSize.x, Settings.ButtonSize.y)
	Buttons.DRUID_FERAL:SetText(Settings.ButtonTextColor .. "Feral")
	Buttons.DRUID_FERAL:SetNormalTexture("Interface/Buttons/UI-Panel-Button-Up")
    Buttons.DRUID_FERAL:SetHighlightTexture("Interface/Buttons/UI-Panel-Button-Highlight")
    Buttons.DRUID_FERAL:SetPushedTexture("Interface/Buttons/UI-Panel-Button-Down")
	Buttons.DRUID_FERAL:UnregisterAllEvents()
	Buttons.DRUID_FERAL:SetScript("OnClick", function(self, button)
		namespace.Commands.Druid(2)		-- The first one is the tier, second argument is the spec.
	end)


	Buttons.DRUID_RESTORATION = CreateFrame("Button", nil, Core.MainWindow, "UIPanelButtonTemplate")
	Buttons.DRUID_RESTORATION:SetPoint("CENTER", Core.MainWindow, "CENTER", -175, -10)
	Buttons.DRUID_RESTORATION:SetSize(Settings.ButtonSize.x, Settings.ButtonSize.y)
	Buttons.DRUID_RESTORATION:SetText(Settings.ButtonTextColor .. "Restoration")
	Buttons.DRUID_RESTORATION:SetNormalTexture("Interface/Buttons/UI-Panel-Button-Up")
    Buttons.DRUID_RESTORATION:SetHighlightTexture("Interface/Buttons/UI-Panel-Button-Highlight")
    Buttons.DRUID_RESTORATION:SetPushedTexture("Interface/Buttons/UI-Panel-Button-Down")
	Buttons.DRUID_RESTORATION:UnregisterAllEvents()
	Buttons.DRUID_RESTORATION:SetScript("OnClick", function(self, button)
		namespace.Commands.Druid(3)		-- The first one is the tier, second argument is the spec.
	end)
	--#endregion

		--#region Hunter BTNs

		Buttons.HUNTER_BEASTMASTERY = CreateFrame("Button", nil, Core.MainWindow, "UIPanelButtonTemplate")
		Buttons.HUNTER_BEASTMASTERY:SetPoint("CENTER", Core.MainWindow, "CENTER", -175, -75)
		Buttons.HUNTER_BEASTMASTERY:SetSize(Settings.ButtonSize.x, Settings.ButtonSize.y)
		Buttons.HUNTER_BEASTMASTERY:SetText(Settings.ButtonTextColor .. "Beast Mastery")
		Buttons.HUNTER_BEASTMASTERY:SetNormalTexture("Interface/Buttons/UI-Panel-Button-Up")
		Buttons.HUNTER_BEASTMASTERY:SetHighlightTexture("Interface/Buttons/UI-Panel-Button-Highlight")
		Buttons.HUNTER_BEASTMASTERY:SetPushedTexture("Interface/Buttons/UI-Panel-Button-Down")
		Buttons.HUNTER_BEASTMASTERY:UnregisterAllEvents()
		Buttons.HUNTER_BEASTMASTERY:SetScript("OnClick", function(self, button)
			namespace.Commands.Hunter(1)		-- The first one is the tier, second argument is the spec.
		end)
	
	
		Buttons.HUNTER_MARKSMANSHIP = CreateFrame("Button", nil, Core.MainWindow, "UIPanelButtonTemplate")
		Buttons.HUNTER_MARKSMANSHIP:SetPoint("CENTER", Core.MainWindow, "CENTER", -175, -105)
		Buttons.HUNTER_MARKSMANSHIP:SetSize(Settings.ButtonSize.x, Settings.ButtonSize.y)
		Buttons.HUNTER_MARKSMANSHIP:SetText(Settings.ButtonTextColor .. "Marksmanship")
		Buttons.HUNTER_MARKSMANSHIP:SetNormalTexture("Interface/Buttons/UI-Panel-Button-Up")
		Buttons.HUNTER_MARKSMANSHIP:SetHighlightTexture("Interface/Buttons/UI-Panel-Button-Highlight")
		Buttons.HUNTER_MARKSMANSHIP:SetPushedTexture("Interface/Buttons/UI-Panel-Button-Down")
		Buttons.HUNTER_MARKSMANSHIP:UnregisterAllEvents()
		Buttons.HUNTER_MARKSMANSHIP:SetScript("OnClick", function(self, button)
			namespace.Commands.Hunter(2)		-- The first one is the tier, second argument is the spec.
		end)
	
	
		Buttons.HUNTER_SURVIVAL = CreateFrame("Button", nil, Core.MainWindow, "UIPanelButtonTemplate")
		Buttons.HUNTER_SURVIVAL:SetPoint("CENTER", Core.MainWindow, "CENTER", -175, -135)
		Buttons.HUNTER_SURVIVAL:SetSize(Settings.ButtonSize.x, Settings.ButtonSize.y)
		Buttons.HUNTER_SURVIVAL:SetText(Settings.ButtonTextColor .. "Survival")
		Buttons.HUNTER_SURVIVAL:SetNormalTexture("Interface/Buttons/UI-Panel-Button-Up")
		Buttons.HUNTER_SURVIVAL:SetHighlightTexture("Interface/Buttons/UI-Panel-Button-Highlight")
		Buttons.HUNTER_SURVIVAL:SetPushedTexture("Interface/Buttons/UI-Panel-Button-Down")
		Buttons.HUNTER_SURVIVAL:UnregisterAllEvents()
		Buttons.HUNTER_SURVIVAL:SetScript("OnClick", function(self, button)
			namespace.Commands.Hunter(3)		-- The first one is the tier, second argument is the spec.
		end)
		--#endregion

		--#region Mage BTNs
		Buttons.MAGE_ARCANE = CreateFrame("Button", nil, Core.MainWindow, "UIPanelButtonTemplate")
		Buttons.MAGE_ARCANE:SetPoint("CENTER", Core.MainWindow, "CENTER", 0, 175)
		Buttons.MAGE_ARCANE:SetSize(Settings.ButtonSize.x, Settings.ButtonSize.y)
		Buttons.MAGE_ARCANE:SetText(Settings.ButtonTextColor .. "Arcane")
		Buttons.MAGE_ARCANE:SetNormalTexture("Interface/Buttons/UI-Panel-Button-Up")
		Buttons.MAGE_ARCANE:SetHighlightTexture("Interface/Buttons/UI-Panel-Button-Highlight")
		Buttons.MAGE_ARCANE:SetPushedTexture("Interface/Buttons/UI-Panel-Button-Down")
		Buttons.MAGE_ARCANE:UnregisterAllEvents()
		Buttons.MAGE_ARCANE:SetScript("OnClick", function(self, button)
			namespace.Commands.Mage(1)		-- The first one is the tier, second argument is the spec.
		end)
	
	
		Buttons.MAGE_FIRE = CreateFrame("Button", nil, Core.MainWindow, "UIPanelButtonTemplate")
		Buttons.MAGE_FIRE:SetPoint("CENTER", Core.MainWindow, "CENTER", 0, 145)
		Buttons.MAGE_FIRE:SetSize(Settings.ButtonSize.x, Settings.ButtonSize.y)
		Buttons.MAGE_FIRE:SetText(Settings.ButtonTextColor .. "Fire")
		Buttons.MAGE_FIRE:SetNormalTexture("Interface/Buttons/UI-Panel-Button-Up")
		Buttons.MAGE_FIRE:SetHighlightTexture("Interface/Buttons/UI-Panel-Button-Highlight")
		Buttons.MAGE_FIRE:SetPushedTexture("Interface/Buttons/UI-Panel-Button-Down")
		Buttons.MAGE_FIRE:UnregisterAllEvents()
		Buttons.MAGE_FIRE:SetScript("OnClick", function(self, button)
			namespace.Commands.Mage(2)		-- The first one is the tier, second argument is the spec.
		end)
	
	
		Buttons.MAGE_FROST = CreateFrame("Button", nil, Core.MainWindow, "UIPanelButtonTemplate")
		Buttons.MAGE_FROST:SetPoint("CENTER", Core.MainWindow, "CENTER", 0, 115)
		Buttons.MAGE_FROST:SetSize(Settings.ButtonSize.x, Settings.ButtonSize.y)
		Buttons.MAGE_FROST:SetText(Settings.ButtonTextColor .. "Frost")
		Buttons.MAGE_FROST:SetNormalTexture("Interface/Buttons/UI-Panel-Button-Up")
		Buttons.MAGE_FROST:SetHighlightTexture("Interface/Buttons/UI-Panel-Button-Highlight")
		Buttons.MAGE_FROST:SetPushedTexture("Interface/Buttons/UI-Panel-Button-Down")
		Buttons.MAGE_FROST:UnregisterAllEvents()
		Buttons.MAGE_FROST:SetScript("OnClick", function(self, button)
			namespace.Commands.Mage(3)		-- The first one is the tier, second argument is the spec.
		end)
		--#endregion

		--#region Paladin BTNs
		Buttons.PALADIN_HOLY = CreateFrame("Button", nil, Core.MainWindow, "UIPanelButtonTemplate")
		Buttons.PALADIN_HOLY:SetPoint("CENTER", Core.MainWindow, "CENTER", 0, 50)
		Buttons.PALADIN_HOLY:SetSize(Settings.ButtonSize.x, Settings.ButtonSize.y)
		Buttons.PALADIN_HOLY:SetText(Settings.ButtonTextColor .. "Holy")
		Buttons.PALADIN_HOLY:SetNormalTexture("Interface/Buttons/UI-Panel-Button-Up")
		Buttons.PALADIN_HOLY:SetHighlightTexture("Interface/Buttons/UI-Panel-Button-Highlight")
		Buttons.PALADIN_HOLY:SetPushedTexture("Interface/Buttons/UI-Panel-Button-Down")
		Buttons.PALADIN_HOLY:UnregisterAllEvents()
		Buttons.PALADIN_HOLY:SetScript("OnClick", function(self, button)
			namespace.Commands.Paladin(1)		-- The first one is the tier, second argument is the spec.
		end)
	
	
		Buttons.PALADIN_PROTECTION = CreateFrame("Button", nil, Core.MainWindow, "UIPanelButtonTemplate")
		Buttons.PALADIN_PROTECTION:SetPoint("CENTER", Core.MainWindow, "CENTER", 0, 20)
		Buttons.PALADIN_PROTECTION:SetSize(Settings.ButtonSize.x, Settings.ButtonSize.y)
		Buttons.PALADIN_PROTECTION:SetText(Settings.ButtonTextColor .. "Protection")
		Buttons.PALADIN_PROTECTION:SetNormalTexture("Interface/Buttons/UI-Panel-Button-Up")
		Buttons.PALADIN_PROTECTION:SetHighlightTexture("Interface/Buttons/UI-Panel-Button-Highlight")
		Buttons.PALADIN_PROTECTION:SetPushedTexture("Interface/Buttons/UI-Panel-Button-Down")
		Buttons.PALADIN_PROTECTION:UnregisterAllEvents()
		Buttons.PALADIN_PROTECTION:SetScript("OnClick", function(self, button)
			namespace.Commands.Paladin(2)		-- The first one is the tier, second argument is the spec.
		end)
	
	
		Buttons.PALADIN_RETRIBUTION = CreateFrame("Button", nil, Core.MainWindow, "UIPanelButtonTemplate")
		Buttons.PALADIN_RETRIBUTION:SetPoint("CENTER", Core.MainWindow, "CENTER", 0, -10)
		Buttons.PALADIN_RETRIBUTION:SetSize(Settings.ButtonSize.x, Settings.ButtonSize.y)
		Buttons.PALADIN_RETRIBUTION:SetText(Settings.ButtonTextColor .. "Retribution")
		Buttons.PALADIN_RETRIBUTION:SetNormalTexture("Interface/Buttons/UI-Panel-Button-Up")
		Buttons.PALADIN_RETRIBUTION:SetHighlightTexture("Interface/Buttons/UI-Panel-Button-Highlight")
		Buttons.PALADIN_RETRIBUTION:SetPushedTexture("Interface/Buttons/UI-Panel-Button-Down")
		Buttons.PALADIN_RETRIBUTION:UnregisterAllEvents()
		Buttons.PALADIN_RETRIBUTION:SetScript("OnClick", function(self, button)
			namespace.Commands.Paladin(3)		-- The first one is the tier, second argument is the spec.
		end)
		--#endregion

		--#region Priest BTNs
		Buttons.PRIEST_DISCIPLINE = CreateFrame("Button", nil, Core.MainWindow, "UIPanelButtonTemplate")
		Buttons.PRIEST_DISCIPLINE:SetPoint("CENTER", Core.MainWindow, "CENTER", 0, -75)
		Buttons.PRIEST_DISCIPLINE:SetSize(Settings.ButtonSize.x, Settings.ButtonSize.y)
		Buttons.PRIEST_DISCIPLINE:SetText(Settings.ButtonTextColor .. "Discipline")
		Buttons.PRIEST_DISCIPLINE:SetNormalTexture("Interface/Buttons/UI-Panel-Button-Up")
		Buttons.PRIEST_DISCIPLINE:SetHighlightTexture("Interface/Buttons/UI-Panel-Button-Highlight")
		Buttons.PRIEST_DISCIPLINE:SetPushedTexture("Interface/Buttons/UI-Panel-Button-Down")
		Buttons.PRIEST_DISCIPLINE:UnregisterAllEvents()
		Buttons.PRIEST_DISCIPLINE:SetScript("OnClick", function(self, button)
			namespace.Commands.Priest(1)		-- The first one is the tier, second argument is the spec.
		end)
	
	
		Buttons.PRIEST_HOLY = CreateFrame("Button", nil, Core.MainWindow, "UIPanelButtonTemplate")
		Buttons.PRIEST_HOLY:SetPoint("CENTER", Core.MainWindow, "CENTER", 0, -105)
		Buttons.PRIEST_HOLY:SetSize(Settings.ButtonSize.x, Settings.ButtonSize.y)
		Buttons.PRIEST_HOLY:SetText(Settings.ButtonTextColor .. "Holy")
		Buttons.PRIEST_HOLY:SetNormalTexture("Interface/Buttons/UI-Panel-Button-Up")
		Buttons.PRIEST_HOLY:SetHighlightTexture("Interface/Buttons/UI-Panel-Button-Highlight")
		Buttons.PRIEST_HOLY:SetPushedTexture("Interface/Buttons/UI-Panel-Button-Down")
		Buttons.PRIEST_HOLY:UnregisterAllEvents()
		Buttons.PRIEST_HOLY:SetScript("OnClick", function(self, button)
			namespace.Commands.Priest(2)		-- The first one is the tier, second argument is the spec.
		end)
	
	
		Buttons.PRIEST_SHADOW = CreateFrame("Button", nil, Core.MainWindow, "UIPanelButtonTemplate")
		Buttons.PRIEST_SHADOW:SetPoint("CENTER", Core.MainWindow, "CENTER", 0, -135)
		Buttons.PRIEST_SHADOW:SetSize(Settings.ButtonSize.x, Settings.ButtonSize.y)
		Buttons.PRIEST_SHADOW:SetText(Settings.ButtonTextColor .. "Shadow")
		Buttons.PRIEST_SHADOW:SetNormalTexture("Interface/Buttons/UI-Panel-Button-Up")
		Buttons.PRIEST_SHADOW:SetHighlightTexture("Interface/Buttons/UI-Panel-Button-Highlight")
		Buttons.PRIEST_SHADOW:SetPushedTexture("Interface/Buttons/UI-Panel-Button-Down")
		Buttons.PRIEST_SHADOW:UnregisterAllEvents()
		Buttons.PRIEST_SHADOW:SetScript("OnClick", function(self, button)
			namespace.Commands.Priest(3)		-- The first one is the tier, second argument is the spec.
		end)
		--#endregion

		--#region Rogue BTNs
		Buttons.ROGUE_ASSASSINATION = CreateFrame("Button", nil, Core.MainWindow, "UIPanelButtonTemplate")
		Buttons.ROGUE_ASSASSINATION:SetPoint("CENTER", Core.MainWindow, "CENTER", 175, 175)
		Buttons.ROGUE_ASSASSINATION:SetSize(Settings.ButtonSize.x, Settings.ButtonSize.y)
		Buttons.ROGUE_ASSASSINATION:SetText(Settings.ButtonTextColor .. "Assassination")
		Buttons.ROGUE_ASSASSINATION:SetNormalTexture("Interface/Buttons/UI-Panel-Button-Up")
		Buttons.ROGUE_ASSASSINATION:SetHighlightTexture("Interface/Buttons/UI-Panel-Button-Highlight")
		Buttons.ROGUE_ASSASSINATION:SetPushedTexture("Interface/Buttons/UI-Panel-Button-Down")
		Buttons.ROGUE_ASSASSINATION:UnregisterAllEvents()
		Buttons.ROGUE_ASSASSINATION:SetScript("OnClick", function(self, button)
			namespace.Commands.Rogue(1)		-- The first one is the tier, second argument is the spec.
		end)
	
	
		Buttons.ROGUE_COMBAT = CreateFrame("Button", nil, Core.MainWindow, "UIPanelButtonTemplate")
		Buttons.ROGUE_COMBAT:SetPoint("CENTER", Core.MainWindow, "CENTER", 175, 145)
		Buttons.ROGUE_COMBAT:SetSize(Settings.ButtonSize.x, Settings.ButtonSize.y)
		Buttons.ROGUE_COMBAT:SetText(Settings.ButtonTextColor .. "Combat")
		Buttons.ROGUE_COMBAT:SetNormalTexture("Interface/Buttons/UI-Panel-Button-Up")
		Buttons.ROGUE_COMBAT:SetHighlightTexture("Interface/Buttons/UI-Panel-Button-Highlight")
		Buttons.ROGUE_COMBAT:SetPushedTexture("Interface/Buttons/UI-Panel-Button-Down")
		Buttons.ROGUE_COMBAT:UnregisterAllEvents()
		Buttons.ROGUE_COMBAT:SetScript("OnClick", function(self, button)
			namespace.Commands.Rogue(2)		-- The first one is the tier, second argument is the spec.
		end)
	
	
		Buttons.ROGUE_SUBTLETY = CreateFrame("Button", nil, Core.MainWindow, "UIPanelButtonTemplate")
		Buttons.ROGUE_SUBTLETY:SetPoint("CENTER", Core.MainWindow, "CENTER", 175, 115)
		Buttons.ROGUE_SUBTLETY:SetSize(Settings.ButtonSize.x, Settings.ButtonSize.y)
		Buttons.ROGUE_SUBTLETY:SetText(Settings.ButtonTextColor .. "Subtlety")
		Buttons.ROGUE_SUBTLETY:SetNormalTexture("Interface/Buttons/UI-Panel-Button-Up")
		Buttons.ROGUE_SUBTLETY:SetHighlightTexture("Interface/Buttons/UI-Panel-Button-Highlight")
		Buttons.ROGUE_SUBTLETY:SetPushedTexture("Interface/Buttons/UI-Panel-Button-Down")
		Buttons.ROGUE_SUBTLETY:UnregisterAllEvents()
		Buttons.ROGUE_SUBTLETY:SetScript("OnClick", function(self, button)
			namespace.Commands.Rogue(3)		-- The first one is the tier, second argument is the spec.
		end)
		--#endregion

		--#region Shaman BTNs
		Buttons.SHAMAN_ELEMENTAL = CreateFrame("Button", nil, Core.MainWindow, "UIPanelButtonTemplate")
		Buttons.SHAMAN_ELEMENTAL:SetPoint("CENTER", Core.MainWindow, "CENTER", 175, 50)
		Buttons.SHAMAN_ELEMENTAL:SetSize(Settings.ButtonSize.x, Settings.ButtonSize.y)
		Buttons.SHAMAN_ELEMENTAL:SetText(Settings.ButtonTextColor .. "Elemental")
		Buttons.SHAMAN_ELEMENTAL:SetNormalTexture("Interface/Buttons/UI-Panel-Button-Up")
		Buttons.SHAMAN_ELEMENTAL:SetHighlightTexture("Interface/Buttons/UI-Panel-Button-Highlight")
		Buttons.SHAMAN_ELEMENTAL:SetPushedTexture("Interface/Buttons/UI-Panel-Button-Down")
		Buttons.SHAMAN_ELEMENTAL:UnregisterAllEvents()
		Buttons.SHAMAN_ELEMENTAL:SetScript("OnClick", function(self, button)
			namespace.Commands.Shaman(1)		-- The first one is the tier, second argument is the spec.
		end)
	
	
		Buttons.SHAMAN_ENHANCEMENT = CreateFrame("Button", nil, Core.MainWindow, "UIPanelButtonTemplate")
		Buttons.SHAMAN_ENHANCEMENT:SetPoint("CENTER", Core.MainWindow, "CENTER", 175, 20)
		Buttons.SHAMAN_ENHANCEMENT:SetSize(Settings.ButtonSize.x, Settings.ButtonSize.y)
		Buttons.SHAMAN_ENHANCEMENT:SetText(Settings.ButtonTextColor .. "Enhancement")
		Buttons.SHAMAN_ENHANCEMENT:SetNormalTexture("Interface/Buttons/UI-Panel-Button-Up")
		Buttons.SHAMAN_ENHANCEMENT:SetHighlightTexture("Interface/Buttons/UI-Panel-Button-Highlight")
		Buttons.SHAMAN_ENHANCEMENT:SetPushedTexture("Interface/Buttons/UI-Panel-Button-Down")
		Buttons.SHAMAN_ENHANCEMENT:UnregisterAllEvents()
		Buttons.SHAMAN_ENHANCEMENT:SetScript("OnClick", function(self, button)
			namespace.Commands.Shaman(2)		-- The first one is the tier, second argument is the spec.
		end)
	
	
		Buttons.SHAMAN_RESTORATION = CreateFrame("Button", nil, Core.MainWindow, "UIPanelButtonTemplate")
		Buttons.SHAMAN_RESTORATION:SetPoint("CENTER", Core.MainWindow, "CENTER", 175, -10)
		Buttons.SHAMAN_RESTORATION:SetSize(Settings.ButtonSize.x, Settings.ButtonSize.y)
		Buttons.SHAMAN_RESTORATION:SetText(Settings.ButtonTextColor .. "Restoration")
		Buttons.SHAMAN_RESTORATION:SetNormalTexture("Interface/Buttons/UI-Panel-Button-Up")
		Buttons.SHAMAN_RESTORATION:SetHighlightTexture("Interface/Buttons/UI-Panel-Button-Highlight")
		Buttons.SHAMAN_RESTORATION:SetPushedTexture("Interface/Buttons/UI-Panel-Button-Down")
		Buttons.SHAMAN_RESTORATION:UnregisterAllEvents()
		Buttons.SHAMAN_RESTORATION:SetScript("OnClick", function(self, button)
			namespace.Commands.Shaman(3)		-- The first one is the tier, second argument is the spec.
		end)
		--#endregion

		--#region Warlock BTNs
		Buttons.WARLOCK_AFFLICTION = CreateFrame("Button", nil, Core.MainWindow, "UIPanelButtonTemplate")
		Buttons.WARLOCK_AFFLICTION:SetPoint("CENTER", Core.MainWindow, "CENTER", 175, -75)
		Buttons.WARLOCK_AFFLICTION:SetSize(Settings.ButtonSize.x, Settings.ButtonSize.y)
		Buttons.WARLOCK_AFFLICTION:SetText(Settings.ButtonTextColor .. "Affiliation")
		Buttons.WARLOCK_AFFLICTION:SetNormalTexture("Interface/Buttons/UI-Panel-Button-Up")
		Buttons.WARLOCK_AFFLICTION:SetHighlightTexture("Interface/Buttons/UI-Panel-Button-Highlight")
		Buttons.WARLOCK_AFFLICTION:SetPushedTexture("Interface/Buttons/UI-Panel-Button-Down")
		Buttons.WARLOCK_AFFLICTION:UnregisterAllEvents()
		Buttons.WARLOCK_AFFLICTION:SetScript("OnClick", function(self, button)
			namespace.Commands.Warlock(1)		-- The first one is the tier, second argument is the spec.
		end)
	
	
		Buttons.WARLOCK_DEMONOLOGY = CreateFrame("Button", nil, Core.MainWindow, "UIPanelButtonTemplate")
		Buttons.WARLOCK_DEMONOLOGY:SetPoint("CENTER", Core.MainWindow, "CENTER", 175, -105)
		Buttons.WARLOCK_DEMONOLOGY:SetSize(Settings.ButtonSize.x, Settings.ButtonSize.y)
		Buttons.WARLOCK_DEMONOLOGY:SetText(Settings.ButtonTextColor .. "Demonology")
		Buttons.WARLOCK_DEMONOLOGY:SetNormalTexture("Interface/Buttons/UI-Panel-Button-Up")
		Buttons.WARLOCK_DEMONOLOGY:SetHighlightTexture("Interface/Buttons/UI-Panel-Button-Highlight")
		Buttons.WARLOCK_DEMONOLOGY:SetPushedTexture("Interface/Buttons/UI-Panel-Button-Down")
		Buttons.WARLOCK_DEMONOLOGY:UnregisterAllEvents()
		Buttons.WARLOCK_DEMONOLOGY:SetScript("OnClick", function(self, button)
			namespace.Commands.Warlock(2)		-- The first one is the tier, second argument is the spec.
		end)
	
	
		Buttons.WARLOCK_DESTRUCTION = CreateFrame("Button", nil, Core.MainWindow, "UIPanelButtonTemplate")
		Buttons.WARLOCK_DESTRUCTION:SetPoint("CENTER", Core.MainWindow, "CENTER", 175, -135)
		Buttons.WARLOCK_DESTRUCTION:SetSize(Settings.ButtonSize.x, Settings.ButtonSize.y)
		Buttons.WARLOCK_DESTRUCTION:SetText(Settings.ButtonTextColor .. "Destruction")
		Buttons.WARLOCK_DESTRUCTION:SetNormalTexture("Interface/Buttons/UI-Panel-Button-Up")
		Buttons.WARLOCK_DESTRUCTION:SetHighlightTexture("Interface/Buttons/UI-Panel-Button-Highlight")
		Buttons.WARLOCK_DESTRUCTION:SetPushedTexture("Interface/Buttons/UI-Panel-Button-Down")
		Buttons.WARLOCK_DESTRUCTION:UnregisterAllEvents()
		Buttons.WARLOCK_DESTRUCTION:SetScript("OnClick", function(self, button)
			namespace.Commands.Warlock(3)		-- The first one is the tier, second argument is the spec.
		end)
		--#endregion






		--#region Warrior BTNs
		Buttons.WARRIOR_ARMS = CreateFrame("Button", nil, Core.MainWindow, "UIPanelButtonTemplate")
		Buttons.WARRIOR_ARMS:SetPoint("CENTER", Core.MainWindow, "CENTER", 125, -205)
		Buttons.WARRIOR_ARMS:SetSize(Settings.ButtonSize.x, Settings.ButtonSize.y)
		Buttons.WARRIOR_ARMS:SetText(Settings.ButtonTextColor .. "Arms")
		Buttons.WARRIOR_ARMS:SetNormalTexture("Interface/Buttons/UI-Panel-Button-Up")
		Buttons.WARRIOR_ARMS:SetHighlightTexture("Interface/Buttons/UI-Panel-Button-Highlight")
		Buttons.WARRIOR_ARMS:SetPushedTexture("Interface/Buttons/UI-Panel-Button-Down")
		Buttons.WARRIOR_ARMS:UnregisterAllEvents()
		Buttons.WARRIOR_ARMS:SetScript("OnClick", function(self, button)
			namespace.Commands.Warrior(1)		-- The first one is the tier, second argument is the spec.
		end)
	
	
		Buttons.WARRIOR_FURY = CreateFrame("Button", nil, Core.MainWindow, "UIPanelButtonTemplate")
		Buttons.WARRIOR_FURY:SetPoint("CENTER", Core.MainWindow, "CENTER", 0, -205)
		Buttons.WARRIOR_FURY:SetSize(Settings.ButtonSize.x, Settings.ButtonSize.y)
		Buttons.WARRIOR_FURY:SetText(Settings.ButtonTextColor .. "Fury")
		Buttons.WARRIOR_FURY:SetNormalTexture("Interface/Buttons/UI-Panel-Button-Up")
		Buttons.WARRIOR_FURY:SetHighlightTexture("Interface/Buttons/UI-Panel-Button-Highlight")
		Buttons.WARRIOR_FURY:SetPushedTexture("Interface/Buttons/UI-Panel-Button-Down")
		Buttons.WARRIOR_FURY:UnregisterAllEvents()
		Buttons.WARRIOR_FURY:SetScript("OnClick", function(self, button)
			namespace.Commands.Warrior(2)		-- The first one is the tier, second argument is the spec.
		end)
	
	
		Buttons.WARRIOR_PROTECTION = CreateFrame("Button", nil, Core.MainWindow, "UIPanelButtonTemplate")
		Buttons.WARRIOR_PROTECTION:SetPoint("CENTER", Core.MainWindow, "CENTER", -125, -205)
		Buttons.WARRIOR_PROTECTION:SetSize(Settings.ButtonSize.x, Settings.ButtonSize.y)
		Buttons.WARRIOR_PROTECTION:SetText(Settings.ButtonTextColor .. "Protection")
		Buttons.WARRIOR_PROTECTION:SetNormalTexture("Interface/Buttons/UI-Panel-Button-Up")
		Buttons.WARRIOR_PROTECTION:SetHighlightTexture("Interface/Buttons/UI-Panel-Button-Highlight")
		Buttons.WARRIOR_PROTECTION:SetPushedTexture("Interface/Buttons/UI-Panel-Button-Down")
		Buttons.WARRIOR_PROTECTION:UnregisterAllEvents()
		Buttons.WARRIOR_PROTECTION:SetScript("OnClick", function(self, button)
			namespace.Commands.Warrior(3)		-- The first one is the tier, second argument is the spec.
		end)
		--#endregion
end

function CreateClassTitles()
	ClassTitles.DeathKnight = Core.MainWindow:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	ClassTitles.DeathKnight:SetPoint("CENTER", Core.MainWindow, "CENTER", -175, 200)
	ClassTitles.DeathKnight:SetText("Death Knight");

	ClassTitles.Druid = Core.MainWindow:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	ClassTitles.Druid:SetPoint("CENTER", Core.MainWindow, "CENTER", -175, 75)
	ClassTitles.Druid:SetText("Druid");

	ClassTitles.Hunter = Core.MainWindow:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	ClassTitles.Hunter:SetPoint("CENTER", Core.MainWindow, "CENTER", -175, -50)
	ClassTitles.Hunter:SetText("Hunter");

	ClassTitles.Mage = Core.MainWindow:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	ClassTitles.Mage:SetPoint("CENTER", Core.MainWindow, "CENTER", 0, 200)
	ClassTitles.Mage:SetText("Mage");

	ClassTitles.Paladin = Core.MainWindow:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	ClassTitles.Paladin:SetPoint("CENTER", Core.MainWindow, "CENTER", 0, 75)
	ClassTitles.Paladin:SetText("Paladin");

	ClassTitles.Priest = Core.MainWindow:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	ClassTitles.Priest:SetPoint("CENTER", Core.MainWindow, "CENTER", 0, -50)
	ClassTitles.Priest:SetText("Priest");

	ClassTitles.Rogue = Core.MainWindow:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	ClassTitles.Rogue:SetPoint("CENTER", Core.MainWindow, "CENTER", 175, 200)
	ClassTitles.Rogue:SetText("Rogue");

	ClassTitles.Shaman = Core.MainWindow:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	ClassTitles.Shaman:SetPoint("CENTER", Core.MainWindow, "CENTER", 175, 75)
	ClassTitles.Shaman:SetText("Shaman");
	
	ClassTitles.Warlock = Core.MainWindow:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	ClassTitles.Warlock:SetPoint("CENTER", Core.MainWindow, "CENTER", 175, -50)
	ClassTitles.Warlock:SetText("Warlock");

	ClassTitles.Warrior = Core.MainWindow:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	ClassTitles.Warrior:SetPoint("CENTER", Core.MainWindow, "CENTER", 0, -180)
	ClassTitles.Warrior:SetText("Warrior");
end




--#endregion

CreateAddonMainMenu()

CreateButtons();

CreateClassTitles()



SlashCmdList["OPENTOOL"] = function(msg)
   Core.MainWindow:Show()
end 
SLASH_OPENTOOL1 = "/tool"