local this = {}
this.minvariant = 13000 this.maxvariant = 13001
this.roomType = RoomType.ROOM_SUPERSECRET

this.roomData = {}
this.hasInit = false
function this:Init()
    if this.hasInit then
        return
    end
    SomethingWicked.RedKeyRoomHelpers:InitializeRoomData("supersecret", this.minvariant, this.maxvariant, this.roomData) 
end

return this