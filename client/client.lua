local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX = nil
local Licenses                = {}

Citizen.CreateThread(function()
    while ESX == nil do
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	Citizen.Wait(0)
    end
end)

RegisterNetEvent('venix:loadLicenses')
AddEventHandler('venix:loadLicenses', function (licenses)
  for i = 1, #licenses, 1 do
    Licenses[licenses[i].type] = true
  end
end)


_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("","Vendeur d'armes", nil, nil, "shopui_title_gunclub", "shopui_title_gunclub")
_menuPool:Add(mainMenu)

function AddAmmuMenu(menu)

    local lsmenu = _menuPool:AddSubMenu(menu, "Licence d\'armes", nil, nil, "shopui_title_gunclub", "shopui_title_gunclub")


    local gunsmenu = _menuPool:AddSubMenu(menu, "Armes", nil, nil, "shopui_title_gunclub", "shopui_title_gunclub")

    

    local ls = NativeUI.CreateItem("Licence d\'armes", "Acheter la Licence d\'armes pour ~g~25000$")
    lsmenu.SubMenu:AddItem(ls)
    ls:RightLabel(" →")

    lsmenu.SubMenu.OnItemSelect = function(menu, item)
        if item == ls then
            TriggerServerEvent('venix:buyLicense')
            Citizen.Wait(1)
        end
    end   
    
    local bat = NativeUI.CreateItem("Batte", "Acheter une Batte pour ~g~800$")
    gunsmenu.SubMenu:AddItem(bat)
    bat:RightLabel(" →")

    local pied = NativeUI.CreateItem("Pied de Biche", "Acheter un Pied de Biche pour ~g~550$")
    gunsmenu.SubMenu:AddItem(pied)
    pied:RightLabel(" →")

    local ham = NativeUI.CreateItem("Marteau", "Acheter un Marteau pour ~g~800$")
    gunsmenu.SubMenu:AddItem(ham)
    ham:RightLabel(" →")

    local knif = NativeUI.CreateItem("Couteau", "Acheter un Couteau pour ~g~650$")
    gunsmenu.SubMenu:AddItem(knif)
    knif:RightLabel(" →")

    local poingam = NativeUI.CreateItem("Poing Américain", "Acheter un Poing Américain pour ~g~250$")
    gunsmenu.SubMenu:AddItem(poingam)
    poingam:RightLabel(" →")

    local sns = NativeUI.CreateItem("Pistolet SNS", "Acheter un Pistolet SNS pour ~g~15000$")
    gunsmenu.SubMenu:AddItem(sns)
    sns:RightLabel(" →")

    local clip = NativeUI.CreateItem("Chargeur", "Acheter un Chargeur pour ~g~150$")
    gunsmenu.SubMenu:AddItem(clip)
    clip:RightLabel(" →")


    gunsmenu.SubMenu.OnItemSelect = function(menu, item)
        if item == bat then
            TriggerServerEvent('buyBTT')
            Citizen.Wait(1)

        elseif item == pied then
            TriggerServerEvent('buyPied')
            Citizen.Wait(1)

        elseif item == ham then
            TriggerServerEvent('buyHam')
            Citizen.Wait(1)

        elseif item == knif then
            TriggerServerEvent('buyKnife')
            Citizen.Wait(1)


        elseif item == poingam then
            TriggerServerEvent('buyPoinga')
            Citizen.Wait(1)

        elseif item == sns then
            TriggerServerEvent('buySns')
            Citizen.Wait(1)
    
    

        elseif item == clip then
            TriggerServerEvent('buyClip')
            Citizen.Wait(1)            
        end
    end
end    

AddAmmuMenu(mainMenu)
_menuPool:RefreshIndex()


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
        _menuPool:MouseEdgeEnabled (false);

        local playerCoords = GetEntityCoords(PlayerPedId())

        for k, v in pairs(Config.Shops_Config.Positions) do
            local distance = GetDistanceBetweenCoords(playerCoords, v.x, v.y, v.z, true)

            if distance < 10.0 then
                actualZone = v

                zoneDistance = GetDistanceBetweenCoords(playerCoords, actualZone.x, actualZone.y, actualZone.z, true)

                DrawMarker(Config.MarkerType, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, nil, nil, false)
            end
            
            if distance <= 1.5 then
                ESX.ShowHelpNotification('Appuyez sur ~INPUT_TALK~ pour parlez avec le ~r~Vendeur d\'Armes')

                if IsControlJustPressed(1, 51) then
                    mainMenu:Visible(not mainMenu:Visible())
                end
            end

            if zoneDistance ~= nil then
                if zoneDistance > 1.5 then
                    _menuPool:CloseAllMenus()
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    for k, v in pairs(Config.Shops_Config.Positions) do
        local blip = AddBlipForCoord(v.x, v.y, v.z)

        SetBlipSprite(blip, 110)
        SetBlipScale (blip, 0.8)
        SetBlipColour(blip, 4)
        SetBlipAsShortRange(blip, true)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Vendeur d'armes")
        EndTextCommandSetBlipName(blip)
    end
end)





