VJF = true

hook.Add( "AddGamemodeToolMenuTabs", "RemoveVJBJunkTools", function()
    hook.Remove( "AddToolMenuTabs", "VJ_CREATETOOLTAB" )
    hook.Remove( "PopulateToolMenu", "VJ_ADDTOMENU_WEAPON" )
end )
