local this = {}
this.smokeColor = Color(0, 0, 0, 1, 0.2, 0.2 ,0.2)

function this:RemoveHeartContainerThing(player)
    local p_data = player:GetData()
    if player:GetEffectiveMaxHearts() - player:GetHearts() >= 2 then
        player:AddMaxHearts(-2)
        player:AddBlackHearts(1)

        local locust = Isaac.Spawn(EntityType.ENTITY_FAMILIAR, FamiliarVariant.ABYSS_LOCUST, mod.ITEMS.DEVILSTAIL, player.Position, Vector.Zero, player)
        locust.Parent = player

        p_data.WickedPData.framestoremovemoreheartcontainers = 6
    else
        p_data.WickedPData.framestoremovemoreheartcontainers = nil
    end
end

function this:OnDMG(player, amount, flag)
    player = player:ToPlayer()
    if player:HasCollectible(mod.ITEMS.DEVILSTAIL) then
        local p_data = player:GetData()
        --this:RemoveHeartContainerThing(player)
        p_data.WickedPData.framestoremovemoreheartcontainers = 2
    end
end

function this:PlayerUpdate(player)
    local p_data = player:GetData()
    if p_data.WickedPData.framestoremovemoreheartcontainers ~= nil then
        p_data.WickedPData.framestoremovemoreheartcontainers = p_data.WickedPData.framestoremovemoreheartcontainers - 1
        if p_data.WickedPData.framestoremovemoreheartcontainers <= 0 then
            this:RemoveHeartContainerThing(player)
        end
    end
end

SomethingWicked:AddCallback(ModCallbacks.MC_POST_PEFFECT_UPDATE, this.PlayerUpdate)
SomethingWicked:AddPriorityCallback(ModCallbacks.MC_ENTITY_TAKE_DMG, CallbackPriority.LATE, this.OnDMG, EntityType.ENTITY_PLAYER)

function this:LocustUpdate(locust)
    if locust.SubType ~= mod.ITEMS.DEVILSTAIL then
        return
    end

    local rng = locust:GetDropRNG()
    if rng:RandomFloat() < 0.1 then
        local trail = Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.HAEMO_TRAIL, 0, locust.Position, RandomVector() * 6, locust)
        trail.Color = this.smokeColor
    end
end

SomethingWicked:AddCallback(ModCallbacks.MC_FAMILIAR_UPDATE, this.LocustUpdate, FamiliarVariant.ABYSS_LOCUST)

this.EIDEntries = {
    [mod.ITEMS.DEVILSTAIL] = {
        desc = "!!! Taking damage with empty heart containers will remove all empty heart containers, and give half a black heart and an abyss locust",
        encycloDesc = SomethingWicked:UtilGenerateWikiDesc({"Taking damage with empty heart containers will remove all empty heart containers, and give half a black heart and an abyss locust"}),
        pools = {
            SomethingWicked.encyclopediaLootPools.POOL_DEVIL,
            SomethingWicked.encyclopediaLootPools.POOL_GREED_DEVIL
        }
    }
}
return this