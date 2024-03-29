local this = {}

function this:OnKillBoss(_, br)
    if br then
        return
    end
    for _, player in pairs(SomethingWicked.ItemHelpers:AllPlayersWithTrinket(mod.TRINKETS.MR_SKITS)) do
        for i = 1, 4, 1 do
            local scrunkly = Isaac.Spawn(EntityType.ENTITY_FAMILIAR, FamiliarVariant.SOMETHINGWICKED_NIGHTMARE, 0, player.Position, Vector.Zero, player)      
            scrunkly:ClearEntityFlags(EntityFlag.FLAG_APPEAR)
        end
    end
end

SomethingWicked:AddCustomCBack(SomethingWicked.CustomCallbacks.SWCB_ON_BOSS_ROOM_CLEARED, this.OnKillBoss)

this.EIDEntries = {}
return this