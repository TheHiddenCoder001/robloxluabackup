local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour

print("[DEBUG] Current PlaceID:", PlaceID)
print("[DEBUG] Current Hour (UTC):", actualHour)

local File = pcall(function()
    print("[DEBUG] Trying to read NotSameServers.json")
    AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
end)

if not File then
    print("[DEBUG] File not found or failed to load, creating new one.")
    table.insert(AllIDs, actualHour)
    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
else
    print("[DEBUG] Successfully loaded existing NotSameServers.json")
end

function TPReturner()
    local Site;

    if foundAnything == "" then
        print("[DEBUG] Requesting first server page.")
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
    else
        print("[DEBUG] Requesting next server page. Cursor:", foundAnything)
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
    end

    if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
        print("[DEBUG] Found nextPageCursor:", Site.nextPageCursor)
        foundAnything = Site.nextPageCursor
    else
        print("[DEBUG] No nextPageCursor, reached end of pages.")
    end

    local num = 0
    for i, v in pairs(Site.data) do
        local Possible = true
        local ID = tostring(v.id)

        print("[DEBUG] Checking server ID:", ID, "Players:", v.playing, "/", v.maxPlayers)

        if tonumber(v.maxPlayers) > tonumber(v.playing) then
            print("[DEBUG] Server has space.")
            for _, Existing in pairs(AllIDs) do
                if num ~= 0 then
                    if ID == tostring(Existing) then
                        print("[DEBUG] Server ID already used, skipping.")
                        Possible = false
                    end
                else
                    if tonumber(actualHour) ~= tonumber(Existing) then
                        print("[DEBUG] New hour detected, resetting server list.")
                        pcall(function()
                            delfile("NotSameServers.json")
                            AllIDs = {}
                            table.insert(AllIDs, actualHour)
                        end)
                    end
                end
                num = num + 1
            end

            if Possible == true then
                print("[DEBUG] Found a new server to teleport to:", ID)
                table.insert(AllIDs, ID)
                pcall(function()
                    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                    print("[DEBUG] Updated NotSameServers.json with new server ID.")
                end)

                print("[DEBUG] Waiting  before teleporting.")
                wait(25) -- Insert your own seconds here

                pcall(function()
                    print("[DEBUG] Teleporting to server ID:", ID)
                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                end)
                print("[DEBUG] Waiting 4 seconds after teleport attempt.")
                wait(4)
            end
        else
            print("[DEBUG] Server full, skipping.")
        end
    end
end

function Teleport()
    while wait() do
        pcall(function()
            print("[DEBUG] Starting TPReturner() call.")
            TPReturner()
            if foundAnything ~= "" then
                print("[DEBUG] foundAnything not empty, calling TPReturner() again.")
                TPReturner()
            end
        end)
    end
end

-- If you want to run a script before hopping, do it above this line.

print("[DEBUG] Starting Teleport loop.")
Teleport()
