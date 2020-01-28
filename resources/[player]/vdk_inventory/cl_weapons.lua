--Transforme un item inventaire en une arme et l'équipe au joueur
RegisterNetEvent("weapon:equip")
AddEventHandler("weapon:equip", function(item)
  TriggerServerEvent('CheckMoneyForWea',item.weapon_model,0)
  GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(item.weapon_model), item.value, true)
  SetPedAmmo(GetPlayerPed(-1), GetHashKey(item.weapon_model), 200)
  TriggerEvent("player:looseItem", item.item_id, 1)
  Citizen.CreateThread(function()
    Wait(0)
    SetNotificationTextEntry("STRING")
    AddTextComponentString("~g~"..item.libelle.." ~s~équipé.")
    SetNotificationMessage("CHAR_MP_ROBERTO", "CHAR_MP_ROBERTO", true, 1, "Roberto", false)
    DrawNotification(false, true)
  end)
end)

--Notifie l'utilisateur que l'arme ne peut pas etre équipée une nouvelle fois
RegisterNetEvent("notify:hasWeaponAlready")
AddEventHandler("notify:hasWeaponAlready", function(weapon_name)
  Citizen.CreateThread(function()
    Wait(0)
    SetNotificationTextEntry("STRING")
    AddTextComponentString("~b~"..weapon_name.." ~s~est déjà équipé.")
    SetNotificationMessage("CHAR_MP_ROBERTO", "CHAR_MP_ROBERTO", true, 1, false, false)
    DrawNotification(false, true)
  end)
end)

--Notifie l'utilisateur que l'arme ne peut pas etre équipée une nouvelle fois
RegisterNetEvent("notify:unusableItem")
AddEventHandler("notify:unusableItem", function(item_name)
  Citizen.CreateThread(function()
    Wait(0)
    SetNotificationTextEntry("STRING")
    AddTextComponentString("L'objet ~r~"..item_name.." ~s~n'est pas utilisable.")
    SetNotificationMessage("CHAR_DEFAULT", "CHAR_DEFAULT", true, 1, false, false)
    DrawNotification(false, true)
  end)
end)