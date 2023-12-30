local mod = SomethingWicked
local function genericWikiTable(id, desc)
    return {
        ID = id,
        ModName = "Something Wicked (The Unlisted Beta)",
        Class = "Something Wicked",
        WikiDesc = Encyclopedia.EIDtoWiki(desc)
    }
end
--not writing 99 null checks forgive me
local encyclopediaLootPools = {
  POOL_TREASURE = Encyclopedia and Encyclopedia.ItemPools.POOL_TREASURE or -1,
  POOL_SHOP = Encyclopedia and Encyclopedia.ItemPools.POOL_SHOP or -1,
  POOL_BOSS = Encyclopedia and Encyclopedia.ItemPools.POOL_BOSS or -1,
  POOL_DEVIL = Encyclopedia and Encyclopedia.ItemPools.POOL_DEVIL or -1,
  POOL_ANGEL = Encyclopedia and Encyclopedia.ItemPools.POOL_ANGEL or -1,
  POOL_SECRET = Encyclopedia and Encyclopedia.ItemPools.POOL_SECRET or -1,
  POOL_LIBRARY = Encyclopedia and Encyclopedia.ItemPools.POOL_LIBRARY or -1,
  POOL_SHELL_GAME = Encyclopedia and Encyclopedia.ItemPools.POOL_SHELL_GAME or -1,
  POOL_GOLDEN_CHEST = Encyclopedia and Encyclopedia.ItemPools.POOL_GOLDEN_CHEST or -1,
  POOL_RED_CHEST = Encyclopedia and Encyclopedia.ItemPools.POOL_RED_CHEST or -1,
  POOL_BEGGAR = Encyclopedia and Encyclopedia.ItemPools.POOL_BEGGAR or -1,
  POOL_DEMON_BEGGAR = Encyclopedia and Encyclopedia.ItemPools.POOL_DEMON_BEGGAR or -1,
  POOL_CURSE = Encyclopedia and Encyclopedia.ItemPools.POOL_CURSE or -1,
  POOL_KEY_MASTER = Encyclopedia and Encyclopedia.ItemPools.POOL_KEY_MASTER or -1,
  POOL_BATTERY_BUM = Encyclopedia and Encyclopedia.ItemPools.POOL_BATTERY_BUM or -1,
  POOL_MOMS_CHEST = Encyclopedia and Encyclopedia.ItemPools.POOL_MOMS_CHEST or -1,
  POOL_GREED_TREASURE = Encyclopedia and Encyclopedia.ItemPools.POOL_GREED_TREASURE or -1,
  POOL_GREED_BOSS = Encyclopedia and Encyclopedia.ItemPools.POOL_GREED_BOSS or -1,
  POOL_GREED_SHOP = Encyclopedia and Encyclopedia.ItemPools.POOL_GREED_SHOP or -1,
  POOL_GREED_DEVIL = Encyclopedia and Encyclopedia.ItemPools.POOL_GREED_DEVIL or -1,
  POOL_GREED_ANGEL = Encyclopedia and Encyclopedia.ItemPools.POOL_GREED_ANGEL or -1,
  POOL_GREED_CURSE = Encyclopedia and Encyclopedia.ItemPools.POOL_GREED_CURSE or -1,
  POOL_GREED_SECRET = Encyclopedia and Encyclopedia.ItemPools.POOL_GREED_SECRET or -1,
  POOL_CRANE_GAME = Encyclopedia and Encyclopedia.ItemPools.POOL_CRANE_GAME or -1,
  POOL_ULTRA_SECRET = Encyclopedia and Encyclopedia.ItemPools.POOL_ULTRA_SECRET or -1,
  POOL_BOMB_BUM	= Encyclopedia and Encyclopedia.ItemPools.POOL_BOMB_BUM or -1,
  POOL_PLANETARIUM = Encyclopedia and Encyclopedia.ItemPools.POOL_PLANETARIUM or -1,
  POOL_OLD_CHEST = Encyclopedia and Encyclopedia.ItemPools.POOL_OLD_CHEST or -1,
  POOL_BABY_SHOP = Encyclopedia and Encyclopedia.ItemPools.POOL_BABY_SHOP or -1,
  POOL_WOODEN_CHEST	= Encyclopedia and Encyclopedia.ItemPools.POOL_WOODEN_CHEST or -1,
  POOL_ROTTEN_BEGGAR = Encyclopedia and Encyclopedia.ItemPools.POOL_ROTTEN_BEGGAR or -1,
}

