local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

dM = Tunnel.getInterface("nav_arsenal-v2")
-------------------------------------------------------------------------------------------------
--- LOCAIS DO ARSENAL ---
-------------------------------------------------------------------------------------------------
local prodMachine = {
	{ ['x'] = -2051.7, ['y'] = -454.86, ['z'] = 16.43 },
	{ ['x'] = 825.87, ['y'] = 164.54, ['z'] = 86.39 },
	{ ['x'] = 1513.61, ['y'] = 788.97, ['z'] = 78.44 }
}
-------------------------------------------------------------------------------------------------
--- PAINEL DE MENU ---
-------------------------------------------------------------------------------------------------
local menuactive = false
local onmenu = false

function ToggleActionMenu()
	menuactive = not menuactive
	if menuactive then
		SetNuiFocus(true,true)
		TransitionToBlurred(1000)
		SendNUIMessage({ showmenu = true })
	else
		SetNuiFocus(false)
		TransitionFromBlurred(1000)
		SendNUIMessage({ hidemenu = true })
	end
end
-------------------------------------------------------------------------------------------------
--- BOTÕES  ---
-------------------------------------------------------------------------------------------------
RegisterNUICallback("ButtonClick",function(data,cb)
	     ------------------- AÇÕES -------------------
	if data == "arsenal-a-limpar" then
		TriggerServerEvent("arsenal-policia","a-limpar")

	elseif data == "arsenal-a-rua" then
		TriggerServerEvent("arsenal-policia","a-rua")

	elseif data == "arsenal-a-deparatamento" then
		TriggerServerEvent("arsenal-policia","a-deparatamento")

	elseif data == "arsenal-a-ammunation" then
		TriggerServerEvent("arsenal-policia","a-ammunation")
	
	elseif data == "arsenal-a-joalheria" then
		TriggerServerEvent("arsenal-policia","a-joalheria")

	elseif data == "arsenal-a-banco" then
		TriggerServerEvent("arsenal-policia","a-banco")

		------------------- ARMAS  DA POLICIA -------------------

	elseif data == "arsenal-a-taser" then
		TriggerServerEvent("arsenal-policia","a-taser")

	elseif data == "arsenal-a-colete" then
		TriggerServerEvent("arsenal-policia","a-colete")

	elseif data == "arsenal-a-cassetete" then
		TriggerServerEvent("arsenal-policia","a-cassetete")

	elseif data == "arsenal-a-lanterna" then
		TriggerServerEvent("arsenal-policia","a-lanterna")

	elseif data == "arsenal-a-m4a1" then
		TriggerServerEvent("arsenal-policia","a-m4a1")

	elseif data == "arsenal-a-mp5" then
		TriggerServerEvent("arsenal-policia","a-mp5")

	elseif data == "arsenal-a-sigsauer" then
		TriggerServerEvent("arsenal-policia","a-sigsauer")

	elseif data == "arsenal-a-glock" then
		TriggerServerEvent("arsenal-policia","a-glock")

	elseif data == "arsenal-a-radio" then
		TriggerServerEvent("arsenal-policia","a-radio")

	elseif data == "arsenal-a-paraquedas" then
		TriggerServerEvent("arsenal-policia","a-paraquedas")

	elseif data == "fechar" then
		ToggleActionMenu()
		onmenu = false
	end
end)

RegisterNetEvent("fechar-nui-arsenal-policia")
AddEventHandler("fechar-nui-arsenal-policia", function()
	ToggleActionMenu()
	onmenu = false
end)
-------------------------------------------------------------------------------------------------
--- AÇÃO ---
-------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local dmshop = 1000

		for k,v in pairs(prodMachine) do
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(v.x,v.y,v.z)
			local distance = GetDistanceBetweenCoords(v.x,v.y,cdz,x,y,z,true)
			local prodMachine = prodMachine[k]

			if distance <= 2 then
				dmshop = 5
				DrawMarker(3, prodMachine.x, prodMachine.y, prodMachine.z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,255,0,31,50,0,0,0,1)
				if distance <= 1.2 then
					dmshop = 5
					if IsControlJustPressed(0,38) and dM.checkPermissao() then
						ToggleActionMenu()
						onmenu = true
					end
				end
			end
		end
		Citizen.Wait(dmshop)
	end
end)
-------------------------------------------------------------------------------------------------
--- FUNÇÃO ---
-------------------------------------------------------------------------------------------------
function DrawText3D(x, y, z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.28, 0.28)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.005+ factor, 0.03, 41, 11, 41, 68)
end