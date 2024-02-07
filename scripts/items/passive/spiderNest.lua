local framesToSpawnEggs, SpiderCap = 165, 7
local mod = SomethingWicked
local sfx, game = SFXManager(), Game()

local function IsFiring(_, player)
    if not player:HasCollectible(CollectibleType.SOMETHINGWICKED_SPIDER_EGG) then
        return
    end

    local p_data = player:GetData()
    p_data.SomethingWickedPData.spiderEgg_FireCountdown = math.max((p_data.SomethingWickedPData.spiderEgg_FireCountdown or framesToSpawnEggs) - 1, (player:GetFireDirection() ~= Direction.NO_DIRECTION and 0 or 1))

    if p_data.SomethingWickedPData.spiderEgg_FireCountdown <= 0 then
        p_data.SomethingWickedPData.spiderEgg_FireCountdown = framesToSpawnEggs

        if #Isaac.FindByType(EntityType.ENTITY_FAMILIAR, FamiliarVariant.BLUE_SPIDER) >= SpiderCap then
            return
        end

        local c_rng = player:GetCollectibleRNG(CollectibleType.SOMETHINGWICKED_SPIDER_EGG)
        local vector = mod:UtilGetFireVector(player:GetAimDirection(), player)
        vector = vector:Rotated(c_rng:RandomFloat()*25)
        local testEffect = Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.SOMETHINGWICKED_SPIDER_EGG, 0, player.Position, (vector:Normalized())*6, player):ToEffect()
        testEffect.FallingSpeed = 5
        testEffect.FallingAcceleration = -0.25
        testEffect.Parent = player

        sfx:Play(SoundEffect.SOUND_BOIL_HATCH, 0.5, 0)
    end
end

local function UpdateEffect(_, effect)
    effect.FallingSpeed = effect.FallingSpeed + effect.FallingAcceleration
    effect.m_Height = effect.m_Height + effect.FallingSpeed
    effect.SpriteOffset = Vector(0, -1) * effect.m_Height

    if effect.m_Height < -10 then
        game:SpawnParticles(effect.Position, EffectVariant.BLOOD_PARTICLE, 3, 3, Color(1, 1, 1, 1, 1, 1, 1))

        local player = effect.Parent:ToPlayer()
        if player then
            player:AddBlueSpider(effect.Position)
        end

        effect:Remove()
    end
end

SomethingWicked:AddCallback(ModCallbacks.MC_POST_PEFFECT_UPDATE, IsFiring)
SomethingWicked:AddCallback(ModCallbacks.MC_POST_EFFECT_UPDATE, UpdateEffect, EffectVariant.SOMETHINGWICKED_SPIDER_EGG)