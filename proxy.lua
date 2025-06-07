local surg = false

function bubble(str)
SendVariantList({  [0] = "OnTalkBubble", [1] = GetLocal().netid, [2] = str })
end

function proxy(type, packet)

if packet:find("action|input\n|text|/proxy") then
LogToConsole("`6/proxy")
pcall(dofile(MakeRequest("https://raw.githubusercontent.com/Lawvy/pandora/refs/heads/main/help.lua").content))
return true
end

if packet:find("action|input\n|text|/surg") and not surg then
LogToConsole("`6/surg")
surg = true
LogToConsole("`5Auto Surg `2ON`5,`@ Wrench Surg-E Or Player")
return true
end
if packet:find("action|input\n|text|/surg") and surg then
LogToConsole("`6/surg")
surg = false
LogToConsole("`5Auto Surg `4OFF`5")
return true
end

    if packet:find("action|input\n|text|/pvend (.+)") then
        LogToConsole("`6/pvend")
        local item = packet:match("/pvend (.+)")
        item = tostring(item)
        item = string.upper(item)

        local xMax = GetWorld().width -1
        local yMax = GetWorld().height -7


        -- Periksa apakah item valid
        local itemInfo = GetItemInfo(item)
        if not itemInfo then
            LogToConsole("`4Error`9, Write Item Name Correctly")
            return true
        end

        local itemID = itemInfo.id

        -- Reset harga termurah setiap kali command baru
        local termurah = math.huge
        local termurahx = nil
        local termurahy = nil

        -- Buat coroutine untuk penelusuran harga termurah
        coroutine.wrap(function()
            for x = 0, xMax do
                for y = 0, yMax do
                    local tile = GetTile(x, y)

                    if tile.fg == 9268 and tile.extra.lastupdate == itemID then
                        local harga = tile.extra.owner
                        if harga < termurah and harga ~= 0 then
                            termurah = harga
                            termurahx = tile.x
                            termurahy = tile.y
                        end
                    end
                end
            end
            
            -- Panggil FindPath dalam coroutine
            if termurahx and termurahy then
                FindPath(termurahx, termurahy, 0)
                LogToConsole("`9Item Founded In (" .. termurahx .. ", " .. termurahy .. "), Price: " .. termurah)
            else
                LogToConsole("`9Item Not Found.")
            end
        end)()

        return true
    end

if packet:find("action|input\n|text|/balance") then
LogToConsole("`6/balance")
for _, v in pairs(GetInventory()) do
ireng = 11550
blue = 7188
dl = 1796
wl = 242
if v.id == ireng or v.id == blue or v.id == dl or v.id == wl then
LogToConsole("`9" .. GetItemInfo(v.id).name .. " Balance: `#" .. tostring(v.amount))
end
end
return true
end
if packet:find("action|input\n|text|/bal") then
LogToConsole("`6/bal")
for _, v in pairs(GetInventory()) do
ireng = 11550
blue = 7188
dl = 1796
wl = 242
if v.id == ireng or v.id == blue or v.id == dl or v.id == wl then
LogToConsole("`9" .. GetItemInfo(v.id).name .. " Balance: `#" .. tostring(v.amount))
end
end
return true
end


if packet:find("action|friends") then
pcall(dofile(MakeRequest("https://raw.githubusercontent.com/Lawvy/pandora/refs/heads/main/menu.lua").content))
return true
end






end



function var(var)
if var[0] == "OnConsoleMessage" then
LogToConsole("`5[`#PANDORA`5] ``````"..var[1])

if var[1]:find("World Locked") then

for _, v in pairs(GetInventory()) do
ireng = 11550
blue = 7188
dl = 1796
wl = 242
if v.id == ireng or v.id == blue or v.id == dl or v.id == wl then
LogToConsole("`9" .. GetItemInfo(v.id).name .. " Balance: `#" .. tostring(v.amount))
end
end

end

return true
end






end

AddHook("onsendpacket", "command", proxy)
AddHook("onvariant", "variant", var)









function findItem(id)
    for _, itm in pairs(GetInventory()) do
        if itm.id == id then
            return itm.amount
        end    
    end
    return 0
end

