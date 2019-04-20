local ADig = Class(function(self, inst)
    self.inst = inst
end)

function ADig:CollectEquippedActions(doer, target, actions, right)
    if right and (not target:HasTag("burnt"))  and target.components.diggable then
            table.insert(actions, ACTIONS.ADIG)
    end
end


return ADig