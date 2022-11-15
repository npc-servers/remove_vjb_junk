hook.Add( "InitPostEntity", "RemoveVJBaseJank", function()
    hook.Remove( "PlayerInitialSpawn", "VJBaseSpawn" )
    net.Receivers["VJSay"] = nil

    for name in pairs( net.Receivers ) do
        if string.StartWith( name, "vj_" ) then
            net.Receivers[name] = nil
        end
    end
end )
