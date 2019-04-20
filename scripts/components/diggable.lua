local Diggable = Class(function(self, inst)
	self.inst = inst
	self.product = nil
end)

function Diggable:SetUp(product)
    self.product = product
end

function Diggable:Collect(inst)
	if inst.components.lootdropper then
		inst.components.lootdropper:SpawnLootPrefab(self.product)
	end
end

return Diggable