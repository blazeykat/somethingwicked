local this = {}
CollectibleType.SOMETHINGWICKED_LANKY_MUSHROOM = Isaac.GetItemIdByName("Lanky Mushroom")

SomethingWicked:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, function (_, player, flags)
    local mult = player:GetCollectibleNum(CollectibleType.SOMETHINGWICKED_LANKY_MUSHROOM)
    if flags == CacheFlag.CACHE_FIREDELAY then
        player.MaxFireDelay = SomethingWicked.StatUps:TearsUp(player, mult * -0.4)
    end
    if flags == CacheFlag.CACHE_DAMAGE then
        player.Damage = SomethingWicked.StatUps:DamageUp(player, mult * 0.7)
    end
    if flags == CacheFlag.CACHE_RANGE then
        player.TearRange = player.TearRange + (40 * 0.75 * mult)
    end
    if flags == CacheFlag.CACHE_SIZE then
        player.SpriteScale = player.SpriteScale * (mult == 0 and Vector(1, 1) or Vector(0.5, 1.5))
    end
end)

this.EIDEntries = {}
return this