--No Interrupt/Knockback
--include('how_about_no.lua')
--include('no_interruptions.lua')
--include('spam_protection.lua')

------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------
function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
end
 
function job_setup()
	state.Buff['Pianissimo'] = buffactive['pianissimo'] or false
end
 
-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------
function user_setup()
	state.IdleMode:options('Normal','SB')
	state.OffenseMode:options('Normal', 'Melee','SB', 'Acc')
    state.HybridMode:options('Normal','SB','DT')
	set_lockstyle()
    update_combat_form()
end
 
-- Called when this job file is unloaded (eg: job change)
function user_unload()
end
 
-- Define sets and vars used by this job file.
function init_gear_sets()
	-- Capes
	Intar = {}
	
	Intar.DEXWSD = {name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%'}}
	Intar.STRWSD = {name="Intarabus's Cape", augments={}}
	Intar.CHRWSD = {name="Intarabus's Cape", augments={'CHR+20','Accuracy+20 Attack+20','CHR+10','Weapon skill damage +10%'}}
	Intar.Idle = {name="Intarabus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%'}}
	Intar.STP = {name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%'}}
	Intar.DA = {name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%'}}
	Intar.MidCast = {name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','Enmity-10'}}
	
	Linos = {}
	
	Linos.TP = {name="Linos", augments={'Accuracy+15','"Store TP"+4','Quadruple Attack +3'}}
	Linos.WS = {name="Linos", augments={'Accuracy+15','"Store TP"+4','Quadruple Attack +3'}}
    
	-- Precast Sets
    
	sets.precast.JA.Nightingale = {feet="Bihu Slippers +3"}
	
    sets.precast.JA.Troubadour = {body="Bihu Justaucorps +3"}
	
    sets.precast.JA['Soul Voice'] = {legs="Bihu Cannions +3"}
	
	sets.precast.FC = {
	main="carnwenhan",
    sub="Taming Sari",
    range="Gjallarhorn",
    head="Volte Beret",
    body="Inyanga Jubbah +2",
    hands="Volte Gloves",
    legs="Volte Brais",
    feet="Volte Gaiters",
    neck="Voltsurge Torque",
    waist="Embla Sash",
    left_ear="Loquac. Earring",
    right_ear="Etiolation Earring",
    left_ring="Rahab Ring",
    right_ring="Kishar Ring",
    back=Intar.Idle}
		
	sets.precast.Utsusemi = sets.precast.FC
	
	sets.precast.FC.Cure = sets.precast.FC
	
	sets.precast.FC.Stoneskin = sets.precast.FC
	
	sets.precast.FC['Enhancing Magic'] = sets.precast.FC
	
	sets.precast.FC.BardSong = set_combine(sets.precast.FC,{head="Fili Calot +1"})
	
	sets.precast.FC["Honor March"] = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
	
	sets.precast.Lullaby = set_combine(sets.precast.FC.BardSong,{range="Daurdabla"})
	
	sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})
	
	-- Weaponskill Sets
	sets.precast.WS = {}
	
	sets.precast.WS['Rudra\'s Storm'] = {
	head="Lustratio Cap +1",
    body="Bihu Jstcorps. +3",
    hands="Lustr. Mittens +1",
    legs="Lustr. Subligar +1",
    feet="Lustra. Leggings +1",
    neck="Bard's Charm +2",
    waist="Grunfeld Rope",
    left_ear="Ishvara Earring",
    right_ear="Moonshade Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Ilabrat Ring",
	back=Intar.DEXWSD}
		
	sets.precast.WS['Evisceration'] = {
	head="Lustratio Cap +1",
    body="Lustr. Harness +1",
    hands="Lustr. Mittens +1",
    legs="Lustr. Subligar +1",
    feet="Lustra. Leggings +1",
    neck="Bard's Charm +2",
    waist="Grunfeld Rope",
    left_ear="Mache Earring +1",
    right_ear="Moonshade Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Ilabrat Ring",
	back=Intar.DEXWSD}
	
	sets.precast.WS['Mordant Rime'] = {
	head="Bihu Roundlet +3",
    body="Bihu Jstcorps. +3",
    hands="Bihu Cuffs +3",
    legs="Bihu Cannions +3",
    feet="Bihu Slippers +3",
    neck="Bard's Charm +2",
    waist="grunfeld rope",
    left_ear="Ishvara Earring",
    right_ear="Regal Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Metamor. Ring +1",
    back=Intar.CHRWSD}

	sets.precast.WS['Savage Blade'] = {
    head="Bihu Roundlet +3",
    body="Bihu Jstcorps. +3",
    hands="Bihu Cuffs +3",
    legs="Bihu Cannions +3",
    feet="Bihu Slippers +3",
    neck="Bard's Charm +2",
    waist="grunfeld rope",
    left_ear="Ishvara Earring",
    right_ear="Regal Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Metamor. Ring +1",
    back=Intar.STRWSD}
	
	sets.precast.WS['Aeolian Edge'] = {}

    -- Midcast Sets
	sets.midcast.FastRecast = set_combine(sets.precast.FC, {})
	
	sets.midcast.Ballad = {legs="Fili Rhingrave +1"}
	
	sets.midcast.Lullaby = {
	range="Daurdabla",	
	head="Bihu Roundlet +2",
	neck="Moonbow Whistle +1",
	left_ear="Dignitary's Earring",
	right_ear="Regal Earring",
	body="Brioso Justaucorps +2",
	hands="Brioso Cuffs +2",
	left_ring="metamor. ring +1",
	right_ring="stikini ring +1",
	back=Intar.MidCast,
	waist="Luminary Sash",
	legs="Brioso Cannions +3",
	feet="Brioso Slippers +3"}
		
	sets.midcast['Magic Finale'] = {
	range="Gjallarhorn",	
	head="Brioso Roundlet +2",
	neck="Moonbow Whistle +1",
	left_ear="Dignitary's Earring",
	right_ear="Regal Earring",
	body="Brioso Justaucorps +2",
	hands="Inyanga Dastanas +2",
	left_ring="metamor. ring +1",
	right_ring="stikini ring +1",
	back=Intar.MidCast,
	waist="Luminary Sash",
	legs="Brioso Cannions +3",
	feet="Brioso Slippers +3"}
		
	sets.midcast.Paeon = {
	range="Daurdabla",
	head="Brioso Roundlet +2",
	neck="Loricate Torque +1",
	left_ear="Genmei Earring",
	right_ear="Etiolation Earring",
	body="Inyanga Jubbah +2",
	hands="Inyan. Dastanas +2",
	left_ring="Gelatinous Ring +1",
	right_ring="Defending Ring",
	back="Moonlight Cape",
	waist="Flume Belt +1",
	legs="Brioso Cannions +3",
	feet="Fili Cothurnes +1"}

	sets.midcast.SongEffect = {
	range="Gjallarhorn",
	head="Fili Calot +1",
	neck="Moonbow Whistle +1",
	left_ear="Genmei Earring",
	right_ear="Etiolation Earring",
	body="Fili Hongreline +1",
	hands="Fili Manchettes +1",
	left_ring="Gelatinous Ring +1",
	right_ring="Defending ring",
	back=Intar.Idle,
	waist="Flume Belt +1",
	legs="Inyanga Shalwar +2",
	feet="Brioso Slippers +3"}
		
	sets.midcast.SongDebuff = {
	range="Gjallarhorn",
	head="Brioso Roundlet +2",
	neck="Moonbow Whistle +1",
	left_ear="Dignitary's Earring",
	right_ear="Regal Earring",
	body="Brioso Justaucorps +2",
	hands="Inyanga Dastanas +2",
	left_ring="metamor. ring +1",
	right_ring="stikini ring +1",	
	back=Intar.MidCast,
	waist="Luminary Sash",
	legs="Brioso Cannions +3",
	feet="Brioso Slippers +3"}
		
	sets.midcast.Etude = set_combine(sets.midcast.SongEffect,{head="Mousai Turban +1"})
	
	sets.midcast.Carol = set_combine(sets.midcast.SongEffect,{hands="Mousai Gages +1"})
	
	sets.midcast.Threnody = set_combine(sets.midcast.SongDebuff,{body="Mousai Manteel +1"})
	
	sets.midcast["Sentinel's Scherzo"] = set_combine(sets.midcast.SongEffect,{feet="Fili Cothurnes +1"})
	
	sets.midcast["Honor March"] = set_combine(sets.midcast.SongEffect,{range="Marsyas"})
	
	sets.midcast.Cure = {
	head="Kaykaus Mitra +1",
    body="Kaykaus Bliaut +1",
	neck="Incanter's Torque",
	hands="Kaykaus Cuffs +1",
	left_ring="stikini ring +1",
	right_ring="stikini ring +1",
	back="Tempered Cape +1",
	waist="Luminary Sash",
	legs="Kaykaus Tights +1",
	feet="Kaykaus Boots +1"}
		
	sets.midcast.Curaga = sets.midcast.Cure
	
    sets.midcast['Enhancing Magic'] = {
	sub="Ammurapi Shield",
	head="Telchine Cap",
	neck="Incanter's Torque",
	left_ear="Augmenting Earring",
	right_ear="Andoaa Earring",
	body="Telchine Chasuble",
	hands="Telchine Gloves",
	left_ring="stikini ring",
	right_ring="stikini ring",
	back="Perimede Cape",
	legs='Telchine Braconi',
	feet="Telchine Pigaches"}
		
	sets.midcast.Haste = sets.midcast['Enhancing Magic']
	
	sets.midcast.Refresh = sets.midcast['Enhancing Magic']
	
	sets.midcast['Enfeebling Magic'] = sets.midcast.SongDebuff

	-- Idle sets
	sets.resting = {}
	
	sets.idle = {
    main="carnwenhan",
    sub="Taming Sari",
    range="Gjallarhorn",
    head="Inyanga Tiara +2",
    body="Ashera Harness",
    hands="Volte Bracers",
    legs="Brioso Cannions +3",
    feet="Inyan. Crackows +2",
    neck="Loricate Torque +1",
    waist="Slipor Sash",
    left_ear="Eabani Earring",
    right_ear="Etiolation Earring",
    left_ring="Inyanga Ring",
    right_ring="Defending Ring",
    back=Intar.Idle}
		
	sets.idle.SB = {}
	
	sets.idle.Refresh = {}
	
	sets.idle.Weak = sets.idle
	 
	-- Engaged sets
	sets.engaged = {
	main="carnwenhan",
	sub="Taming Sari",
	range=Linos.TP,
	head="Volte Tiara",
	neck="Bard's Charm +2",
	left_ear="Eabani Earring",
	right_ear="Telos Earring",
	body="Ashera Harness",
	hands="Volte Mittens",
	left_ring="chirich ring +1",
	right_ring="chirich ring +1",
	back=Intar.DA,
	waist="Reiki Yotai",
	legs="Volte Tights",
	feet="Volte Spats"}
		
	sets.engaged.AM3 ={}

	sets.engaged.SB = {}
	
	sets.engaged.DT = {}
	
	sets.engaged.Aeneas = {}
	
	sets.engaged.Aeneas.DT = {}
	
	sets.engaged.KajaSword = {}
	
	sets.engaged.KajaSword.DT = {}
	
end 
 
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
function job_precast(spell, action, spellMap, eventArgs)
	if spell.type == 'WeaponSkill' then
		if (player.target.distance > (3.2 + player.target.model_size)) and check_facing() then
			cancel_spell()
			return
		end
    end
    if spell.type == 'BardSong' then
        -- Auto-Pianissimo
        if ((spell.target.type == 'PLAYER' and not spell.target.charmed) or (spell.target.type == 'NPC' and spell.target.in_party)) and
            not state.Buff['Pianissimo'] then
             
            local spell_recasts = windower.ffxi.get_spell_recasts()
            if spell_recasts[spell.recast_id] < 2 then
                send_command('@input /ja "Pianissimo" <me>; wait 1.5; input /ma "'..spell.name..'" '..spell.target.name)
                eventArgs.cancel = true
                return
            end
        else
			equip(sets.precast.FC.BardSong)
		end
    end
end
	--No Spell Interrupt/Knockback
--    if check_ready(spell) then
  --      spam_protection_on(spell)
--    else
--        cancel_spell()
--    end
--end
 
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)
    if spell.action_type == 'Magic' then
        if spell.type == 'BardSong' then
            -- layer general gear on first, then let default handler add song-specific gear.
            local generalClass = get_song_class(spell)
            if generalClass and sets.midcast[generalClass] then
                equip(sets.midcast[generalClass])
            end
        end
    end
end
 
-- Set eventArgs.handled to true if we don't want automatic gear equipping to be done.
--function job_aftercast(spell, action, spellMap, eventArgs)
	--No Spell Interrupt/Knockback
--	if spam_protection_off(spell)then
--		handle_idle()	
--	end	
	-- checkAftercast(spell)
--end
 
 
 AM3 = true
 function job_buff_change(n, gain, buff_table)
	local name
	name = string.lower(n)
	if name == "aftermath: lv.1" or name == "aftermath: lv.2" then
		if gain then
	        classes.CustomMeleeGroups:clear()
			AM3 = false
		end
	end
	if name == "aftermath: lv.3" and player.equipment.main == 'carnwenhan' then -- Mythic AM3
		if gain then
			classes.CustomMeleeGroups:append('AM3')		
			AM3 = true
			send_command('timers create "Mythic AM3" 180 down')
		else
	        classes.CustomMeleeGroups:clear()
			AM3 = false
			send_command('timers delete "Mythic AM3";gs c -cd AM3 Lost!!!')
		end
	end
end

 
 
 
 
 
-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------
-- Function to display the current relevant user state when doing an update.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end
 
-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------
function job_update(cmdParams, eventArgs)
    update_combat_form()
end

function update_combat_form()
end
 
-- Determine the custom class to use for the given song.
function get_song_class(spell)
    -- Can't use spell.targets:contains() because this is being pulled from resources
    if set.contains(spell.targets, 'Enemy') then
		return 'SongDebuff'
    else
        return 'SongEffect'
    end
end

--No Interrupt/Knockback
function handle_ping()
  if player.status ~= 'Resting' then
  if doCures then
   cure_process()
 
   showArrayContents()
   handleSpareTime()
  end
 else
  lastx = player.x
  lasty = player.y
 end
end

function handle_idle()
end
 
function set_lockstyle()
    send_command('wait 7; input /lockstyleset 100')
	
end

function set_macros(sheet,book)
    if book then 
        send_command('@input /macro book '..tostring(book)..';wait .1;input /macro set '..tostring(sheet))
        return
    end
    send_command('@input /macro set '..tostring(sheet))
end


set_macros(2,1)


autows = {
--  ['Default'] = "Viper Bite",
	['carnwenhan'] = "Mordant Rime",
	['Tauret'] = "Evisceration",
	['Default'] = "Evisceration",
    ['Aeneas'] = "Rudra's Storm",
    ['blurred knife +1'] = "Viper Bite",
	['naegling'] = "Savage Blade"}

autotp = false

function find_weaponskill()
    local ws = autows[player.equipment.main:lower()] or 0
    --  Defaulting weaponskill becuase main is not in the table
    if ws == 0 then
        return autows.Default
    else
        return ws
    end
end

am3_build = true
 
 windower.register_event('tp change', function(tp)
    if tp >= 1000 and autotp then
		if am3_build then
			if not AM3 and tp >= 3000 then
				local ws = find_weaponskill()
				print('Using AM3 WS: '..ws)
				windower.send_command('input /ws "'..ws..'" <t>')
			elseif AM3 then
				local ws = find_weaponskill()
				windower.send_command('input /ws "'..ws..'" <t>')
			end
		else
			local ws = find_weaponskill()
			windower.send_command('input /ws "'..ws..'" <t>')
		end
    end
end)

windower.send_command('bind !f1 gs c autotp')

function job_self_command(commandArgs, eventArgs)
    if commandArgs[1] == 'autotp' then
        if not autotp then
            autotp = true
            windower.add_to_chat(1,'AutoWS set to On')
        else
            autotp = false
            windower.add_to_chat(1,'AutoWS set to Off')
        end
	elseif commandArgs[1] == 'am3' then
		if am3_build then
			am3_build = false
			windower.add_to_chat(1,'AM3 Build set to Off')
		else
			am3_build = true
			windower.add_to_chat(1,'AM3 Build set to On')
		end
	elseif commandArgs[1] == 'assist' then
		if commandArgs[2] then
			if commandArgs[2] == "on" then
				AssistOn = true
				windower.add_to_chat(1,'Auto Assist set to On')
				return
			elseif commandArgs[2] == "off" then
				AssistOn = false
				windower.add_to_chat(1,'Auto Assist set to Off')
				return
			else
				AssistTarget = commandArgs[2]
				windower.add_to_chat(1,'New assist set to: '..commandArgs[2])
				return
			end
		end
		
	end
end

AssistOn = false
AssistTarget = "Jinsaotome"
assistdelay = 0

function cancel_assist()
	AssistOn = false
end

windower.register_event('prerender', function()
	if assistdelay > 0 then
		assistdelay = assistdelay - 0.1
		return
	end
	areengaged = windower.ffxi.get_player()
	if not areengaged then
		return
	end
	if areengaged.status == 1 then
		return
	end
	if AssistOn then
		assister = windower.ffxi.get_mob_by_name(AssistTarget)
		if not assister then
			return
		end
		if assister.status == 1 then
			if areengaged.target_index == assister.target_index then
				windower.send_command('input /attack')
				assistdelay = 4
				return
			end
			windower.send_command('input /assist '..AssistTarget)
			assistdelay = 4			
		end
	else
		return
	end

end)

function check_facing()
    local target = windower.ffxi.get_mob_by_target('t')
    local player = windower.ffxi.get_mob_by_target('me')
    local dir_target = V{player.x, player.y} - V{target.x, target.y}
    local dir_player = V{target.x, target.y} - V{player.x, player.y}
    local player_heading = V{}.from_radian(player.facing)
    local target_heading = V{}.from_radian(target.facing)
    local player_angle = V{}.angle(dir_player, player_heading):degree():abs()
    local target_angle = V{}.angle(dir_target, target_heading):degree():abs()
    if player_angle < 90 and target_angle < 90 then
        return true
    end
    return false
end

send_command('bind !f send @all /follow bigrupt')
send_command('bind ^f send @all //multi stopfollow')
windower.register_event('zone change', cancel_assist)