AddHook("onvariant", "surgery", function(var)
    if surg then
if var[0]:find("OnDialogRequest") and var[1]:find("Status: `4Awake(.+)")then
    if findItem(1262) > 0 then
SendPacket(2,[[
action|dialog_return
dialog_name|surgery
buttonClicked|command_2
]])
        LogToConsole("`5[`#PANDORA`5] `^Anesthetic")
    else
        LogToConsole("`4You don't have enough `^Anesthetic")
    end
return true
elseif var[0]:find("OnDialogRequest") and var[1]:find("end_dialog|surge_edit")then
SendPacket(2,[[
action|dialog_return
dialog_name|surge_edit
x|]]..var[1]:match("embed_data|x|(%d+)")..[[|
y|]]..var[1]:match("embed_data|y|(%d+)")..[[|
]])
LogToConsole("`5[`#PANDORA`5] `wAuto `4Surgery `^Starting")
return true
elseif var[0]:find("OnDialogRequest") and var[1]:find("end_dialog|popup")then
SendPacket(2,[[
action|dialog_return
dialog_name|popup
netID|]]..var[1]:match("embed_data|netID|(%d+)")..[[|
buttonClicked|surgery
]])
LogToConsole("`5[`#PANDORA`5] `wAuto `4Surgery `^Starting")
return true
elseif var[0]:find("OnDialogRequest") and var[1]:find("`4You can't see what you are doing!(.+)")then
if findItem(1258) > 0 then
SendPacket(2,[[
action|dialog_return
dialog_name|surgery
buttonClicked|command_0
]])
LogToConsole("`5[`#PANDORA`5] `9Sponge")
    else
        LogToConsole("`4You don't have enough `9Sponge")
    end
return true
elseif var[0]:find("OnDialogRequest") and var[1]:find("Patient's fever is `3slowly rising.")then
if findItem(1266) > 0 then
SendPacket(2,[[
action|dialog_return
dialog_name|surgery
buttonClicked|command_4
]])
LogToConsole("`5[`#PANDORA`5] `#Antibiotics")
    else
        LogToConsole("`4You don't have enough `#Antibiotics")
    end
return true
elseif var[0]:find("OnDialogRequest") and var[1]:find("Patient's fever is `6climbing.")then
if findItem(1266) > 0 then
SendPacket(2,[[
action|dialog_return
dialog_name|surgery
buttonClicked|command_4
]])
LogToConsole("`5[`#PANDORA`5] `#Antibiotics")
    else
        LogToConsole("`4You don't have enough `#Antibiotics")
    end
return true
elseif var[0]:find("OnDialogRequest") and var[1]:find("Patient's fever is `4climbing rapidly!.")then
if findItem(1266) > 0 then
SendPacket(2,[[
action|dialog_return
dialog_name|surgery
buttonClicked|command_4
]])
LogToConsole("`5[`#PANDORA`5] `#Antibiotics")
    else
        LogToConsole("`4You don't have enough `#Antibiotics")
    end
return true
elseif var[0]:find("OnDialogRequest") and var[1]:find("Operation site: `3Not sanitized")then
if findItem(1264) > 0 then
SendPacket(2,[[
action|dialog_return
dialog_name|surgery
buttonClicked|command_3
]])
LogToConsole("`5[`#PANDORA`5] `rAntiseptic")
    else
        LogToConsole("`4You don't have enough `rAntiseptic")
    end
return true
elseif var[0]:find("OnDialogRequest") and var[1]:find("Operation site: `6Unclean")then
if findItem(1264) > 0 then
SendPacket(2,[[
action|dialog_return
dialog_name|surgery
buttonClicked|command_3
]])
LogToConsole("`5[`#PANDORA`5] `rAntiseptic")
    else
        LogToConsole("`4You don't have enough `rAntiseptic")
    end
return true
elseif var[0]:find("OnDialogRequest") and var[1]:find("Operation site: `4Unsanitary")then
if findItem(1264) > 0 then
SendPacket(2,[[
action|dialog_return
dialog_name|surgery
buttonClicked|command_3
]])
LogToConsole("`5[`#PANDORA`5] `rAntiseptic")
    else
        LogToConsole("`4You don't have enough `rAntiseptic")
    end
return true
elseif var[0]:find("OnDialogRequest") and var[1]:find("`6It is becoming hard to see your work.")then
if findItem(1258) > 1 then
SendPacket(2,[[
action|dialog_return
dialog_name|surgery
buttonClicked|command_0
]])
LogToConsole("`5[`#PANDORA`5] `9Sponge")
    else
        LogToConsole("`4You don't have enough `9Sponge")
    end
return true
elseif var[0]:find("OnDialogRequest") and var[1]:find("Patient is losing blood `4very quickly!")then
if findItem(1270) > 1 then
SendPacket(2,[[
action|dialog_return
dialog_name|surgery
buttonClicked|command_6
]])
LogToConsole("`5[`#PANDORA`5] `8Stitches")
    else
        LogToConsole("`4You don't have enough `8Stitches")
    end
return true
elseif var[0]:find("OnDialogRequest") and var[1]:find("Patient is `6losing blood!")then
if findItem(1270) > 0 then
SendPacket(2,[[
action|dialog_return
dialog_name|surgery
buttonClicked|command_6
]])
LogToConsole("`5[`#PANDORA`5] `8Stitches")
    else
        LogToConsole("`4You don't have enough `8Stitches")
    end
return true
elseif var[0]:find("OnDialogRequest") and var[1]:find("Patient is losing blood `3slowly")then
if findItem(1270) > 1 then
SendPacket(2,[[
action|dialog_return
dialog_name|surgery
buttonClicked|command_6
]])
LogToConsole("`5[`#PANDORA`5] `8Stitches")
    else
        LogToConsole("`4You don't have enough `8Stitches")
    end
return true
elseif var[0]:find("OnDialogRequest") and var[1]:find("1296") and var[1]:find("Incisions: `30(.+)")  then
SendPacket(2,[[
action|dialog_return
dialog_name|surgery
buttonClicked|command_7
]])
LogToConsole("`5[`#PANDORA`5] `^Fix It!")
return true
elseif var[0]:find("OnDialogRequest") and var[1]:find("1296") and var[1]:find("Incisions: `31(.+)")  then
SendPacket(2,[[
action|dialog_return
dialog_name|surgery
buttonClicked|command_7
]])
LogToConsole("`5[`#PANDORA`5] `^Fix It!")
return true
elseif var[0]:find("OnDialogRequest") and var[1]:find("1296") and var[1]:find("Incisions: `32(.+)")  then
SendPacket(2,[[
action|dialog_return
dialog_name|surgery
buttonClicked|command_7
]])
LogToConsole("`5[`#PANDORA`5] `^Fix It!")
return true
elseif var[0]:find("OnDialogRequest") and var[1]:find("1296") and var[1]:find("Incisions: `33(.+)")  then
SendPacket(2,[[
action|dialog_return
dialog_name|surgery
buttonClicked|command_7
]])
LogToConsole("`5[`#PANDORA`5] `^Fix It!")
return true
elseif var[0]:find("OnDialogRequest") and var[1]:find("1296") and var[1]:find("Incisions: `44(.+)")  then
SendPacket(2,[[
action|dialog_return
dialog_name|surgery
buttonClicked|command_7
]])
LogToConsole("`5[`#PANDORA`5] `^Fix It!")
return true
elseif var[0]:find("OnDialogRequest") and var[1]:find("1296") and var[1]:find("Incisions: `45(.+)")  then
SendPacket(2,[[
action|dialog_return
dialog_name|surgery
buttonClicked|command_7
]])
LogToConsole("`5[`#PANDORA`5] `^Fix It!")
return true
elseif var[0]:find("OnDialogRequest") and var[1]:find("1260") then
if findItem(1262) > 0 then
SendPacket(2,[[
action|dialog_return
dialog_name|surgery
buttonClicked|command_1
]])
LogToConsole("`5[`#PANDORA`5] Scalpel")
    else
        LogToConsole("`4You don't have enough `wScalpel")
    end
return true
end
end
return false
end)




LogToConsole("`1P`2r`3o`4x`5y `6L`7a`8u`9n`0c`1h`2e`3d `0By `#AMOLE")
bubble("(nuke) `1P`2r`3o`4x`5y `6L`7a`8u`9n`0c`1h`2e`3d (fireworks)")
SendPacket(2, "action|input\n|text|`1P`2A`3N`4D`5O`6R`7A `1P`2R`3O`4X`5Y`0 By`# @lv3not7221")
