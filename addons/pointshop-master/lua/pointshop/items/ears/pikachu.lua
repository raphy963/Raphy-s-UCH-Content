ITEM.Name = 'Pikachu Ears'
ITEM.Price = 1
ITEM.Model = 'models/uch_hats/pikachu.mdl'
ITEM.Attachment = 'eyes'
ITEM.LateNight = true

function ITEM:OnEquip(ply, modifications)
	ply:PS_AddClientsideModel(self.ID)
end

function ITEM:OnHolster(ply)
	ply:PS_RemoveClientsideModel(self.ID)
end

function ITEM:ModifyClientsideModel(ply, model, pos, ang)
    model:SetModelScale(1, 0)
    pos = pos + (ang:Forward() * -14) + (ang:Up() * 0.5)
    
    return model, pos, ang
end