Button = {
    open = false
}

function Button:Export(a,b,c,d)
    if open then return end
    self.open = true
    SendNUIMessage({
        action = "open",
        label = a,
        finish = b,
        event = c,
        time = d
    })
    SetNuiFocus(true, true)
end

RegisterCommand('button', function()
    Button:Export('TEST LABEL',"TEST FINISH",'bbv-test:button',6000)
end)

RegisterNUICallback('exit', function(data, cb)
    SetNuiFocus(false, false)
    Button.open = false
end)

RegisterNUICallback('event', function(data, cb)
    TriggerEvent(data.event)
end)

RegisterNetEvent('bbv-test:button',function()
    TriggerEvent('QBCore:Notify', 'Event : bbv-test:button : triggered', 'success', 6000)
end)

exports('button', function(a,b,c,d)
    Button:Export(a,b,c,d)
end)
  