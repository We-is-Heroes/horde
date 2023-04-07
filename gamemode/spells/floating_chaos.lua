SPELL.PrintName       = "Floating Chaos"
SPELL.Weapon          = {"horde_solar_seal"}
SPELL.Mind            = {35}
SPELL.Price           = 1500
SPELL.ChargeTime      = {0}
SPELL.ChargeRelease   = true
SPELL.Cooldown        = 5
SPELL.Slot            = HORDE.Spell_Slot_Reload
SPELL.DamageType      = nil
SPELL.Icon            = "spells/floating_chaos.png"
SPELL.Type            = {HORDE.Spell_Type_Utility}
SPELL.Description     = [[Conjures an energy portal that reflects your spells.]]
SPELL.Levels          = {Artificer=5}
SPELL.Fire            = function (ply, wpn, charge_stage)
    ply:EmitSound("horde/weapons/solar_seal/floating_chaos_launch.ogg")
    local tr = ply:GetEyeTrace()
    if not tr.Hit then return end
    local pos = tr.HitPos
    pos.z = pos.z + 100
    local ent = ents.Create("projectile_horde_floating_chaos")
    ent:SetOwner(ply)
    ent:SetPos( pos )
    ent:SetAngles( ply:EyeAngles() )
    local level = ply:Horde_GetSpellUpgrade("floating_chaos")
    ent.Horde_Spell_Level = level
    ent:Spawn()

    local phys = ent:GetPhysicsObject()
    if (!IsValid( phys )) then ent:Remove() return end
    local velocity = Vector(0,0,1)
    velocity = velocity * 15
    phys:ApplyForceCenter(velocity)
end
SPELL.Price                      = 1500
SPELL.Upgrades                   = 3
SPELL.Upgrade_Description        = "Increases number of spells echoed."
SPELL.Upgrade_Prices             = function (upgrade_level)
    return 800 + 100 * upgrade_level
end