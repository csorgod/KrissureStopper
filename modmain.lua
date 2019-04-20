local ActionHandler = GLOBAL.ActionHandler

print("estou dentro!")


PrefabFiles = {
    "dug_flamegeyser"
}

local function dig_up(inst)
	inst:Remove()
	if inst.components.diggable then
		inst.components.diggable:Collect(inst)
	end
end


local function dig_this(inst)
	
	if not inst.components.workable then
		inst:AddComponent("workable") 
		inst.components.workable:SetWorkAction(GLOBAL.ACTIONS.DIG) 
	    inst.components.workable:SetOnFinishCallback(dig_up)
	    inst.components.workable:SetWorkLeft(1)
	end

	inst:AddComponent("diggable")	
	inst.components.diggable:SetUp("dug_"..inst.prefab)	        
end

AddPrefabPostInit("flamegeyser", dig_this)
