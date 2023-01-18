local this = {}
CollectibleType.SOMETHINGWICKED_STICKER_BOOK = Isaac.GetItemIdByName("Sticker Book")
TearVariant.SOMETHINGWICKED_HEART_STICKER = Isaac.GetEntityVariantByName("Heart Sticker Tear")
TearVariant.SOMETHINGWICKED_BOMB_STICKER = Isaac.GetEntityVariantByName("Bomb Sticker Tear")
TearVariant.SOMETHINGWICKED_SKULL_STICKER = Isaac.GetEntityVariantByName("Skull Sticker Tear")

function ProcChance(player)
    return 1
end
SomethingWicked.TearFlagCore:AddNewFlagData(SomethingWicked.CustomTearFlags.FLAG_STICKER_BOOK, {
    ApplyLogic = function (_, player, tear)
        if player:HasCollectible(CollectibleType.SOMETHINGWICKED_STICKER_BOOK) then
            local c_rng = player:GetCollectibleRNG(CollectibleType.SOMETHINGWICKED_STICKER_BOOK)
            if c_rng:RandomFloat() < ProcChance(player) then
                this:MakeStickerY(tear, c_rng)
                return true
            end
        end
    end,
    EnemyHitEffect = function (_, tear, pos, enemy)
        this:HitEnemy(tear, pos, enemy)
    end
})
local stickerTypes = {
    "skull", --debuffs nearby enemies
    "bomb", --does an explode
    "heart", -- a lot of red creep
}

function this:HitEnemy(tear, pos, enemy)
    local t_data = tear:GetData()
    local e_data = enemy:GetData()
    if t_data.somethingWicked_sticker then
        local sticker = t_data.somethingWicked_sticker
        e_data.somethingWicked_stickers = e_data.somethingWicked_stickers or {}
        e_data.somethingWicked_stickers[sticker] = true
    end
end

function this:MakeStickerY(tear, rng)
    local t_data = tear:GetData()
    local stickerType = SomethingWicked:GetRandomElement(stickerTypes, rng)
    t_data.somethingWicked_sticker = stickerType
end

function this:OnEnemyDie(entity) 
    local e_data = entity:GetData()
    if e_data.somethingWicked_stickers then
        for key, _ in pairs(e_data.somethingWicked_stickers) do
            if key == "skull" then
                
            end
            if key == "bomb" then
                
            end
            if key == "heart" then
                
            end
        end
    end
end

this.EIDEntries = {
    [CollectibleType.SOMETHINGWICKED_STICKER_BOOK] = {
        desc = "bookie"
    }
}
return this