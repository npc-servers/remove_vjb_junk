-- Remove useless sweps
local swepsToRemove = {
    weapon_vj_357 = true,
    weapon_vj_9mmpistol = true,
    weapon_vj_ak47 = true,
    weapon_vj_ar2 = true,
    weapon_vj_blaster = true,
    weapon_vj_flaregun = true,
    weapon_vj_glock17 = true,
    weapon_vj_m16a1 = true,
    weapon_vj_mp40 = true,
    weapon_vj_rpg = true,
    weapon_vj_smg1 = true,
    weapon_vj_spas12 = true,
    weapon_vj_npccontroller = true,
}

hook.Add( "PreRegisterSWEP", "RemoveVJBJunk", function( _, class )
    if swepsToRemove[class] then
        return false
    end
end )

-- Removes clutter sents
local entsToRemove = {
    sent_vj_adminhealthkit = true,
    sent_vj_fireplace = true,
    prop_vj_flag = true,
    obj_vj_flareround = true,
    obj_vj_grenade = true,
    sent_vj_ply_spawnpoint = true,
    sent_vj_board = true,
}

hook.Add( "PreRegisterSENT", "RemoveVJBJunk", function( _, class )
    if entsToRemove[class] then
        return false
    end
end )

-- Thanks VJB for using lists too.
hook.Add( "InitPostEntity", "RemoveVJBJunkSwepsSents", function()
    local swepList = list.GetForEdit( "Weapon" )
    for class in pairs( swepList ) do
        if swepsToRemove[class] then
            swepList[class] = nil
        end
    end

    local entsList = list.GetForEdit( "SpawnableEntities" )
    for class in pairs( entsList ) do
        if entsToRemove[class] then
            entsList[class] = nil
        end
    end
    
    if CLIENT then
        RunConsoleCommand( "spawnmenu_reload" )
    end
end )
