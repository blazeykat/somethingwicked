local this = {}

SomethingWicked:AddCustomCBack(SomethingWicked.CustomCallbacks.SWCB_PICKUP_ITEM, this.TeratomaChunkPickup, mod.ITEMS.TERATOMA_CHUNK)

this.EIDEntries = {
    [mod.ITEMS.TERATOMA_CHUNK] = {
        desc = "↑ +1 empty heart container# Spawns 8-13 teratoma orbitals on use#Teratoma orbitals will die upon taking any damage, projectiles will pierce through them, but they will spawn spiders on room clear",
        encycloDesc = SomethingWicked:UtilGenerateWikiDesc({"+1 empty heart container","Spawns 8-13 teratoma orbitals on use","Teratoma orbitals will die upon taking any damage, projectiles will pierce through them, but they will spawn spiders on room clear"}),
        pools = {
            SomethingWicked.encyclopediaLootPools.POOL_TREASURE,
            SomethingWicked.encyclopediaLootPools.POOL_KEY_MASTER,
            SomethingWicked.encyclopediaLootPools.POOL_GREED_BOSS
        }
    }
}
return this