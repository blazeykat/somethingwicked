local this = {}
local mod = SomethingWicked
CollectibleType.SOMETHINGWICKED_CHRISMATORY = Isaac.GetItemIdByName("Chrismatory")

local wisps = 8
local angleOffset = 15
local angleVariance = 45
local function procChance(player)
    return 0.5
end
mod:AddCustomCBack(mod.CustomCallbacks.SWCB_ON_FIRE_PURE, function (_,  shooter, vector, scalar, player)
    if player:HasCollectible(CollectibleType.SOMETHINGWICKED_CHRISMATORY) then
        local isPlayer = shooter.Type == EntityType.ENTITY_PLAYER
        local p_data = player:GetData()
        local c_rng = player:GetCollectibleRNG(CollectibleType.SOMETHINGWICKED_CHRISMATORY)

        if p_data.sw_chrismatoryTick then
            for i = 1, wisps, 1 do
                local angle = (angleOffset + c_rng:RandomInt(angleVariance)+1)*(i%2==1 and -1 or 1)
                angle = vector:Rotated(angle)

                local v = mod:UtilGetFireVector(angle, player)
                local wisp = player:FireTear(player.Position - v, v, false, true, false, nil, scalar)
                wisp.Parent = nil
                wisp:ChangeVariant(TearVariant.SOMETHINGWICKED_WISP)
                wisp:AddTearFlags(TearFlags.TEAR_SPECTRAL)
                wisp.Height = wisp.Height * 3
                wisp.Scale = wisp.Scale * 1.15
                
                local colour = Color(1, 1, 1, 1)
                colour:SetColorize(2, 2, 2, 0.5)
                wisp.Color = colour
                local t_data = wisp:GetData()
                t_data.sw_homingSpeed = 15*(c_rng:RandomFloat()/2+0.75)
    
                SomethingWicked:UtilAddTrueHoming(wisp, mod.FamiliarHelpers:FindNearestVulnerableEnemy(wisp.Position), 35, false)
            end

            if isPlayer then
                p_data.sw_chrismatoryTick = -1

                player.FireDelay = player.FireDelay + math.abs(player.FireDelay)
                player.Velocity = player.Velocity - (vector*(math.max(player.MaxFireDelay*0.5, 0)^0.8))
                local color = Color(1, 1, 1, 1, 0.8, 0.8, 0.8)
                player:SetColor(color, 10, 5, true, false)
                mod.sfx:Play(SoundEffect.SOUND_JELLY_BOUNCE, 1, 0)
            end
        end
        if isPlayer and c_rng:RandomFloat() < procChance(player) then
            p_data.sw_chrismatoryTick = 150
        end
    end
end)

mod:AddCallback(ModCallbacks.MC_POST_PEFFECT_UPDATE, function (_, player)
    local p_data = player:GetData()
    if p_data.sw_chrismatoryTick then
        p_data.sw_chrismatoryTick = p_data.sw_chrismatoryTick - 1
        if p_data.sw_chrismatoryTick < 0 then
            p_data.sw_chrismatoryTick = nil
        end
        local color = Color(1, 1, 1, 1, 0.25, 0.25, 0.25)
        player:SetColor(color, 2, 3, false, false)
    end
end)

this.EIDEntries = {
    [CollectibleType.SOMETHINGWICKED_CHRISMATORY] = {
        desc = "maybe if you get lucky this little thing will spawn some ugly ghosty-goos"
    }
}
return this