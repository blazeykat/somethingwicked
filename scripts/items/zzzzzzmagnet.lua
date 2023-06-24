local this = {}

SomethingWicked:AddCallback(ModCallbacks.MC_PRE_SPAWN_CLEAN_AWARD, function ()
    SomethingWicked:UtilScheduleForUpdate(this.CheckForDealDoors, 0, ModCallbacks.MC_POST_UPDATE)
end)

function this:CheckForDealDoors()
    
    if not SomethingWicked.ItemHelpers:GlobalPlayerHasTrinket(TrinketType.SOMETHINGWICKED_ZZZZZZ_MAGNET) then
        return
    end
    local room = SomethingWicked.game:GetRoom()

    for i = 0, DoorSlot.NUM_DOOR_SLOTS - 1, 1 do
        local door = room:GetDoor(i)
        if door
        and door.TargetRoomIndex == GridRooms.ROOM_DEVIL_IDX then
            this:ConvertDoor(door)
        end
    end
end

function this:ConvertDoor(door)
    door.TargetRoomIndex = GridRooms.ROOM_ERROR_IDX
    local sprite = door:GetSprite()
    for ii = 1, 4 do
        sprite:ReplaceSpritesheet(ii, "gfx/grid/soymundswildride.png")
    end
    sprite:LoadGraphics()
end

SomethingWicked:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, function ()
    this:CheckForDealDoors()
end)

this.EIDEntries = {
    [TrinketType.SOMETHINGWICKED_ZZZZZZ_MAGNET] = {
        desc = "!!! Turns all doors to Devil Rooms and Angel Rooms into doors into",
        isTrinket = true,
    }
}
return this