ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


function LoadLicenses (source)
    TriggerEvent('esx_license:getLicenses', source, function (licenses)
      TriggerClientEvent('venix:loadLicenses', source, licenses)
    end)
  end

if Config.EnableLicense == true then
  AddEventHandler('esx:playerLoaded', function (source)
    LoadLicenses(source)
  end)
end

RegisterServerEvent('venix:buyLicense')
AddEventHandler('venix:buyLicense', function ()
local _source = source
local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer.getMoney() >= 25000 then 
            xPlayer.removeMoney(25000)
            TriggerEvent('esx_license:addLicense', _source, 'weapon', function ()
                LoadLicenses(_source)
                TriggerClientEvent('esx:showNotification', _source, "Vous venez d\'acheter une ~g~Licence d\'arme~w~ pour ~g~25000$")
            end)
        else 
            TriggerClientEvent('esx:showNotification', _source, "Vous n\'avez pas assez ~g~d\'argent")
        end
    end)
        

 RegisterNetEvent('buyBTT')
    AddEventHandler('buyBTT', function()
        local _source = source
        local xPlayer = ESX.GetPlayerFromId(_source)

    
    
          if xPlayer.getMoney() >= 800 then 
                xPlayer.removeMoney(800)
                 xPlayer.addWeapon('WEAPON_BAT', 1)
            TriggerClientEvent('esx:showNotification', _source, "Vous venez d\'acheter une ~g~Batte~w~ pour ~g~800$")
        else 
     TriggerClientEvent('esx:showNotification', _source, "Vous n\'avez pas assez ~g~d\'argent")
 end
end)

RegisterNetEvent('buyPied')
AddEventHandler('buyPied', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)



      if xPlayer.getMoney() >= 550 then 
            xPlayer.removeMoney(550)
            xPlayer.addWeapon('WEAPON_CROWBAR', 1)
        TriggerClientEvent('esx:showNotification', _source, "Vous venez d\'acheter un ~g~Pied de Biche~w~ pour ~g~550$")
    else 
 TriggerClientEvent('esx:showNotification', _source, "Vous n\'avez pas assez ~g~d\'argent")
end
end)
RegisterNetEvent('buyHam')
AddEventHandler('buyHam', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)



      if xPlayer.getMoney() >= 800 then 
            xPlayer.removeMoney(800)
            xPlayer.addWeapon('WEAPON_HAMMER', 1)
        TriggerClientEvent('esx:showNotification', _source, "Vous venez d\'acheter un ~g~Marteau~w~ pour ~g~800$")
    else 
 TriggerClientEvent('esx:showNotification', _source, "Vous n\'avez pas assez ~g~d\'argent")
end
end)
RegisterNetEvent('buyKnife')
AddEventHandler('buyKnife', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)



      if xPlayer.getMoney() >= 650 then 
            xPlayer.removeMoney(650)
            xPlayer.addWeapon('WEAPON_HAMMER', 1)
        TriggerClientEvent('esx:showNotification', _source, "Vous venez d\'acheter un ~g~Couteau~w~ pour ~g~650$")
    else 
 TriggerClientEvent('esx:showNotification', _source, "Vous n\'avez pas assez ~g~d\'argent")
end
end)
RegisterNetEvent('buySns')
AddEventHandler('buySns', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)



      if xPlayer.getMoney() >= 15000 then 
            xPlayer.removeMoney(15000)
            xPlayer.addWeapon('WEAPON_SNSPISTOL', 1)
        TriggerClientEvent('esx:showNotification', _source, "Vous venez d\'acheter un ~g~Pistolet SNS~w~ pour ~g~15000$")
    else 
 TriggerClientEvent('esx:showNotification', _source, "Vous n\'avez pas assez ~g~d\'argent")
end
end)
RegisterNetEvent('buyClip')
AddEventHandler('buyClip', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)



      if xPlayer.getMoney() >= 150 then 
            xPlayer.removeMoney(150)
            xPlayer.addInventoryItem('clip', 1)
        TriggerClientEvent('esx:showNotification', _source, "Vous venez d\'acheter un ~g~Chargeur~w~ pour ~g~150$")
    else 
 TriggerClientEvent('esx:showNotification', _source, "Vous n\'avez pas assez ~g~d\'argent")
end
end)
RegisterNetEvent('buyPoinga')
AddEventHandler('buyPoinga', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)



      if xPlayer.getMoney() >= 250 then 
            xPlayer.removeMoney(250)
            xPlayer.addWeapon('WEAPON_KNUCKLE', 1)
        TriggerClientEvent('esx:showNotification', _source, "Vous venez d\'acheter un ~g~Poing Américain~w~ pour ~g~250$")
    else 
 TriggerClientEvent('esx:showNotification', _source, "Vous n\'avez pas assez ~g~d\'argent")
end
end)






