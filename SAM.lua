-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff.Hasso = buffactive.Hasso or false
    state.Buff.Seigan = buffactive.Seigan or false
    state.Buff.Sekkanoki = buffactive.Sekkanoki or false
    state.Buff.Sengikori = buffactive.Sengikori or false
    state.Buff['Meikyo Shisui'] = buffactive['Meikyo Shisui'] or false
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.
function user_setup()
    state.OffenseMode:options('LowACC', 'MidACC', 'HighACC')
    state.WeaponskillMode:options('LowACC', 'MidACC', 'HighACC', 'MAX')
    state.PhysicalDefenseMode:options('PDT', 'MDT')

    update_combat_form()
    
    -- Additional local binds
    send_command('bind ^` input /ja "Hasso" <me>')
    send_command('bind !` input /ja "Seigan" <me>')

    select_default_macro_book()
end


-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind ^`')
    send_command('unbind !-')
end


-- Define sets and vars used by this job file.
function init_gear_sets()

    --------------------------------------
    -- Augments
    --------------------------------------
	Smertrios = {}
	Smertrios.WS = {}
    Smertrios.WS = {name="Smertrios's mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%'}}
	Smertrios.DA = {name="Smertrios's mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%'}}
	Smertrios.STP = {name="Smertrios's mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%'}}
	
    
	ValHead = {}
	ValHead.WS = {}
	ValHead.WS = {name="Valorous mask", augments={'Attack+25','Weapon skill damage +4%','STR+9','Accuracy+14'}}
	
	ValHands = {}
	ValHands.WS = {}
	ValHands.WS = {name="Valorous mitts", augments={'Weapon skill damage +5%','STR+4','Accuracy+14','Attack+8'}}
	
	ValFeet = {}	
	ValFeet.WS = {}
	ValFeet.WS = {name="Valorous greaves", augments={'Accuracy+13 Attack+13','Weapon skill damage +5%','DEX+9','Accuracy+9'}}
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
    -- Precast Sets
    -- Precast sets to enhance JAs
	
    sets.precast.JA['Meditate'] = {head="Wakido Kabuto +2",hands="Sakonji Kote +1",back=Smertrios.WS}
	
	sets.precast.JA['Warding Circle'] = {head="Wakido Kabuto +2"}
	
    sets.precast.JA['Blade Bash'] = {hands="Sakonji Kote +1"}
       
    -- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {}
    sets.precast.WS.LowACC = set_combine(sets.precast.WS, {})
	sets.precast.WS.MidACC = set_combine(sets.precast.WS, {})
	sets.precast.WS.MAX = set_combine(sets.precast.WS, {})
																	
						
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

	sets.precast.WS['Tachi: Fudo'] = {
    ammo="Knobkierrie",
    head=ValHead.WS,
    body="Sakonji Domaru +3",
    hands=ValHands.WS,
    legs="Wakido Haidate +3",
    feet=ValFeet.WS,
    neck="Sam. Nodowa +2",
    waist="Sailfi Belt +1",
    ear1="Thrud Earring",
    ear2="Moonshade Earring",
    ring1="Epaminondas's Ring",
    ring2="Niqmaddu Ring",
    back=Smertrios.WS}

    sets.precast.WS['Tachi: Fudo'].LowACC = set_combine(sets.precast.WS, {
    ammo="Knobkierrie",
    head=ValHead.WS,
    body="Sakonji Domaru +3",
    hands=ValHands.WS,
    legs="Wakido Haidate +3",
    feet=ValFeet.WS,
    neck="Sam. Nodowa +2",
    waist="Sailfi Belt +1",
    ear1="Thrud Earring",
    ear2="Moonshade Earring",
    ring1="Epaminondas's Ring",
    ring2="Niqmaddu Ring",
    back=Smertrios.WS})
	
    sets.precast.WS['Tachi: Fudo'].MidACC = set_combine(sets.precast.WS, {head=ValHead.WS,
									          neck="Fotia Gorget",
									          ear1="Thrud Earring",
									          ear2="Moonshade Earring",
									          body="Rao Togi +1",
									          hands=ValHead.WS,
									          ring2="Ifrit Ring +1",
									          ring1="Ifrit Ring +1",
									          back=Smertrios.gkWS,
									          waist="Prosilio Belt +1",
									          legs="Hiza. Hizayoroi +1",
									          feet="Ryuo Sune-Ate +1"})
																	
    sets.precast.WS['Tachi: Fudo'].HighACC = set_combine(sets.precast.WS, {head=ValHead.WS,
									           neck="Fotia Gorget",
									           ear1="Thrud Earring",
									           ear2="Moonshade Earring",
									           body="Ryuo Domaru +1",
									           hands=ValHands.WS,
									           ring2="Ifrit Ring +1",
									           ring1="Ifrit Ring +1",
									           back=Smertrios.gkWS,
									           waist="Grunfeld Rope",
									           legs="Hiza. Hizayoroi +1",
									           feet=ValFeet.WS})
																	
    sets.precast.WS['Tachi: Fudo'].MAX = set_combine(sets.precast.WS, {head="Ryuo Somen +1",
													 neck="Fotia Gorget",
													 ear1="Telos Earring",
													 ear2="Moonshade Earring",
													 body="Ryuo Domaru +1",
													 hands="Ryuo Tekko +1",
													 ring2="Ifrit Ring +1",
													 ring1="Ifrit Ring +1",
													 back=Smertrios.gkWS,
													 waist="Grunfeld Rope",
													 legs="Hiza. Hizayoroi +1",
													 feet="Rao Sune-Ate +1"})

	sets.precast.WS['Tachi: Shoha'] = {
    ammo="Knobkierrie",
    head=ValHead.WS,
    body="Sakonji Domaru +3",
    hands=ValHands.WS,
    legs="Wakido Haidate +3",
    feet=ValFeet.WS,
    neck="Sam. Nodowa +2",
    waist="Fotia Belt",
    ear1="Thrud Earring",
    ear2="Moonshade Earring",
    ring1="Epaminondas's Ring",
    ring2="Niqmaddu Ring",
    back=Smertrios.WS}
													 
													 
    sets.precast.WS['Tachi: Shoha'].LowACC = set_combine(sets.precast.WS, {
    ammo="Knobkierrie",
    head=ValHead.WS,
    body="Sakonji Domaru +3",
    hands=ValHands.WS,
    legs="Wakido Haidate +3",
    feet=ValFeet.WS,
    neck="Sam. Nodowa +2",
    waist="Fotia Belt",
    ear1="Thrud Earring",
    ear2="Moonshade Earring",
    ring1="Epaminondas's Ring",
    ring2="Niqmaddu Ring",
    back=Smertrios.WS})
	
    sets.precast.WS['Tachi: Shoha'].MidACC = set_combine(sets.precast.WS, {head=ValHead.WS,
									           neck="Fotia Gorget",
									           ear1="Brutal Earring",
									           ear2="Moonshade Earring",
									           body="Rao Togi +1",
									           hands=ValHands.WS,
									           ring2="Ramuh Ring +1",
									           ring1="Ifrit Ring +1",
									           back=Smertrios.gkWS,
									           waist="Grunfeld Rope",
									           legs="Hiza. Hizayoroi +1",
									           feet="Ryuo Sune-Ate +1"})
																	
    sets.precast.WS['Tachi: Shoha'].HighACC = set_combine(sets.precast.WS, {head=ValHead.WS,
									            neck="Fotia Gorget",
									            ear1="Brutal Earring",
									            ear2="Moonshade Earring",
									            body="Rao Togi +1",
									            hands="Ryuo Tekko +1",
									            ring2="Ramuh Ring +1",
									            ring1="Ifrit Ring +1",
									            back=Smertrios.gkWS,
									            waist="Grunfeld Rope",
									            legs="Hiza. Hizayoroi +1",
									            feet="Rao Sune-Ate +1"})
																	
    sets.precast.WS['Tachi: Shoha'].MAX = set_combine(sets.precast.WS, {head="Ryuo Somen +1",
													  neck="Fotia Gorget",
													  ear1="Telos Earring",
													  ear2="Moonshade Earring",
													  body="Ryuo Domaru +1",
													  hands="Ryuo Tekko +1",
													  ring2="Ramuh Ring +1",
													  ring1="Ifrit Ring +1",
													  back=Smertrios.gkWS,
													  waist="Grunfeld Rope",
													  legs="Hiza. Hizayoroi +1",
													  feet="Rao Sune-Ate +1"})

	sets.precast.WS['Tachi: Rana'] = {head=ValHead.WS,
											  neck="Fotia Gorget",
											  ear1="Thrud Earring",
											  ear2="Moonshade Earring",
											  body="Nzingha Cuirass",
											  hands=ValHands.WS,
											  ring2="Ifrit Ring +1",
											  ring1="Ifrit Ring +1",
											  back=Smertrios.gkWS,
											  waist="Prosilio Belt +1",
											  legs="Rao Haidate +1",
											  feet="Ryuo Sune-Ate +1"}
													  
													  
    sets.precast.WS['Tachi: Rana'].LowACC = set_combine(sets.precast.WS, {head=ValHead.WS,
											  neck="Fotia Gorget",
											  ear1="Brutal Earring",
											  ear2="Telos Earring",
									          body="Rao Togi +1",
									          hands="Rao Kote +1",
									          ring2="Ifrit Ring +1",
									          ring1="Ifrit Ring +1",
									          back=Smertrios.gkWS,
									          waist="Fotia Belt",
									          legs="Rao Haidate +1",
									          feet="Ryuo Sune-Ate +1"})
																	
    sets.precast.WS['Tachi: Rana'].MidACC = set_combine(sets.precast.WS, {head=ValHead.WS,
									          neck="Fotia Gorget",
									          ear1="Brutal Earring",
									          ear2="Telos Earring",
									          body="Rao Togi +1",
									          hands="Ryuo Tekko +1",
									          ring2="Ifrit Ring +1",
									          ring1="Ifrit Ring +1",
									          back=Smertrios.gkWS,
									          waist="Fotia Belt",
									          legs="Hiza. Hizayoroi +1",
									          feet="Ryuo Sune-Ate +1"})
	
	sets.precast.WS['Tachi: Rana'].HighACC = set_combine(sets.precast.WS, {head="Ryuo Somen +1",
									           neck="Fotia Gorget",
									           ear1="Moonshade Earring",
									           ear2="Telos Earring",
									           body="Ryuo Domaru +1",
									           hands="Ryuo Tekko +1",
									           ring2="Ifrit Ring +1",
									           ring1="Ifrit Ring +1",
									           back=Smertrios.gkWS,
									           waist="Fotia Belt",
									           legs="Hiza. Hizayoroi +1",
									           feet="Ryuo Sune-Ate +1"})
																	
    sets.precast.WS['Tachi: Rana'].MAX = set_combine(sets.precast.WS, {head="Ryuo Somen +1",
													 neck="Fotia Gorget",
													 ear2="Telos Earring",
													 ear1="Moonshade Earring",
													 body="Ryuo Domaru +1",
													 hands="Ryuo Tekko +1",
													 ring2="Ramuh Ring +1",
													 ring1="Ifrit Ring +1",
													 back=Smertrios.gkWS,
													 waist="Fotia Belt",
													 legs="Hiza. Hizayoroi +1",
													 feet="Rao Sune-Ate +1"})

	sets.precast.WS['Tachi: Kaiten'] = {head=ValHead.WS,
											  neck="Fotia Gorget",
											  ear1="Thrud Earring",
											  ear2="Moonshade Earring",
											  body="Nzingha Cuirass",
											  hands=ValHands.WS,
											  ring2="Ifrit Ring +1",
											  ring1="Ifrit Ring +1",
											  back=Smertrios.gkWS,
											  waist="Prosilio Belt +1",
											  legs="Rao Haidate +1",
											  feet="Ryuo Sune-Ate +1"}
													 
													 
    sets.precast.WS['Tachi: Kaiten'].LowACC = set_combine(sets.precast.WS, {head=ValHead.WS,
												neck="Fotia Gorget",
												ear1="Thrud Earring",
												ear2="Moonshade Earring",
												body="Nzingha Cuirass",
												hands=ValHands.WS,
												ring2="Ifrit Ring +1",
												ring1="Ifrit Ring +1",
												back=Smertrios.gkWS,
												waist="Prosilio Belt +1",
												legs="Rao Haidate +1",
												feet="Ryuo Sune-Ate +1"})
																	
    sets.precast.WS['Tachi: Kaiten'].MidACC = set_combine(sets.precast.WS, {head=ValHead.WS,
									            neck="Fotia Gorget",
									            ear1="Thrud Earring",
									            ear2="Moonshade Earring",
									            body="Rao Togi +1",
									            hands=ValHands.WS,
									            ring2="Ifrit Ring +1",
									            ring1="Ifrit Ring +1",
									            back=Smertrios.gkWS,
									            waist="Prosilio Belt +1",
									            legs="Hiza. Hizayoroi +1",
									            feet="Ryuo Sune-Ate +1"})
																	
    sets.precast.WS['Tachi: Kaiten'].HighACC = set_combine(sets.precast.WS, {head=ValHead.WS,
									             neck="Fotia Gorget",
									             ear1="Thrud Earring",
									             ear2="Moonshade Earring",
									             body="Ryuo Domaru +1",
									             hands=ValHands.WS,
									             ring2="Ifrit Ring +1",
												 ring1="Ifrit Ring +1",
												 back=Smertrios.gkWS,
												 waist="Grunfeld Rope",
												 legs="Hiza. Hizayoroi +1",
												 feet=ValFeet.WS})
																	
    sets.precast.WS['Tachi: Kaiten'].MAX = set_combine(sets.precast.WS, {head="Ryuo Somen +1",
												   	   neck="Fotia Gorget",
													   ear1="Telos Earring",
													   ear2="Moonshade Earring",
													   body="Ryuo Domaru +1",
													   hands="Ryuo Tekko +1",
													   ring2="Ifrit Ring +1",
													   ring1="Ifrit Ring +1",
													   back=Smertrios.gkWS,
													   waist="Grunfeld Rope",
													   legs="Hiza. Hizayoroi +1",
													   feet="Rao Sune-Ate +1"})

	sets.precast.WS['Namas Arrow'] = {head=ValHead.WS,
											  neck="Fotia Gorget",
											  ear1="Thrud Earring",
											  ear2="Moonshade Earring",
											  body="",
											  hands=ValHands.WS,
											  ring2="Ifrit Ring +1",
											  ring1="Ifrit Ring +1",
											  back=Smertrios.gkWS,
											  waist="Fotia Belt",
											  legs="Hiza. Hizayoroi +1",
											  feet=ValFeet.WS}
													   
													   
	sets.precast.WS['Namas Arrow'].LowACC = set_combine(sets.precast.WS, {head=ValHead.WS,
										      neck="Fotia Gorget",
											  ear1="Thrud Earring",
											  ear2="Telos Earring",
											  body="",
											  hands=ValHands.WS,
											  ring2="Ifrit Ring +1",
											  ring1="Ifrit Ring +1",
											  back=Smertrios.bowWS,
											  waist="Fotia Belt",
											  legs="Hiza. Hizayoroi +1",
											  feet=ValFeet.WS})
																	
    sets.precast.WS['Namas Arrow'].MidACC = set_combine(sets.precast.WS, {head="Acro Helm",
									          neck="Fotia Gorget",
									          ear1="Thrud Earring",
									          ear2="Telos Earring",
									          body="",
									          hands="Kobo Kote",
									          ring2="Ifrit Ring +1",
									          ring1="Ifrit Ring +1",
									          back=Smertrios.bowWS,
									          waist="Fotia Belt",
									          legs="Hiza. Hizayoroi +1",
									          feet="Acro Leggings"})
																	
    sets.precast.WS['Namas Arrow'].HighACC = set_combine(sets.precast.WS, {head="Acro Helm",
									           neck="Fotia Gorget",
									           ear1="Thrud Earring",
									           ear2="Telos Earring",
									           body="Kyujutsugi",
									           hands="Kobo Kote",
									           ring2="Garuda Ring +1",
									           ring1="Garuda Ring +1",
									           back=Smertrios.bowWS,
									           waist="Fotia Belt",
									           legs="Acro Breeches",
											   feet="Acro Leggings"})
    
	sets.precast.WS['Impulse Drive'] = { 
    ammo="Knobkierrie",
    head=ValHead.WS,
    body="Sakonji Domaru +3",
    hands=ValHands.WS,
    legs="Wakido Haidate +3",
    feet=ValFeet.WS,
    neck="Sam. Nodowa +2",
    waist="Fotia Belt",
    ear1="Thrud Earring",
    ear2="Moonshade Earring",
    ring1="Epaminondas's Ring",
    ring2="Niqmaddu Ring",
    back=Smertrios.WS}
	
	sets.precast.WS['Impulse Drive'].LowACC = { 
    ammo="Knobkierrie",
    head=ValHead.WS,
    body="Sakonji Domaru +3",
    hands="Ryuo Tekko +1",
    legs="Wakido Haidate +3",
    feet=ValFeet.WS,
    neck="Sam. Nodowa +2",
    waist="Sailfi Belt +1",
    ear1="Thrud Earring",
    ear2="Moonshade Earring",
    ring1="Epaminondas's Ring",
    ring2="Niqmaddu Ring",
    back=Smertrios.WS}
	
	
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {neck="Wiglen Gorget",ring1="Sheltered Ring",ring2="Paguroidea Ring"}
    

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle.Town = {ammo="Staunch Tathlum +1",
        head="Rao Kabuto +1",neck="Bathy Choker +1",ear1="Dawn Earring",ear2="Infused Earring",
        body="Hiza. Haramaki +2",hands="Sakonji Kote +1",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Xucau Mantle",waist="Flume Belt +1",legs="Rao Haidate +1",feet="Danzo Sune-ate"}
    
    sets.idle.Field = {
        head="Rao Kabuto +1",neck="Bathy Choker +1",ear1="Dawn Earring",ear2="Infused Earring",
        body="Hiza. Haramaki +2",hands="Sakonji Kote +1",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Xucau Mantle",waist="Flume Belt +1",legs="Rao Haidate +1",feet="Danzo Sune-ate"}

    sets.idle.Weak = {
        head="Rao Kabuto +1",neck="Bathy Choker +1",ear1="Dawn Earring",ear2="Infused Earring",
        body="Hiza. Haramaki +1",hands="Sakonji Kote +1",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Xucau Mantle",waist="Flume Belt +1",legs="Rao Haidate +1",feet="Rao Sune-ate +1"}
    
    -- Defense sets
    sets.defense.PDT = {ammo="Staunch Tathlum +1",
    head="Kendatsuba Jinpachi +1",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Genmei Earring",
    body="Wakido Domaru +3",hands="Wakido Kote +3",ring2="Defending Ring",ring1="Ilabrat Ring",
    back=Smertrios.STP,waist="Flume Belt +1",legs="Kendatsuba Hakama +1",feet="Kendatsuba Sune-Ate +1"}
	
    sets.defense.MDT = {ammo="Staunch Tathlum +1",
    head="Kendatsuba Jinpachi +1",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Genmei Earring",
    body="Wakido Domaru +3",hands="Wakido Kote +3",ring2="Defending Ring",ring1="Ilabrat Ring",
    back=Smertrios.STP,waist="Flume Belt +1",legs="Kendatsuba Hakama +1",feet="Kendatsuba Sune-Ate +1"}
	
    sets.Kiting = {feet="Danzo Sune-ate"}

    sets.Reraise = {head="Twilight Helm",body="Twilight Mail"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    -- Delay 450 GK, 25 Save TP => 65 Store TP for a 5-hit (25 Store TP in gear)
    sets.engaged = {}
	
	sets.engaged.LowACC = {     
	ammo="Aurgelmir Orb +1",
    head="Flam. Zucchetto +2",
    body="Kasuga Domaru +1",
    hands="Wakido Kote +3",
    legs="Ryuo Hakama +1",
    feet="Ryuo Sune-Ate +1",
    neck="Sam. Nodowa +2",
    waist="Sailfi Belt +1",
    left_ear="Brutal Earring",
    right_ear="Balder Earring +1",
    left_ring="Flamma Ring",
    right_ring="Niqmaddu Ring",
    back=Smertrios.DA}

    sets.engaged.MidACC = { 
	ammo="Aurgelmir Orb +1",
    head="Flam. Zucchetto +2",
    body="Dagon Breastplate",
    hands="Wakido Kote +3",
    legs="Kendatsuba Hakama +1",
    feet="Ryuo Sune-Ate +1",
    neck="Sam. Nodowa +2",
    waist="Sailfi Belt +1",
    left_ear="Brutal Earring",
    right_ear="Balder Earring +1",
    left_ring="Flamma Ring",
    right_ring="Niqmaddu Ring",
    back=Smertrios.DA}
	
	sets.engaged.HighACC = {   
	ammo="Aurgelmir Orb +1",
    head="Flam. Zucchetto +2",
    body="Dagon Breastplate",
    hands="Wakido Kote +3",
    legs="Kendatsuba Hakama +1",
    feet="Flam. Gambieras +2",
    neck="Sam. Nodowa +2",
    waist="Ioskeha Belt +1",
    left_ear="Brutal Earring",
    right_ear="Balder Earring +1",
    left_ring="Flamma Ring",
    right_ring="Niqmaddu Ring",
    back=Smertrios.DA}

    sets.buff.Sekkanoki = {hands="Kasuga Kote +1"}
    sets.buff.Sengikori = {feet="Kasuga Sune-ate +1"}
    sets.buff['Meikyo Shisui'] = {feet="Sakonji Sune-ate +1"}
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic target handling to be done.
function job_pretarget(spell, action, spellMap, eventArgs)
    if spell.type == 'WeaponSkill' then
        -- Change any GK weaponskills to polearm weaponskill if we're using a polearm.
        if player.equipment.main=='Quint Spear' or player.equipment.main=='Quint Spear' then
            if spell.english:startswith("Tachi:") then
                send_command('@input /ws "Penta Thrust" '..spell.target.raw)
                eventArgs.cancel = true
            end
        end
    end
end

-- Run after the default precast() is done.
-- eventArgs is the same one used in job_precast, in case information needs to be persisted.
function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.type:lower() == 'weaponskill' then
        if state.Buff.Sekkanoki then
            equip(sets.buff.Sekkanoki)
        end
        if state.Buff.Sengikori then
            equip(sets.buff.Sengikori)
        end
        if state.Buff['Meikyo Shisui'] then
            equip(sets.buff['Meikyo Shisui'])
        end
    end
end


-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    -- Effectively lock these items in place.
    if state.HybridMode.value == 'Reraise' or
        (state.DefenseMode.value == 'Physical' and state.PhysicalDefenseMode.value == 'Reraise') then
        equip(sets.Reraise)
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
    update_combat_form()
end

-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)

end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function update_combat_form()
    if areas.Adoulin:contains(world.area) and buffactive.ionis then
        state.CombatForm:set('Adoulin')
    else
        state.CombatForm:reset()
    end
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(1, 1)
    elseif player.sub_job == 'DNC' then
        set_macro_page(1, 1)
    elseif player.sub_job == 'THF' then
        set_macro_page(1, 1)
    elseif player.sub_job == 'NIN' then
        set_macro_page(1, 1)
    else
        set_macro_page(1, 11)
    end
end