if EID then
    local icon = Sprite()
    icon:Load("gfx/ui/eid_icon.anm2", true)
    EID:addIcon("SomethingWicked", "Idle", 0, 32, 32, 6, 4, icon)

    EID:setModIndicatorName("Something Wicked")
    EID:setModIndicatorIcon("SomethingWicked")

    local curseIcon = Sprite()
    curseIcon:Load("gfx/somethingwicked_status_effects.anm2", true)
    EID:addIcon("SWCurseStatusIcon", "Curse", 0, 14, 14, 6, 4, curseIcon)
end
mod.GENERIC_DESCRIPTIONS = {
    CURSE = "#{{SWCurseStatusIcon}} Cursed enemies will take 1.5x damage, and will gain a slight slowing effect",
    DREAD = "",
    BITTER = "",
    ELECTROSTUN = "",

    NIGHTMARES = "",
    TERATOMAS = "",

    CARDDRAW = "Cannot use The Fool? The Lovers?, The Stars? or Wheel of Fortune?#Teleport cards will only be rarely used, and cannot be drawn during boss fights",
}
local collectibles = {
    [CollectibleType.SOMETHINGWICKED_AVENGER_EMBLEM] = {
        desc = "↑ {{Damage}} +1 Damage up",
        pools = {
            encyclopediaLootPools.POOL_BOSS,
            encyclopediaLootPools.POOL_GREED_BOSS
        }
    },
    [CollectibleType.SOMETHINGWICKED_WOODEN_HORN] = {
        desc = "↑ {{Damage}} +0.5 Damage up#{{BlackHeart}} +1 Black Heart",
        pools = {
            encyclopediaLootPools.POOL_BOSS,
            encyclopediaLootPools.POOL_GREED_BOSS,
            encyclopediaLootPools.POOL_WOODEN_CHEST
        }
    },
    [CollectibleType.SOMETHINGWICKED_SILVER_RING] = {
        desc = "↑ {{Damage}} +0.3 Damage up#↑ {{Damage}} +10% Damage Multiplier",
        pools = {
            encyclopediaLootPools.POOL_GOLDEN_CHEST,
            encyclopediaLootPools.POOL_CRANE_GAME,
        },
    },
    [CollectibleType.SOMETHINGWICKED_WHITE_ROSE] = {
        desc = "↑ {{Tears}} +0.4 Tears up#1 soul heart#↑ Spawns four {{Collectible584}} Book of Virtues wisps on pickup",
        pools = {
            encyclopediaLootPools.POOL_BOSS,
            encyclopediaLootPools.POOL_GREED_BOSS,
            encyclopediaLootPools.POOL_TREASURE,
            encyclopediaLootPools.POOL_ANGEL,
            encyclopediaLootPools.POOL_GREED_ANGEL
        },
    },
    [CollectibleType.SOMETHINGWICKED_WICKED_SOUL] = {
        desc = [[↑ {{Damage}} +30% Damage Multiplier#↑ {{Damage}} +0.5 Damage#↑ {{Luck}} +1 Luck up #↑ {{Speed}} +0.2 Speed up
        #↑ {{ShotSpeed}} +0.1 Shot Speed up #↑{{Range}} +1.2 Range up#!!! A bonus curse will be added every floor]],
        pools = {
            encyclopediaLootPools.POOL_TREASURE,
            encyclopediaLootPools.POOL_CURSE,
            encyclopediaLootPools.POOL_GREED_TREASURE,
        },
    },
    [CollectibleType.SOMETHINGWICKED_BOTTLE_OF_SHAMPOO] = {
        desc = "↑ {{Tears}} +0.5 Tears up#↑ {{Speed}} +0.3 Speed up",
        pools = {
            encyclopediaLootPools.POOL_BOSS,
            encyclopediaLootPools.POOL_GOLDEN_CHEST,
            encyclopediaLootPools.POOL_GREED_BOSS
        }
    },
    [CollectibleType.SOMETHINGWICKED_D_STOCK] = {
        desc = "{{Shop}} Restocks the current shop if used inside a shop#Will also similarly restock {{DevilRoom}} Devil Deals and {{Collectible586}} Stairway shops",
        pools = {
            encyclopediaLootPools.POOL_SHOP,
            encyclopediaLootPools.POOL_GREED_SHOP,
        },
    },
    [CollectibleType.SOMETHINGWICKED_LANKY_MUSHROOM] = {
        desc = "↑ {{Damage}} +0.7 Damage up#↓ {{Tears}} -0.4 Tears down#↑ {{Range}} 0.75 Range up#Makes Isaac 50% taller and 25% thinner",
        pools = {
            encyclopediaLootPools.POOL_TREASURE,
            encyclopediaLootPools.POOL_SECRET,
            encyclopediaLootPools.POOL_GREED_TREASURE,
            encyclopediaLootPools.POOL_GREED_BOSS
        }
    },
    [CollectibleType.SOMETHINGWICKED_ELECTRIC_DICE] = {
        desc = "↑ Has a chance to use an active item 1-2 more times on use",
        pools = {
            encyclopediaLootPools.POOL_SHOP,
            encyclopediaLootPools.POOL_GREED_SHOP
        },
    },
    [CollectibleType.SOMETHINGWICKED_HELLFIRE] = {
        desc = "{{Collectible118}} On death, enemies have a chance to stay alive for slightly longer, then explode and fire 4 brimstone lasers in the cardinal directions#{{Luck}} Scales with luck",
        pools = { encyclopediaLootPools.POOL_DEVIL, encyclopediaLootPools.POOL_ULTRA_SECRET,
            encyclopediaLootPools.POOL_GREED_DEVIL}
    },
    [CollectibleType.SOMETHINGWICKED_CROWN_OF_BLOOD] = {
        desc = "!!! Enemies respawn at half health on death#↑ Room clear rewards will run twice#↑ +2 luck",
        Hide = true,
    },
    [CollectibleType.SOMETHINGWICKED_OLD_URN] = {
        desc = "{{Card81}} Spawns 3 soul stones on pickup#{{Rune}} Will spawn runes if no soul stones are unlocked",
        pools = {
            encyclopediaLootPools.POOL_SHOP,
            encyclopediaLootPools.POOL_SECRET,
            encyclopediaLootPools.POOL_GREED_SHOP,
            encyclopediaLootPools.POOL_GREED_SECRET
        }
    },
    [CollectibleType.SOMETHINGWICKED_RED_LOCKBOX] = {
        desc = "{{SoulHeart}} Spawns 4-6 soul hearts on pickup",
        pools = {
            encyclopediaLootPools.POOL_RED_CHEST,
            encyclopediaLootPools.POOL_DEMON_BEGGAR,
            encyclopediaLootPools.POOL_KEY_MASTER,
            encyclopediaLootPools.POOL_ULTRA_SECRET,
        },
    },
    [CollectibleType.SOMETHINGWICKED_ITEM_BOX] = {
        desc = "\1 Grants the effect of 4 random items for the current room",
        pools = { encyclopediaLootPools.POOL_TREASURE, encyclopediaLootPools.POOL_GREED_TREASURE, encyclopediaLootPools.POOL_SECRET }
    },
    [CollectibleType.SOMETHINGWICKED_CURSED_MUSHROOM] = {
        desc = "Upon use, curses all enemies in the room for 7 seconds"..mod.GENERIC_DESCRIPTIONS.CURSE,
        pools = {
            encyclopediaLootPools.POOL_TREASURE,
            encyclopediaLootPools.POOL_CRANE_GAME,
            encyclopediaLootPools.POOL_GREED_TREASURE,
        },
    },
    [CollectibleType.SOMETHINGWICKED_TRINKET_SMASHER] = {
        desc = "{{Trinket}} Destroys any held trinkets on use#Spawns 3-4 random pickups on trinket destroy#Increases the spawn rate of trinkets",
        pools = {
            encyclopediaLootPools.POOL_SHOP,
            encyclopediaLootPools.POOL_GREED_SHOP
        }
    },
    [CollectibleType.SOMETHINGWICKED_STAR_SPAWN] = {
        desc = "↑ {{Damage} 1.2x Damage#↑ {{Tears}} 1.2x Tears#\1 On damage, applies a random multiplier to both tears and damage#Lowest multipler can be 0.5x, Highest multipler can be 2.4x",
        pools = { encyclopediaLootPools.POOL_TREASURE, encyclopediaLootPools.POOL_CRANE_GAME,
            encyclopediaLootPools.POOL_ULTRA_SECRET, encyclopediaLootPools.POOL_GREED_TREASURE }
    },
    [CollectibleType.SOMETHINGWICKED_BRAVERY] = {
        desc = "↑ 1.5x damage against bosses and champion enemies",
        pools = {
            encyclopediaLootPools.POOL_TREASURE,
            encyclopediaLootPools.POOL_GOLDEN_CHEST,
            encyclopediaLootPools.POOL_CRANE_GAME,
            encyclopediaLootPools.POOL_GREED_TREASURE,
        }
    },
    [CollectibleType.SOMETHINGWICKED_PLANCHETTE] = {
        desc = "↑ {{Collectible163}} All Wisps, Nightmares, and other ghost-like familiars have double HP and deal double damage#"
        .."{{Collectible584}} Spawns four unique Book of Virtues wisps on pickup#{{BlackHeart}} +1 Black Heart",
        pools = {
            encyclopediaLootPools.POOL_SHOP,
            encyclopediaLootPools.POOL_GREED_SHOP,
            encyclopediaLootPools.POOL_CURSE,
            encyclopediaLootPools.POOL_GREED_CURSE
        }
    },
    [CollectibleType.SOMETHINGWICKED_AIR_FRESHENER] = {
        Hide = true,
        desc = "freshens air"
    },
        [CollectibleType.SOMETHINGWICKED_ENCYCLOPEDIA] = {
            desc = "↑ Bonus 33% chance to spawn a {{Library}} Library on new floor entry while held#{{Library}} Teleports the player to the Library on use# !!! Only charged if there is a library on the floor",
            pools = {
                encyclopediaLootPools.POOL_LIBRARY,
                encyclopediaLootPools.POOL_TREASURE
            }
        },
    [CollectibleType.SOMETHINGWICKED_PLASMA_GLOBE] = {
        desc = "{{Confusion}} Tears have a chance to confuse enemies for 2 seconds and cause them to shoot lightning out in random directions#{{Luck}} 100% chance at 14 Luck",
        pools = {
            encyclopediaLootPools.POOL_TREASURE,
            encyclopediaLootPools.POOL_CRANE_GAME,
            encyclopediaLootPools.POOL_GREED_TREASURE
        }
    },
    [CollectibleType.SOMETHINGWICKED_VOID_BOMBS] = {
        desc = "{{Bomb}} +5 bombs #{{Collectible399}} Isaac's bombs spawn a Maw of The Void ring upon exploding",
        pools = {
            encyclopediaLootPools.POOL_DEVIL,
            encyclopediaLootPools.POOL_GREED_DEVIL,
            encyclopediaLootPools.POOL_BOMB_BUM
        }
    },
    [CollectibleType.SOMETHINGWICKED_BOLINE] = {
        desc = "{{Collectible399}} Throws a Maw of the Void ring on use#Will also recharge on taking damage",
        pools = {
            encyclopediaLootPools.POOL_DEVIL,
            encyclopediaLootPools.POOL_GREED_DEVIL,
        }
    }, 
    [CollectibleType.SOMETHINGWICKED_LOURDES_WATER] = {
        desc = "↑ Every room, a random rock will turn into an angellic statue#Standing inside the statue's aura grants:#↑ {{Damage}} +20% Damage#↑ {{Tears}} +150% Tears Multiplier#Homing tears#↑ Enemies that try to enter the aura will be damaged and repelled",
        pools = {
            encyclopediaLootPools.POOL_TREASURE,
            encyclopediaLootPools.POOL_ANGEL,
        }
    },
    [CollectibleType.SOMETHINGWICKED_BOOK_OF_EXODUS] = {
        desc = "{{Trinket}} Converts any trinkets to golden trinkets on use↑ While held, doubles all trinket spawns#↑ {{Luck}} +1 Luck while held",
        pools = {
            encyclopediaLootPools.POOL_SHOP,
            encyclopediaLootPools.POOL_GREED_SHOP,
            encyclopediaLootPools.POOL_LIBRARY
        }
    },
    [CollectibleType.SOMETHINGWICKED_WOODEN_DICE] = {
        desc = "{{Trinket}} Rerolls any trinkets on you, smelted or not, upon use#↑ While held, smelts one trinket upon entering a new floor#↑ {{Luck}} +1 Luck while held",
        pools = {
            encyclopediaLootPools.POOL_SHOP,
            encyclopediaLootPools.POOL_GREED_SHOP,
        }
    },
    [CollectibleType.SOMETHINGWICKED_WICKERMAN] = {
        desc = "↑ Every floor will spawn a {{SacrificeRoom}} Sacrifice Room if possible#Spawns 2 red hearts on pickup",
        pools = {
            encyclopediaLootPools.POOL_SHOP,
            encyclopediaLootPools.POOL_CRANE_GAME
        }
    },
    [CollectibleType.SOMETHINGWICKED_APOLLYONS_CROWN] = {
        desc = "{{Collectible706}}Spawns 2-4 permanent abyss locusts as companions#Can rarely spawn unique locusts with the effects of other item's locusts",
        pools = {
            encyclopediaLootPools.POOL_TREASURE,
            encyclopediaLootPools.POOL_DEVIL,
            encyclopediaLootPools.POOL_BABY_SHOP,
            encyclopediaLootPools.POOL_GREED_TREASURE
        }
    },
    [CollectibleType.SOMETHINGWICKED_TECH_MODULO] = {
        desc = "Firing a tear will fire two perpendicular half damage lasers at wherever the tear would land#↓ {{Damage}} -33.3% damage down",
        pools = { encyclopediaLootPools.POOL_TREASURE, encyclopediaLootPools.POOL_GREED_TREASURE, encyclopediaLootPools.POOL_CRANE_GAME}
    },
    [CollectibleType.SOMETHINGWICKED_STRANGE_APPLE] = {
        desc = [[↑ Spawns a snake familiar that takes up half a grid of position and moves along the grid every 6 frames#
            Deals 10 damage from the head, 5 damage from the body, and does individual damage from every segment colliding]],
        pools = {
            encyclopediaLootPools.POOL_TREASURE, encyclopediaLootPools.POOL_SECRET,
            encyclopediaLootPools.POOL_ULTRA_SECRET, encyclopediaLootPools.POOL_BABY_SHOP,
            encyclopediaLootPools.POOL_GREED_TREASURE, encyclopediaLootPools.POOL_GREED_SECRET
        }
    },
    [CollectibleType.SOMETHINGWICKED_TIAMATS_DICE] = {
        desc = "Rerolls items into items from a random item pool, with a random cost",
        pools = {
            encyclopediaLootPools.POOL_SECRET,
            encyclopediaLootPools.POOL_GREED_SECRET
        }
    },
    [CollectibleType.SOMETHINGWICKED_CURSED_CREDIT_CARD] = {
        desc = "{{DevilRoom}} Buying a devil deal Item has a 50% chance to not cost hearts#Has less of a chance to activate on items with a bigger heart price#{{BlackHeart}} +1 Black Heart",
        pools = {
            encyclopediaLootPools.POOL_CURSE,
            encyclopediaLootPools.POOL_ULTRA_SECRET,
        },
        --encycloDesc = SomethingWicked:UtilGenerateWikiDesc({"Buying a Devil Deal Item has a "..(this.ProcChance * 100).."% chance to not cost hearts","Items which cost more hearts have less of a chance to work","Adds 1 black heart on pickup"})
    },
    [CollectibleType.SOMETHINGWICKED_RED_NIGHTMARE] = {
        desc = "Adds an extra {{UltraSecretRoom}} Ultra Secret Room to each floor#{{Card78}} Spawns 1-3 Cracked Keys",
        pools = { encyclopediaLootPools.POOL_ULTRA_SECRET}
    },
    [CollectibleType.SOMETHINGWICKED_FRUIT_MILK] = {
        desc = "Each one of Isaac's tears gets four different effects#↓ {{Damage}} x0.2 Damage multiplier",
        pools = { encyclopediaLootPools.POOL_TREASURE, encyclopediaLootPools.POOL_GREED_TREASURE }
    },
    [CollectibleType.SOMETHINGWICKED_LANTERN_BATTERY] = {
        desc = "{{Battery}} 25% chance to give bonus charge on room clear or wave clear#Spawns a battery on pickup",
        pools = { encyclopediaLootPools.POOL_SHOP, encyclopediaLootPools.POOL_GREED_SHOP}
    },
    [CollectibleType.SOMETHINGWICKED_OLD_DICE] = {
        desc = [[Upon use, rerolls the current item being picked up into a random passive item
            #Does nothing if you are not picking up an item
            #If dropped to pick up another active, can be used while you are picking up the active]],
        pools = {
            encyclopediaLootPools.POOL_TREASURE,
            encyclopediaLootPools.POOL_GREED_SHOP,
            encyclopediaLootPools.POOL_CRANE_GAME
        },
    },
    [CollectibleType.SOMETHINGWICKED_EDENS_HEAD] = {
        desc = "Uses a random throwable active item on use",
        encycloDesc = "Uses a random throwable active item on use",
        pools = { encyclopediaLootPools.POOL_TREASURE, encyclopediaLootPools.POOL_GREED_TREASURE}
    },
    [CollectibleType.SOMETHINGWICKED_CURSED_CANDLE] = {
        desc = "Throws a curse flame on use#This cursed flame curses enemies for 6 seconds on contact#Cursed enemies will take 1.5x damage, and the curse effect will last for 6 seconds",
        pools = {
            encyclopediaLootPools.POOL_SHOP,
            encyclopediaLootPools.POOL_GREED_SHOP,
        },
    },
    [CollectibleType.SOMETHINGWICKED_ABANDONED_BOX] = {
        desc = "{{Warning}} SINGLE USE {{Warning}}#Spawns a random familiar from the current room's item pool",
        pools = {
            encyclopediaLootPools.POOL_SHOP,
            encyclopediaLootPools.POOL_GREED_SHOP
        }
    },
    [CollectibleType.SOMETHINGWICKED_RED_CAP] = {
        desc = "Picking up a soul heart with empty red hearts will convert it to red hearts, at a 2x rate#↑ {{Heart}} +2 Health up#+Heals 3 hearts on pickup#↓ {{Shotspeed}} -0.15 Shot Speed down#↓ {{Range}} -0.8 Range down",
        pools = { encyclopediaLootPools.POOL_TREASURE, encyclopediaLootPools.POOL_SECRET, encyclopediaLootPools.POOL_ULTRA_SECRET }
    },
    [CollectibleType.SOMETHINGWICKED_DADS_WALLET] = {
        desc = "{{Shop}} Allows Isaac to take 4 shop items for free#Charge corresponds to items left to take",
        pools = {
            encyclopediaLootPools.POOL_SHOP,
            encyclopediaLootPools.POOL_GREED_SHOP,
            encyclopediaLootPools.POOL_OLD_CHEST,
        },
    },
    [CollectibleType.SOMETHINGWICKED_WICKED_RING] = {
        desc = "Chance to shoot tears with increased damage that add charge to active items after doing enough damage#Damage needed per charge increases each floor#{{Luck}} Scales with luck",
        pools = {
            encyclopediaLootPools.POOL_DEVIL,
            encyclopediaLootPools.POOL_CURSE,
            encyclopediaLootPools.POOL_GREED_DEVIL
        }
    }
}

for index, value in pairs(collectibles) do
    --print(index, value.desc)
    if EID then
        EID:addCollectible(index, value.desc)
    end

    if Encyclopedia and Encyclopedia.EIDtoWiki then --/shrug
        local tab = genericWikiTable(index, value.desc)
        tab.Pools = value.pools
        tab.Hide = value.Hide or false
        Encyclopedia.AddItem(tab)
    end
end

local trinkets = {
    [TrinketType.SOMETHINGWICKED_TWO_OF_COINS] = {
        desc = "{{Heart}} Spawns 2-4 coins upon picking up a red heart"
    },
    [TrinketType.SOMETHINGWICKED_CATS_EYE] = {
        desc = "↑ Spawns 1 sack upon entering a {{SecretRoom}} Secret Room",
        metadataFunction = function (item)
            EID:addGoldenTrinketMetadata(item, nil, 1)
        end
    },
    [TrinketType.SOMETHINGWICKED_STONE_KEY] = {
        desc = "↑ Opening a secret room will refund one bomb#Walking into bomb chests opens them for free",
        metadataFunction = function (item)
            EID:addGoldenTrinketMetadata(item, {"25% chance to spawn an additional bomb from opening Secret Rooms",
            "50% chance to spawn an additional bomb from opening Secret Rooms"})
        end
    },
    [TrinketType.SOMETHINGWICKED_TREASURERS_KEY] = {
        desc = "{{TreasureRoom}} Treasure Rooms and {{Planetarium}} Planetariums will spawn unlocked",
    },
    [TrinketType.SOMETHINGWICKED_CURSED_KEY] = {
        desc = "{{CursedRoom}} All locked doors will spawn as unlocked Curse Room doors",
    },
    [TrinketType.SOMETHINGWICKED_DICE_ROLLER] = {
        desc = "Using an active item has a chance to trigger one of the following effects:#{{Collectible105}} D6#{{Collectible406}} D8#{{Collectible285}} D10#{{Collectible386}} D12#{{Collectible166}} D20#Chance scales with the charge of the item used"
    },
    [TrinketType.SOMETHINGWICKED_GACHAPON] = {
        desc = "{{Trinket}} If rerolled or destroyed by any means, grants the following to the player who held it last"
        ..": #\1 {{Damage}} +0.6 Damage#\1 {{Tears}} +0.2 Tears up #\1 {{Speed}} +0.2 Speed up#↑ {{ShotSpeed}} +0.1 Shot Speed up #↑ {{Range}} +0.75 Range up#\1 {{Luck}} +1 Luck up",
        metadataFunction = function (item)
            EID:addGoldenTrinketMetadata(item, nil, { 0.6, 0.5, 0.2, 0.1, 0.75, 1 } )
        end
    },
    [TrinketType.SOMETHINGWICKED_POWER_INVERTER] = {
        desc = "{{Battery}} Batteries give a {{Damage}} +0.9 Damage up for the current floor, instead of active item charge",
        metadataFunction = function (item)
            EID:addGoldenTrinketMetadata(item, nil, {0.9})
        end
    },
    [TrinketType.SOMETHINGWICKED_SUGAR_COATED_PILL] = {
        desc = "{{Pill}} Using a pill will turn all pills of that type into Full Health pills for the rest of the run#This trinket is consumed on pill use",
    },
    [TrinketType.SOMETHINGWICKED_PRINT_OF_INDULGENCE] = {
        desc = "{{EternalHeart}} Chance to spawn an Eternal Heart upon taking damage",
        metadataFunction = function (item)
            EID:addGoldenTrinketMetadata(item, {"Chance increased!"})
        end
    },
    [TrinketType.SOMETHINGWICKED_GODLY_TOMATO] = {
        desc = "{{Collectible331}} Chance to give a fired tear a Godhead aura",
        metadataFunction = function (item)
            EID:addGoldenTrinketMetadata(item, {"↑ Chance doubled!", "↑ Chance tripled!"} )
        end,
    },
    [TrinketType.SOMETHINGWICKED_POPPET] = {
        desc = "{{Collectible462}} Chance to give a fired tear the effects of Eye of Belial",
        metadataFunction = function (item)
            EID:addGoldenTrinketMetadata(item, {"↑ Chance doubled!", "↑ Chance tripled!"} )
        end,
    },
    [TrinketType.SOMETHINGWICKED_HALLOWEEN_CANDY] = {
        desc = "you wanna know wh",
        Hide = true
    },
    [TrinketType.SOMETHINGWICKED_CELLPHONE_BATTERY] = {
        desc = "{{Battery}} 25% chance to gain an extra item charge on clearing a room#!!! All batteries are turned into bombs",
    }
}

for key, value in pairs(trinkets) do
    if value.desc then
        if EID then
            EID:addTrinket(key, value.desc)

            if value.metadataFunction then
                value.metadataFunction(key)
            end
        end

        if Encyclopedia and Encyclopedia.EIDtoWiki then
            local tab = genericWikiTable(key, value.desc)
            tab.Hide = value.Hide or false
            Encyclopedia.AddTrinket(tab)
        end
    end
end

if EID then
    --abyss
    EID.descriptions["en_us"].abyssSynergies[CollectibleType.SOMETHINGWICKED_CURSED_MUSHROOM] = "Purple cursing locust"

    --bov
    EID.descriptions["en_us"].bookOfVirtuesWisps[CollectibleType.SOMETHINGWICKED_CURSED_MUSHROOM] = "Curses nearby enemies on destruction"
    EID.descriptions["en_us"].bookOfVirtuesWisps[CollectibleType.SOMETHINGWICKED_TRINKET_SMASHER] = "Spawns two wisps on destroyed trinket, spawns bonus wisps if the trinket was worth more (eg. Golden Trinkets)"
    EID.descriptions["en_us"].bookOfVirtuesWisps[CollectibleType.SOMETHINGWICKED_FETUS_IN_FETU] = "Do nothing by themselves, will destroy self and spawn a blue spider if the item is used again"
    EID.descriptions["en_us"].bookOfVirtuesWisps[CollectibleType.SOMETHINGWICKED_GOLDEN_CARD] = "Does another random card effect on death"
    EID.descriptions["en_us"].bookOfVirtuesWisps[CollectibleType.SOMETHINGWICKED_BOLINE] = "Double HP wisps that spawn weaker maw of the void rings on damage"
    EID.descriptions["en_us"].bookOfVirtuesWisps[CollectibleType.SOMETHINGWICKED_ENCYCLOPEDIA] = "Spawns 4 wisps that dissapear if there is not a library on the floor, cannot have more than 4 wisps at once"
end