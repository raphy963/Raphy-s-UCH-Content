ITEM.Name = 'Sly Cooper Cane'
ITEM.Price = 1
ITEM.Model = 'models/weapons/c_models/coop_staff/coop_staff.mdl'
ITEM.Bone = 'ValveBiped.Bip01_R_Hand'
ITEM.LateNight = true

function ITEM:OnEquip(ply, modifications)
	ply:PS_AddClientsideModel(self.ID)
end

function ITEM:OnHolster(ply)
	ply:PS_RemoveClientsideModel(self.ID)
end

function ITEM:ModifyClientsideModel(ply, model, pos, ang)
	local Size = Vector(1,1,1)
	local mat = Matrix()
	mat:Scale(Size)
	model:EnableMatrix('RenderMultiply', mat)

	model:SetMaterial('')

	local MAngle = Angle(270,180,0)
	local MPos = Vector(5.8299999237061,0,1)


	pos = pos + (ang:Forward() * MPos.x) + (ang:Up() * MPos.z) + (ang:Right() * MPos.y)
	ang:RotateAroundAxis(ang:Forward(), MAngle.p)
	ang:RotateAroundAxis(ang:Up(), MAngle.y)
	ang:RotateAroundAxis(ang:Right(), MAngle.r)

	return model, pos, ang
end