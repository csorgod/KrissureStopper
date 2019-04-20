
GLOBAL.setmetatable(env,{
__index = function (t,k)
return GLOBAL.rawget(GLOBAL,k)
end,
})


AddPrefabPostInit("armouredboat", function(inst) 

local function onopen(inst)
	if inst.components.drivable.driver == nil then
		inst.SoundEmitter:PlaySound("dontstarve_DLC002/common/HUD_boat_inventory_open")
	end
end

local function onclose(inst)
	if inst.components.drivable.driver == nil then
		inst.SoundEmitter:PlaySound("dontstarve_DLC002/common/HUD_boat_inventory_close")
	end
end

local function setupcontainer(inst, slots, bank, build, inspectslots, inspectbank, inspectbuild, inspectboatbadgepos, inspectboatequiproot)
	inst:AddComponent("container")
	inst.components.container:SetNumSlots(#slots)
	inst.components.container.type = "boat"
	inst.components.container.side_align_tip = -500
	inst.components.container.canbeopened = false
	inst.components.container.onopenfn = onopen
	inst.components.container.onclosefn = onclose

	inst.components.container.widgetslotpos = slots
	inst.components.container.widgetanimbank = bank
	inst.components.container.widgetanimbuild = build
	inst.components.container.widgetboatbadgepos = Vector3(0, 40, 0)
	inst.components.container.widgetequipslotroot = Vector3(-80, 40, 0)


	local boatwidgetinfo = {}
	boatwidgetinfo.widgetslotpos = inspectslots
	boatwidgetinfo.widgetanimbank = inspectbank
	boatwidgetinfo.widgetanimbuild = inspectbuild
	boatwidgetinfo.widgetboatbadgepos = inspectboatbadgepos
	boatwidgetinfo.widgetpos = Vector3(200, 0, 0)
	boatwidgetinfo.widgetequipslotroot = inspectboatequiproot
	inst.components.container.boatwidgetinfo = boatwidgetinfo
end

    local slotpos = {}
	for i = 6, 1,-1 do 
		table.insert(slotpos, Vector3(-13-(80*(i+2)), 40 ,0))
	end

	local inspectslotpos = {}
	for y = 1, 3 do
		for x = 0, 1 do
			table.insert(inspectslotpos, Vector3(-40 + (x*80), 70 + (y*-75),0))
		end
	end 

    setupcontainer(inst, slotpos, "boat_hud_cargo", "boat_hud_cargo", inspectslotpos, "boat_inspect_cargo", "boat_inspect_cargo", {x=0, y=155}, {x=40, y=70})
	inst.components.container.hasboatequipslots = true

end)