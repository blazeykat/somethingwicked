local this = {}
local mod = SomethingWicked
CollectibleType.SOMETHINGWICKED_UNNAMED_TECH_ITEM = Isaac.GetItemIdByName("idk tech thing??")

local function FirePerpendicularLasers(_, player, tear, dmgmult)
    if not player:HasCollectible(CollectibleType.SOMETHINGWICKED_UNNAMED_TECH_ITEM) then
        return
    end
    local vel = tear.Velocity
    --local _, pos = room:CheckLine(shooter.Position, shooter.Position + vel, 0)

    local stacks = math.max(player:GetCollectibleNum(CollectibleType.SOMETHINGWICKED_UNNAMED_TECH_ITEM), 1)
    mod:DoHitscan(tear.Position, vel, player, function (position)
        for i = -1, 1, 2 do
            local ang = vel:Normalized():Rotated(90*i)
            local laser = player:FireTechLaser(position - (ang*27), 4, ang, true, false, nil, (dmgmult*0.5*stacks))
            laser.Parent = nil
        end
    end)

end

local function fire(tear)
    local player = mod:UtilGetPlayerFromTear(tear)
    if not player or not tear.Parent or tear.Parent.Type ~= EntityType.ENTITY_PLAYER then
        return
    end
    FirePerpendicularLasers(_,player,tear, tear.CollisionDamage/player.Damage)
end
mod:AddCallback(ModCallbacks.MC_POST_FIRE_TEAR, function (_, tear)
    fire(tear)
end)
mod:AddCustomCBack(mod.CustomCallbacks.SWCB_ON_LASER_FIRED, function (_, tear)
    fire(tear)
end)
mod:AddCallback(ModCallbacks.MC_POST_BOMB_UPDATE, function (_, bomb)
    if bomb.FrameCount ~= -1 then
        return
    end
    local player = mod:UtilGetPlayerFromTear(bomb)
    if not bomb or not bomb.IsFetus or not bomb.Parent or bomb.Parent.Type ~= EntityType.ENTITY_PLAYER then
        return
    end
    FirePerpendicularLasers(_,player,bomb, bomb.ExplosionDamage/player.Damage)
end)

mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, function (_, player, flags)
    if flags == CacheFlag.CACHE_DAMAGE then
        player.Damage = mod.StatUps:DamageUp(player, 0, 0, player:HasCollectible(CollectibleType.SOMETHINGWICKED_UNNAMED_TECH_ITEM) and 0.66 or 1)
    end
end)

this.EIDEntries = {
    [CollectibleType.SOMETHINGWICKED_UNNAMED_TECH_ITEM] = {
        desc = "boogie",
        Hide = true,
    }
}
return this