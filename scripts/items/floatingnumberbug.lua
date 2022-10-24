local this = {}
TrinketType.SOMETHINGWICKED_FLOATING_POINT_BUG = Isaac.GetTrinketIdByName("Floating Point Bug")

this.PossibleCorruptions = {
    {function ()
        SomethingWicked.game:ShowFortune()
    end, -1},
    {function ()
        Isaac:GetPlayer(0):UseCard(Card.CARD_TOWER)
    end, -2},
    {function ()
        Isaac:GetPlayer(0):UseCard(Card.CARD_REVERSE_HIGH_PRIESTESS)
    end, -4},
    {function ()
        Isaac:GetPlayer(0):UseCard(Card.CARD_REVERSE_TOWER)
    end, 0},
    {function ()
        Isaac:GetPlayer(0):UseActiveItem(CollectibleType.COLLECTIBLE_MEAT_CLEAVER, false)
    end, -1},
    {function ()
        Isaac:GetPlayer(0):UseActiveItem(CollectibleType.COLLECTIBLE_D10, false)
    end, -2},
    {function ()
        Isaac:GetPlayer(0):UseActiveItem(CollectibleType.COLLECTIBLE_GLOWING_HOURGLASS, false)
    end, -5},
    {function ()
        for index, value in ipairs(SomethingWicked:UtilGetAllPlayers()) do
            Isaac:GetPlayer(0):UseActiveItem(CollectibleType.COLLECTIBLE_CURSED_EYE)
        end
    end, -4},
    { function (pos)
        local enemiesInRadius = Isaac.FindInRadius(pos, 40, EntityPartition.ENEMY)
        for key, value in pairs(enemiesInRadius) do
            if value:ToNPC() and value:ToNPC():CanReroll() then
                SomethingWicked.game:RerollEnemy(value)
            end
        end
    end, -1},
    { function (pos)
        local pickups = Isaac.FindByType(EntityType.ENTITY_PICKUP)
        for key, value in pairs(pickups) do
            value = value:ToPickup()
            if value and value:CanReroll()
            and value.Variant ~= PickupVariant.PICKUP_COLLECTIBLE then
                value:Morph(EntityType.ENTITY_GAPER, 0, 0)
            end
        end

        Isaac.Spawn(EntityType.ENTITY_GAPER, 0, 0, pos, Vector.Zero, nil)
    end, -3},
    { function (pos)
        Isaac.Spawn(EntityType.ENTITY_GURGLING, 0, 0, pos, Vector.Zero, nil)
    end, -4},
    { function (pos)
        Isaac.Spawn(EntityType.ENTITY_BOMB, BombVariant.BOMB_GIGA, 0, pos, Vector.Zero, nil)
    end, -3},
    { function (pos)
        Isaac.Spawn(EntityType.ENTITY_BOMB, BombVariant.BOMB_GOLDENTROLL, 0, pos, Vector.Zero, nil)
    end, -3}
}

this.EIDEntries = {
    [TrinketType.SOMETHINGWICKED_FLOATING_POINT_BUG] = {
        desc = "sucks",
        isTrinket = true
    }
}
return this