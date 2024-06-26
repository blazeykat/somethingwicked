local this = {}
local mod = SomethingWicked
local sfx = SFXManager()

mod:AddNewTearFlag(SomethingWicked.CustomTearFlags.FLAG_BALROG_HEART, {
    OverrideTearUpdate = function (_, tear)
        this:TearUpdate(tear)
    end ,
    ApplyLogic = function (_, player, tear) 
        return this:FireTear(player, tear)
    end,
    EndHitEffect = function (_, tear, pos)
        this:TearOnHit(tear, pos)
    end,
    PostApply = function (_, tear)
        if tear.Type == EntityType.ENTITY_TEAR then
            tear.Velocity = tear.Velocity * 1.625
        end
    end
})

function this:TearUpdate(tear)
    local fCount = tear.FrameCount
    if fCount % 3 == 2 then
        local thefloatingfire = Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.RED_CANDLE_FLAME, 0, tear.Position, Vector.Zero, tear):ToEffect()
        thefloatingfire.CollisionDamage = tear.CollisionDamage / 11
        thefloatingfire.SpriteScale = Vector(1/2, 1/2)
        thefloatingfire:SetTimeout(35)
    end
end

function this:TearOnHit(tear, pos)
    sfx:Play(SoundEffect.SOUND_EXPLOSION_WEAK)
    local thefloatingfire = Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.RED_CANDLE_FLAME, 0, pos, Vector.Zero, tear):ToEffect()
    thefloatingfire.CollisionDamage = tear.CollisionDamage/3
    thefloatingfire:SetTimeout(70)
end

function this:FireTear(player, tear)
    if player and player:HasCollectible(mod.ITEMS.BALROGS_HEART) then
        local c_rng = player:GetCollectibleRNG(mod.ITEMS.BALROGS_HEART)
        local f = c_rng:RandomFloat()
        if f < 1+0.15 then
            return true
        end
    end
end

this.EIDEntries = {
    [mod.ITEMS.BALROGS_HEART] = {
        desc = "",
        Hide = true,
    }
}
return this