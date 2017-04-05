local E, L, V, P, G, _ = unpack(ElvUI)
local S = E:GetModule("Skins")

local _G = _G

function S:LoadTutorialSkin()
	if E.private.skins.blizzard.enable ~= true or E.private.skins.blizzard.tutorial ~= true then return end

	for i = 1, TutorialFrame:GetNumChildren() do
		local child = select(i, TutorialFrame:GetChildren())
		if child.GetPushedTexture and child:GetPushedTexture() and not child:GetName() then
			S:HandleCloseButton(child)
			child:SetPoint("TOPRIGHT", TutorialFrame, "TOPRIGHT", 2, 4)
		end
	end

	for i = 1, MAX_TUTORIAL_ALERTS do

		TutorialFrameAlertButton = _G["TutorialFrameAlertButton"..i]
		local TutorialFrameAlertButton = TutorialFrameAlertButton
		local TutorialFrameAlertButtonIcon = TutorialFrameAlertButton:GetNormalTexture()

		TutorialFrameAlertButton:StripTextures()
		TutorialFrameAlertButton:CreateBackdrop("Default", true)
		TutorialFrameAlertButton:SetWidth(45)
		TutorialFrameAlertButton:SetHeight(45)
		S:HandleItemButton(TutorialFrameAlertButton)

		TutorialFrameAlertButtonIcon:SetTexture("Interface\\TutorialFrame\\TutorialFrameAlert")
		TutorialFrameAlertButtonIcon:ClearAllPoints()
		TutorialFrameAlertButtonIcon:SetPoint("TOPLEFT", TutorialFrameAlertButton, "TOPLEFT", 0, 0)
		TutorialFrameAlertButtonIcon:SetPoint("BOTTOMRIGHT", TutorialFrameAlertButton, "BOTTOMRIGHT", 0, 0)
		TutorialFrameAlertButtonIcon:SetWidth(75)
		TutorialFrameAlertButtonIcon:SetHeight(75)
		-- TutorialFrameAlertButtonIcon:SetTexCoord(unpack(E.TexCoords))
	end

	TutorialFrame:StripTextures()
	TutorialFrame:SetTemplate("Transparent")

	S:HandleCheckBox(TutorialFrameCheckButton)

	S:HandleButton(TutorialFrameOkayButton)
end

S:AddCallback("Tutorial", S.LoadTutorialSkin)