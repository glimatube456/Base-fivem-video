local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
dM = {}
Tunnel.bindInterface("nav_arsenal-v2",dM)
-----------------------------------------------------------------------------------------------------------------------------------
--- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------
local webhookarsenal = ""

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------
--- ARMAMENTOS ---
-----------------------------------------------------------------------------------------------------------------------------------
local municoes = {
      -- AÇÕES ---
    { item = "a-limpar" },
	{ item = "a-rua" },
	{ item = "a-departamento" },
    { item = "a-ammunation" },
    { item = "a-joalheria" },
    { item = "a-banco" },

     -- ARMAS DA POLICIA ---
    { item = "a-radio" },
    { item = "a-taser" },
    { item = "a-colete" },
    { item = "a-cassetete" },
    { item = "a-lanterna" },
    { item = "a-paraquedas" },
    { item = "a-m4a1" },
    { item = "a-mp5" },
    { item = "a-sigsauer" },
    { item = "a-glock" }
}
-----------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES DE ENVIO ---
-----------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("arsenal-policia")
AddEventHandler("arsenal-policia",function(item)
	local source = source
    local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
	if user_id then
			for k,v in pairs(municoes) do
				if item == v.item then
						 ----------------------------------------- AÇÕES --------------------------------------------------
					if item == "a-limpar" then

						TriggerClientEvent("fechar-nui-arsenal-policia",source)
						vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
						TriggerClientEvent("progress",source,10000,"RETIRANDO ARMAS")
						SetTimeout(10000,function()
							vRPclient._stopAnim(source,false)
							vRPclient.giveWeapons(source,{},true)
							vRPclient.setArmour(source,0)
							TriggerClientEvent("Notify",source,"sucesso","ARSENAL","Você limpou o <b>Inventario</b> equipado.")
						end)
						SendWebhookMessage(webhookarsenal,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.."  \n[=======ARSENAL POLICIA=======] \n[AÇÃO]: LIMPOU O SEU INVENTARIO EQUIPADO "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")

					elseif item == "a-rua" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("colete") then
		
							TriggerClientEvent("fechar-nui-arsenal-policia",source)
							vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
							TriggerClientEvent("progress",source,10000,"PEGANDO ARMAMENTO")
							SetTimeout(10000,function()
								vRPclient._stopAnim(source,false)
								vRPclient.giveWeapons(source,{["WEAPON_COMBATPISTOL"] = { ammo = 250 }})
								vRPclient.giveWeapons(source,{["WEAPON_NIGHTSTICK"] = { ammo = 0 }})
								vRPclient.giveWeapons(source,{["WEAPON_STUNGUN"] = { ammo = 0 }})
								vRPclient.setArmour(source,100)
								--vRP.giveInventoryItem(user_id,"colete",1)
								--vRP.giveInventoryItem(user_id,"radio",1)
								TriggerClientEvent("Notify",source,"sucesso","ARSENAL","Armamento retirado com <b>Sucesso</b>.")
							end)
							SendWebhookMessage(webhookarsenal,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.."  \n[=======ARSENAL POLICIA=======] \n[RETIRADO]: \n[ITEM]: Glock \n[ITEM]: 250x Mun. de Glock \n[ITEM]: Tazer \n[ITEM]: Colete \n[ITEM]: Radio \n[ITEM]: Cassetete "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		
						else
							TriggerClientEvent("Notify",source,"negado","ARSENAL","Espaço insuficiente na mochila.")
						end
					elseif item == "a-departamento" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("colete") then --<= vRP.getInventoryMaxWeight(user_id)

							TriggerClientEvent("fechar-nui-arsenal-policia",source)
							vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
							TriggerClientEvent("progress",source,10000,"RETIRANDO ARMAMENTO")
							SetTimeout(10000,function()
								vRPclient._stopAnim(source,false)
								vRPclient.giveWeapons(source,{["WEAPON_COMBATPISTOL"] = { ammo = 250 }})
								vRPclient.giveWeapons(source,{["WEAPON_NIGHTSTICK"] = { ammo = 0 }})
								vRPclient.giveWeapons(source,{["WEAPON_STUNGUN"] = { ammo = 0 }})
								vRPclient.setArmour(source,100)
								--vRP.giveInventoryItem(user_id,"colete",1)
								--vRP.giveInventoryItem(user_id,"radio",1)
								TriggerClientEvent("Notify",source,"sucesso","ARSENAL","Armamento retirado com <b>Sucesso</b>.")
							end)
							SendWebhookMessage(webhookarsenal,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.."  \n[=======ARSENAL POLICIA=======] \n[RETIRADO]: \n[ITEM]: Glock \n[ITEM]: 250x Mun. de Glock \n[ITEM]: Tazer \n[ITEM]: Colete \n[ITEM]: Radio \n[ITEM]: Cassetete "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")

						else
							TriggerClientEvent("Notify",source,"negado","ARSENAL","Espaço insuficiente na mochila.")
						end
					elseif item == "a-ammunation" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("colete") then

							TriggerClientEvent("fechar-nui-arsenal-policia",source)
							vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
							TriggerClientEvent("progress",source,10000,"RETIRANDO ARMAMENTO")
							SetTimeout(10000,function()
								vRPclient._stopAnim(source,false)
								vRPclient.giveWeapons(source,{["WEAPON_COMBATPISTOL"] = { ammo = 250 }})
								vRPclient.giveWeapons(source,{["WEAPON_NIGHTSTICK"] = { ammo = 0 }})
								vRPclient.giveWeapons(source,{["WEAPON_STUNGUN"] = { ammo = 0 }})
								vRPclient.setArmour(source,100)
								--vRP.giveInventoryItem(user_id,"colete",1)
								--vRP.giveInventoryItem(user_id,"radio",1)
								TriggerClientEvent("Notify",source,"sucesso","ARSENAL","Armamento retirado com <b>Sucesso</b>.")
							end)
							SendWebhookMessage(webhookarsenal,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.."  \n[=======ARSENAL POLICIA=======] \n[RETIRADO]: \n[ITEM]: Glock \n[ITEM]: 250x Mun. de Glock \n[ITEM]: Tazer \n[ITEM]: Colete \n[ITEM]: Radio \n[ITEM]: Cassetete "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")

						else
							TriggerClientEvent("Notify",source,"negado","ARSENAL","Espaço insuficiente na mochila.")
						end
					elseif item == "a-joalheria" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("colete") then

							TriggerClientEvent("fechar-nui-arsenal-policia",source)
							vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
							TriggerClientEvent("progress",source,10000,"RETIRANDO ARMAMENTO")
							SetTimeout(10000,function()
								vRPclient._stopAnim(source,false)
								vRPclient.giveWeapons(source,{["WEAPON_CARBINERIFLE"] = { ammo = 250 }}) 
								vRPclient.giveWeapons(source,{["WEAPON_COMBATPISTOL"] = { ammo = 250 }})
								vRPclient.giveWeapons(source,{["WEAPON_NIGHTSTICK"] = { ammo = 0 }})
								vRPclient.giveWeapons(source,{["WEAPON_STUNGUN"] = { ammo = 0 }})
								vRPclient.setArmour(source,100)
								--vRP.giveInventoryItem(user_id,"colete",1)
								--vRP.giveInventoryItem(user_id,"radio",1)
								TriggerClientEvent("Notify",source,"sucesso","ARSENAL","Armamento retirado com <b>Sucesso</b>.")
							end)
							SendWebhookMessage(webhookarsenal,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.."  \n[=======ARSENAL POLICIA=======] \n[RETIRADO]: \n[ITEM]: Glock \n[ITEM]: 250x Mun. de Glock \n[ITEM]: M4a1 \n[ITEM]: 250x Mun. de M4a1 \n[ITEM]: Tazer \n[ITEM]: Colete \n[ITEM]: Radio \n[ITEM]: Cassetete "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
						else
							TriggerClientEvent("Notify",source,"negado","ARSENAL","Espaço insuficiente na mochila.")
						end
					elseif item == "a-banco" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("colete") then

							TriggerClientEvent("fechar-nui-arsenal-policia",source)
							vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
							TriggerClientEvent("progress",source,10000,"RETIRANDO ARMAMENTO")
							SetTimeout(10000,function()
								vRPclient._stopAnim(source,false)
								vRPclient.giveWeapons(source,{["WEAPON_CARBINERIFLE"] = { ammo = 250 }}) 
								vRPclient.giveWeapons(source,{["WEAPON_COMBATPISTOL"] = { ammo = 250 }})
								vRPclient.giveWeapons(source,{["WEAPON_NIGHTSTICK"] = { ammo = 0 }})
								vRPclient.giveWeapons(source,{["WEAPON_STUNGUN"] = { ammo = 0 }})
								vRPclient.setArmour(source,100)
								--vRP.giveInventoryItem(user_id,"colete",1)
								--vRP.giveInventoryItem(user_id,"radio",1)
								TriggerClientEvent("Notify",source,"sucesso","ARSENAL","Armamento retirado com <b>Sucesso</b>.")
							end)
							SendWebhookMessage(webhookarsenal,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.."  \n[=======ARSENAL POLICIA=======] \n[RETIRADO]: \n[ITEM]: Glock \n[ITEM]: 250x Mun. de Glock \n[ITEM]: M4a1 \n[ITEM]: 250x Mun. de M4a1 \n[ITEM]: Tazer \n[ITEM]: Colete \n[ITEM]: Radio \n[ITEM]: Cassetete "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")

						else
							TriggerClientEvent("Notify",source,"negado","ARSENAL","Espaço insuficiente na mochila.")
						end

							----------------------------------------- ARMAS DA POLICIA --------------------------------------------------
					elseif item == "a-taser" then

							TriggerClientEvent("fechar-nui-arsenal-policia",source)
							vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
							TriggerClientEvent("progress",source,10000,"RETIRANDO ARMAMENTO")
							SetTimeout(10000,function()
								vRPclient._stopAnim(source,false)
								vRPclient.giveWeapons(source,{["WEAPON_STUNGUN"] = { ammo = 0 }})
								TriggerClientEvent("Notify",source,"sucesso","ARSENAL","Armamento retirado com <b>Sucesso</b>.")
							end)
							SendWebhookMessage(webhookarsenal,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.."  \n[=======ARSENAL POLICIA=======] \n[RETIROU]: Tazer  "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")

					elseif item == "a-cassetete" then

							TriggerClientEvent("fechar-nui-arsenal-policia",source)
							vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
							TriggerClientEvent("progress",source,10000,"RETIRANDO ARMAMENTO")
							SetTimeout(10000,function()
								vRPclient._stopAnim(source,false)
								vRPclient.giveWeapons(source,{["WEAPON_NIGHTSTICK"] = { ammo = 0 }})
								TriggerClientEvent("Notify",source,"sucesso","ARSENAL","Armamento retirado com <b>Sucesso</b>.")
							end)
							SendWebhookMessage(webhookarsenal,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.."  \n[=======ARSENAL POLICIA=======] \n[RETIROU]: Cassetete  "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")

					elseif item == "a-lanterna" then

							TriggerClientEvent("fechar-nui-arsenal-policia",source)
							vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
							TriggerClientEvent("progress",source,10000,"RETIRANDO ARMAMENTO")
							SetTimeout(10000,function()
								vRPclient._stopAnim(source,false)
								vRPclient.giveWeapons(source,{["WEAPON_FLASHLIGHT"] = { ammo = 0 }})
								TriggerClientEvent("Notify",source,"sucesso","ARSENAL","Armamento retirado com <b>Sucesso</b>.")
							end)
							SendWebhookMessage(webhookarsenal,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.."  \n[=======ARSENAL POLICIA=======] \n[RETIROU]: Lanterna "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")

					elseif item == "a-colete" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("colete") then

							TriggerClientEvent("fechar-nui-arsenal-policia",source)
							vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
							TriggerClientEvent("progress",source,10000,"RETIRANDO ARMAMENTO")
							SetTimeout(10000,function()
								vRPclient._stopAnim(source,false)
								vRPclient.setArmour(source,100)
								--vRP.giveInventoryItem(user_id,"colete",1)
								TriggerClientEvent("Notify",source,"sucesso","ARSENAL","Armamento retirado com <b>Sucesso</b>.")
							end)
							SendWebhookMessage(webhookarsenal,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.."  \n[=======ARSENAL POLICIA=======] \n[RETIROU]: Colete "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")

						else
							TriggerClientEvent("Notify",source,"negado","ARSENAL","Espaço insuficiente na mochila.")
						end
					elseif item == "a-m4a1" then

							TriggerClientEvent("fechar-nui-arsenal-policia",source)
							vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
							TriggerClientEvent("progress",source,10000,"RETIRANDO ARMAMENTO")
							SetTimeout(10000,function()
								vRPclient._stopAnim(source,false)
								vRPclient.giveWeapons(source,{["WEAPON_CARBINERIFLE"] = { ammo = 250 }}) 
								TriggerClientEvent("Notify",source,"sucesso","ARSENAL","Armamento retirado com <b>Sucesso</b>.")
							end)
							SendWebhookMessage(webhookarsenal,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.."  \n[=======ARSENAL POLICIA=======] \n[RETIROU]: M4A1 \n[RETIROU]: 250x Mun. M4a1  "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")

					elseif item == "a-glock" then

							TriggerClientEvent("fechar-nui-arsenal-policia",source)
							vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
							TriggerClientEvent("progress",source,10000,"RETIRANDO ARMAMENTO")
							SetTimeout(10000,function()
								vRPclient._stopAnim(source,false)
								vRPclient.giveWeapons(source,{["WEAPON_COMBATPISTOL"] = { ammo = 250 }}) 
								TriggerClientEvent("Notify",source,"sucesso","ARSENAL","Armamento retirado com <b>Sucesso</b>.")
							end)
							SendWebhookMessage(webhookarsenal,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.."  \n[=======ARSENAL POLICIA=======] \n[RETIROU]: GLOCK  \n[RETIROU]: 250x Mun. GLOCK"..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")

					elseif item == "a-sigsauer" then

							TriggerClientEvent("fechar-nui-arsenal-policia",source)
							vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
							TriggerClientEvent("progress",source,10000,"RETIRANDO ARMAMENTO")
							SetTimeout(10000,function()
								vRPclient._stopAnim(source,false)
								vRPclient.giveWeapons(source,{["WEAPON_COMBATPDW"] = { ammo = 250 }}) 
								TriggerClientEvent("Notify",source,"sucesso","ARSENAL","Armamento retirado com <b>Sucesso</b>.")
							end)
							SendWebhookMessage(webhookarsenal,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.."  \n[=======ARSENAL POLICIA=======] \n[RETIROU]: SIGSAUER \n[RETIROU]: 250x Mun. SIGSAUER "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")

					elseif item == "a-mp5" then

							TriggerClientEvent("fechar-nui-arsenal-policia",source)
							vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
							TriggerClientEvent("progress",source,10000,"RETIRANDO ARMAMENTO")
							SetTimeout(10000,function()
								vRPclient._stopAnim(source,false)
								vRPclient.giveWeapons(source,{["WEAPON_SMG"] = { ammo = 250 }}) 
								TriggerClientEvent("Notify",source,"sucesso","ARSENAL","Armamento retirado com <b>Sucesso</b>.")
							end)
							SendWebhookMessage(webhookarsenal,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.."  \n[=======ARSENAL POLICIA=======] \n[RETIROU]: Mp5  "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")

					elseif item == "a-paraquedas" then

							TriggerClientEvent("fechar-nui-arsenal-policia",source)
							vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
							TriggerClientEvent("progress",source,10000,"RETIRANDO ARMAMENTO")
							SetTimeout(10000,function()
								vRPclient._stopAnim(source,false)
								vRPclient.giveWeapons(source,{["gadget_parachute"] = { ammo = 250 }})
								TriggerClientEvent("Notify",source,"sucesso","ARSENAL","Armamento retirado com <b>Sucesso</b>.")
							end)
							SendWebhookMessage(webhookarsenal,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.."  \n[=======ARSENAL POLICIA=======] \n[RETIROU]: Paraquedas  "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")

					elseif item == "a-radio" then
						if vRP.getInventoryWeight(user_id)+vRP.getItemWeight("radio") then

							TriggerClientEvent("fechar-nui-arsenal-policia",source)
							vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
							TriggerClientEvent("progress",source,10000,"RETIRANDO ARMAMENTO")
							SetTimeout(10000,function()
								vRPclient._stopAnim(source,false)
								vRP.giveInventoryItem(user_id,"radio",1)
								TriggerClientEvent("Notify",source,"sucesso","ARSENAL","Armamento retirado com <b>Sucesso</b>.")
							end)
							SendWebhookMessage(webhookarsenal,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.."  \n[=======ARSENAL POLICIA=======] \n[RETIROU]: Radio "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")

						else
							TriggerClientEvent("Notify",source,"negado","ARSENAL","Espaço insuficiente na mochila.")
						end
					end
				end
			end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------
--- FUNÇÃO DE PERMISSÃO ---
-----------------------------------------------------------------------------------------------------------------------------------
function dM.checkPermissao()
    local source = source
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"policia.permissao") then
        return true
    end
end