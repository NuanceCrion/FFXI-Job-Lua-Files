function get_sets()
	include('organizer-lib')

--KeyBinds
	send_command('wait 5; input /lockstyleset 3')
	send_command('bind ^f1 gs c C7')
	send_command('bind ^f2 gs c C15')
	send_command('bind ^f3 gs c C16')
	send_command('bind !f1 gs c C2')
	send_command('bind !f2 gs c C1')
	send_command('bind !f3 gs c C3')

	AccIndex = 1
	AccArray = {"LowACC","MidACC","HighACC"}
	WeaponIndex = 1
	WeaponArray = {"Chango","Montante","Shining","DWaxe"}
	IdleIndex = 1
	IdleArray = {"Movement","Regen"}
	Armor = 'None'
	Twilight = 'None'
	Attack = 'OFF' -- Set Default WS Attack Set ON or OFF Here --
	Retaliation = 'OFF' -- Set Default Retaliation ON or OFF Here --
	select_default_macro_book() 

	--Augments
	Cichol= {}
	Cichol.DATP = {name="Cichol's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%'}}
	Cichol.DASTR = {name="Cichol's Mantle",augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10'}}
	Cichol.WSDSTR = {name="Cichol's Mantle",augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%'}}
	Cichol.WSDVIT = {name="Cichol's Mantle",augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%'}}
	Cichol.WSCRIT = {name="Cichol's Mantle",augments={}}
	Cichol.Idle = {name="Cichol's Mantle",augments={}}
	Cichol.FC = {name="Cichol's Mantle",augments={}}

	Val= {}
	ValHead = {}
	ValHead.CRIT = {name="Valorous Mask",augments={}}
	
	ValBody = {}
	ValBody.DA = {name="Valorous Mail",augments={'Attack+29','"Dbl.Atk."+5','Accuracy+11'}}
	ValBody.CRIT = {name="Valorous Mail",augments={}}
	
	ValHands = {}
	ValHands.CRIT = {name="Valorous Mitts",augments={}}
	
	ValLegs = {}
	ValLegs.CRIT = {name="Valorous Hose",augments={}}
	
	ValFeet = {}
	ValFeet.CRIT = {name="Valorous Greaves",augments={}}
	
	Odyssean = {}
	OdysseanHands = {}
	OdysseanHands.WSD = {name="Odyssean Gauntlets",augments={'"Cure" potency +1%','INT+3','Weapon skill damage +10%'}}
	
	OdysseanLegs = {}
	OdysseanLegs.WSD = {name="Odyssean Cuisses",augments={'Accuracy+19 Attack+19','Weapon skill damage +4%','DEX+10','Attack+15'}}
	
	-- Idle/Town Sets --
	sets.Idle = {}
	
	sets.Idle.Regen = {
		ammo="Staunch Tathlum +1",
		head="Volte Salade",
		body="Sacro Breastplate",
		hands="Volte Moufles",
		legs="Volte Brayettes",		
		feet="Volte Sollerets",
		neck="Bathy Choker +1",
		waist="Flume Belt +1",
		ear1="Odnowa Earring +1",
		ear2="Etiolation Earring",
		ring1="Moonlight Ring",
		ring2="Defending Ring",
		back=Cichol.DATP}
		
	sets.Idle.Regen.Montante = set_combine(sets.Idle.Regen,{main="Montante +1",sub="Utu Grip"})
	
	sets.Idle.Regen.DWaxe = set_combine(sets.Idle.Regen,{main="Dolichenus",sub="Sangarius +1"})
			
	sets.Idle.Regen.Chango = set_combine(sets.Idle.Regen,{main="Chango",sub="Utu Grip"})
	
	sets.Idle.Regen.Shining = set_combine(sets.Idle.Regen,{main="Shining One",sub="Utu Grip"})

	sets.Idle.Movement = set_combine(sets.Idle.Regen,{})
	
	sets.Idle.Movement.Montante = set_combine(sets.Idle.Regen,{main="Montante +1",sub="Utu Grip"})

	sets.Idle.Movement.DWaxe = set_combine(sets.Idle.Movement,{main="Dolichenus",sub="Sangarius +1"})
			
	sets.Idle.Movement.Chango = set_combine(sets.Idle.Movement,{main="Chango",sub="Utu Grip"})

	sets.Idle.Movement.Shining = set_combine(sets.Idle.Movement,{main="Shining One",sub="Utu Grip"})

	sets.Twilight = {head="Twilight Helm",body="Twilight Mail"}

	-- TP Base Set --
	sets.TP = {}

    --Chango Set
	sets.TP.Chango = {
		main="Chango",
		sub="Utu Grip",
		ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2",
		body=ValBody.DA,
		hands="Sulev. Gauntlets +2",
		legs="Pumm. Cuisses +3",
		feet="Pumm. Calligae +3",
		neck="War. Beads +2",
		waist="Sailfi Belt +1",
		ear1="Cessance Earring",
		ear2="Brutal Earring",
		ring1="Flamma Ring",
		ring2="Niqmaddu Ring",
		back=Cichol.DATP}
		
	sets.TP.Chango.MidACC = set_combine(sets.TP.Chango,{})
	sets.TP.Chango.HighACC = set_combine(sets.TP.Chango.MidACC,{})

	--Montante TP
	sets.TP.Montante = {
		main="Montante +1",
		sub="Utu Grip",
		ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2",
		body=ValBody.DA,
		hands="Sulev. Gauntlets +2",
		legs="Pumm. Cuisses +3",
		feet="Pumm. Calligae +3",
		neck="War. Beads +2",
		waist="Sailfi Belt +1",
		ear1="Cessance Earring",
		ear2="Brutal Earring",
		ring1="Flamma Ring",
		ring2="Niqmaddu Ring",
		back=Cichol.DATP}
		
	sets.TP.Montante.MidACC = set_combine(sets.TP.Montante,{})
	sets.TP.Montante.HighACC = set_combine(sets.TP.Montante.MidACC,{})
	
	--Shining One TP
	sets.TP.Shining = {
		main="Shining One",
		sub="Utu Grip",
		ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2",
		body=ValBody.DA,
		hands="Sulev. Gauntlets +2",
		legs="Pumm. Cuisses +3",
		feet="Pumm. Calligae +3",
		neck="War. Beads +2",
		waist="Sailfi Belt +1",
		ear1="Cessance Earring",
		ear2="Brutal Earring",
		ring1="Flamma Ring",
		ring2="Niqmaddu Ring",
		back=Cichol.DATP}
		
	sets.TP.Shining.MidACC = set_combine(sets.TP.Shining,{})
	sets.TP.Shining.HighACC = set_combine(sets.TP.Shining.MidACC,{})
	
	--DWaxe TP
	sets.TP.DWaxe = {
		main="Dolichenus",
		sub="Sangarius +1",
		ammo="Aurgelmir Orb +1",
		head="Flam. Zucchetto +2",
		body="Emicho Haubert +1",
		hands="Emicho Gauntlets +1",
		legs="Pumm. Cuisses +3",
		feet="Pumm. Calligae +3",
		neck="War. Beads +2",
		waist="Ioskeha Belt +1",
		ear1="Suppanomimi",
		ear2="Brutal Earring",
		ring1="Petrov Ring",
		ring2="Niqmaddu Ring",
		back=Cichol.DATP}
		
	sets.TP.DWaxe.MidACC = set_combine(sets.TP.DWaxe,{})
	sets.TP.DWaxe.HighACC = set_combine(sets.TP.DWaxe.MidACC,{})
	
	
	
	-- Mighty Strikes TP Set --
	sets.TP.MS = {}

	-- Retaliation Set --
  	--sets.TP.Retaliation = {hands="Pumm. Mufflers +2",feet="Boii Calligae +1"}

	-- AM3 Rancor ON Mantle --
  	sets.TP.Rancor = {}

	-- PDT/MDT Sets --
	sets.PDT = {
		ammo="Seething Bomblet +1",
		head="Hjarrandi Helm",
		body="Hjarrandi Breastplate",
		hands="Sulev. Gauntlets +2",
		legs="Pumm. Cuisses +3",
		feet="Pumm. Calligae +3",
		neck="War. Beads +2",
		waist="Ioskeha Belt +1",
		ear1="Odnowa Earring +1",
		ear2="Brutal Earring",
		ring1="Petrov Ring",
		ring2="Moonlight Ring",
		back=Cichol.DATP}
		
	sets.PDT.Chango = set_combine(sets.PDT,{main="Chango",sub="Utu Grip"})
	sets.PDT.Shining = set_combine(sets.PDT,{main="Shining One",sub="Utu Grip"})
	sets.PDT.Montante = set_combine(sets.PDT,{main="Montante +1",sub="Utu Grip"})
	sets.PDT.DWaxe = set_combine(sets.TP.Hybrid,{main="Dolichenus",sub="Sangarius +1",hands="Emicho Gauntlets +1",ear1="Suppanomimi",ring1="Moonlight Ring"})
	
	
	sets.MDT = set_combine(sets.PDT,{
		ammo="Staunch Tathlum +1",
		head="Volte Salade",
		body="Sacro Breastplate",
		hands="Volte Moufles",
		legs="Volte Brayettes",
		feet="Volte Sollerets"})

	sets.TP.Hybrid = {
		ammo="Seething Bomblet +1",
		head="Hjarrandi Helm",
		body="Hjarrandi Breastplate",
		hands="Sulev. Gauntlets +2",
		legs="Pumm. Cuisses +3",
		feet="Pumm. Calligae +3",
		neck="War. Beads +2",
		waist="Ioskeha Belt +1",
		ear1="Odnowa Earring +1",
		ear2="Brutal Earring",
		ring1="Petrov Ring",
		ring2="Moonlight Ring",
		back=Cichol.DATP}
		
	sets.TP.Hybrid.MidACC = set_combine(sets.TP.Hybrid,{})
	sets.TP.Hybrid.HighACC = set_combine(sets.TP.Hybrid.MidACC,{})
	
	sets.TP.Hybrid.Chango = set_combine(sets.Hybrid,{main="Chango",sub="Utu Grip"})
	sets.TP.Hybrid.Shining = set_combine(sets.Hybrid,{main="Shining One",sub="Utu Grip"})
	sets.TP.Hybrid.Montante = set_combine(sets.Hybrid,{main="Montante +1",sub="Utu Grip"})
	sets.TP.Hybrid.DWaxe = set_combine(sets.TP.Hybrid,{main="Dolichenus",sub="Sangarius +1",hands="Emicho Gauntlets +1",ear1="Suppanomimi",ring1="Moonlight Ring"})

	sets.Kiting = set_combine(sets.PDT,{feet="Hermes' Sandals"})

	-- WS Base Set --
	sets.WS = {
		ammo="Seething Bomblet +1",
		head="Flamma Zucchetto +2",
		body="Flamma Korazin +2",
		hands="Flamma Manopolas +2",
		legs="Flamma Dirs +2",
		feet="Flamma Gambieras +2",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		ear1="Dignitary's Earring",
		ear2="Moonshade Earring",
		ring1="Regal Ring",
		ring2="Niqmaddu Ring",
		back=Cichol.WSDSTR}

	-- Upheaval Sets --
	sets.WS.Upheaval = {
		ammo="Knobkierrie",
		head="Agoge Mask +3",
		body="Pumm. Lorica +2",
		hands=OdysseanHands.WSD,
		legs=OdysseanLegs.WSD,
		feet="Sulev. Leggings +2",
		neck="War. Beads +2",
		waist="Ioskeha Belt +1",
		ear1="Thrud Earring",
		ear2="Moonshade Earring",
		ring1="Gelatinous Ring +1",
		ring2="Niqmaddu Ring",
		back=Cichol.WSDVIT}
		
	sets.WS.Upheaval.MidACC = set_combine(sets.WS.Upheaval,{hands="Sulev. Gauntlets +2",ring1="Regal Ring"})
	sets.WS.Upheaval.HighACC = set_combine(sets.WS.Upheaval.MidACC,{})
	sets.WS.Upheaval.ATT = set_combine(sets.WS.Upheaval,{})

	-- Ukko's Fury Sets --
	sets.WS["Ukko's Fury"] = {
		ammo="Yetshila +1",
		head="Blistering Sallet +1",
		body="Hjarrandi Breastplate",
		hands="Sulev. Gauntlets +2",
		legs="Pumm. Cuisses +3",
		feet="Sulev. Leggings +2",
		neck="War. Beads +2",
		waist="Ioskeha Belt +1",
		ear1="Thrud Earring",
		ear2="Moonshade Earring",
		ring1="Begrudging Ring",
		ring2="Niqmaddu Ring",
		back=Cichol.WSDSTR}
		
	sets.WS["Ukko's Fury"].MidACC = set_combine(sets.WS["Ukko's Fury"],{})
	sets.WS["Ukko's Fury"].HighACC = set_combine(sets.WS["Ukko's Fury"].MidACC,{})
	sets.WS["Ukko's Fury"].ATT = set_combine(sets.WS["Ukko's Fury"],{})

	-- King's Justice Sets --
	sets.WS["King's Justice"] = {
		ammo="Knobkierrie",
		head="Agoge Mask +3",
		body="Pumm. Lorica +3",
		hands=OdysseanHands.WSD,
		legs="Pumm. Cuisses +3",
		feet="Sulev. Leggings +2",
		neck="War. Beads +2",
		waist="Ioskeha Belt +1",
		ear1="Thrud Earring",
		ear2="Moonshade Earring",
		ring1="Galatinous Ring +1",
		ring2="Niqmaddu Ring",
		back=Cichol.WSDSTR}
		
	sets.WS["King's Justice"].MidACC  = set_combine(sets.WS["King's Justice"],{})
	sets.WS["King's Justice"].HighACC = set_combine(sets.WS["King's Justice"].MidACC,{})

	-- Fell Cleave Set --
	sets.WS["Fell Cleave"] = {
		ammo="Knobkierrie",
		head="Agoge Mask +3",
		body="Pumm. Lorica +2",
		hands=OdysseanHands.WSD,
		legs="Pumm. Cuisses +3",
		feet="Sulev. Leggings +2",
		neck="War. Beads +2",
		waist="Ioskeha Belt +1",
		ear1="Thrud Earring",
		ear2="Moonshade Earring",
		ring1="Galatinous Ring +1",
		ring2="Niqmaddu Ring",
		back=Cichol.WSDSTR}

	-- Resolution --
	sets.WS.Resolution = {
		ammo="Seething Bomblet +1",
		head="Flam. Zucchetto +2",
		body="Argosy Hauberk +1",
		hands="Argosy Mufflers +1",
		legs="Argosy Breeches +1",
		feet="Flam. Gambieras +2",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		ear1="Lugra Earring +1",
		ear2="Moonshade Earring",
		ring1="Regal Ring",
		ring2="Niqmaddu Ring",
		back=Cichol.DASTR}
		
	sets.WS.Resolution.MidACC  = set_combine(sets.WS.Resolution,{})
	sets.WS.Resolution.HighACC = set_combine(sets.WS.Resolution.MidACC,{})

	-- Mighty Strikes WS Set --
	sets.MS_WS = {ammo="Yetshila +1"}

	sets.Upheaval2250 = {
		ammo="Knobkierrie",
		head="Agoge Mask +3",
		body="Pumm. Lorica +3",
		hands="Sulev. Gauntlets +2",
		legs="Pumm. Cuisses +3",
		feet="Pumm. Calligae +3",
		neck="War. Beads +2",
		waist="Sailfi Belt +1",
		ear1="Thrud Earring",
		ear2="Moonshade Earring",
		ring1="Gelatinous Ring +1",
 		ring2="Niqmaddu Ring",
		back=Cichol.WSDVIT}
		
	sets.Upheaval2k = {
		ammo="Knobkierrie",
		head="Agoge Mask +3",
		body="Pumm. Lorica +3",
		hands="Sulev. Gauntlets +2",
		legs="Sulev. Cuisses +2",
		feet="Sulev. Leggings +2",
		neck="War. Beads +2",
		waist="Ioskeha Belt +1",
		ear1="Thrud Earring",
		ear2="Moonshade Earring",
		ring1="Gelatinous Ring +1",
		ring2="Niqmaddu Ring",
		back=Cichol.WSDVIT}

	sets.KJTP2250 = {}

	sets.KJTP2k = {}
	
	sets.WS['Impulse Drive'] = {
		ammo="Knobkierrie",
		head="Agoge Mask +3",
		body="Pumm. Lorica +2",
		hands=OdysseanHands.WSD,
		legs=OdysseanLegs.WSD,
		feet="Sulev. Leggings +2",
		neck="War. Beads +2",
		waist="Sailfi Belt +1",
		ear1="Thrud Earring",
		ear2="Moonshade Earring",
		ring1="Regal Ring",
		ring2="Niqmaddu Ring",
		back=Cichol.WSDSTR}
		
	sets.WS['Sonic Thrust'] = {
		ammo="Knobkierrie",
		head="Agoge Mask +3",
		body="Pumm. Lorica +2",
		hands=OdysseanHands.WSD,
		legs=OdysseanLegs.WSD,
		feet="Sulev. Leggings +2",
		neck="War. Beads +2",
		waist="Sailfi Belt +1",
		ear1="Thrud Earring",
		ear2="Moonshade Earring",
		ring1="Regal Ring",
		ring2="Niqmaddu Ring",
		back=Cichol.WSDSTR}
	
	sets.WS.Decimation = {
		ammo="Seething Bomblet +1",
		head="Flam. Zucchetto +2",
		body="Argosy Hauberk +1",
		hands="Argosy Mufflers +1",
		legs="Argosy Breeches +1",
		feet="Flam. Gambieras +2",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		ear1="Cessance Earring",
		ear2="Lugra Earring +1",
		ring1="Regal Ring",
		ring2="Niqmaddu Ring",
		back=Cichol.DASTR}
		
	sets.WS['Mistral Axe'] = {
		ammo="Knobkierrie",
		head="Agoge Mask +3",
		body="Pumm. Lorica +2",
		hands=OdysseanHands.WSD,
		legs=OdysseanLegs.WSD,
		feet="Sulev. Leggings +2",
		neck="War. Beads +2",
		waist="Sailfi Belt +1",
		ear1="Thrud Earring",
		ear2="Moonshade Earring",
		ring1="Regal Ring",
		ring2="Niqmaddu Ring",
		back=Cichol.WSDSTR}
		
	sets.WS['Calamity'] = {
		ammo="Knobkierrie",
		head="Agoge Mask +3",
		body="Pumm. Lorica +2",
		hands=OdysseanHands.WSD,
		legs=OdysseanLegs.WSD,
		feet="Sulev. Leggings +2",
		neck="War. Beads +2",
		waist="Sailfi Belt +1",
		ear1="Thrud Earring",
		ear2="Moonshade Earring",
		ring1="Regal Ring",
		ring2="Niqmaddu Ring",
		back=Cichol.WSDSTR}
	
	-- JA Sets --
	sets.JA = {}
	sets.JA.Berserk = {feet="Agoge Calligae +1", body="Pumm. Lorica +2", back="Cichol's Mantle"}
	sets.JA.Aggressor = {head="Pumm. Mask +2",body="Agoge Lorica +1"}
	sets.JA["Blood Rage"] = {body="Boii Lorica +1"}
	sets.JA.Warcry = {head="Agoge Mask +3"}
	sets.JA.Tomahawk = {ammo="Thr. Tomahawk",feet="Agoge Calligae +1"}
	sets.JA["Mighty Strikes"] = {hands="Agoge Mufflers +1"}
	sets.JA.Provoke = {}

	-- Waltz Set --
	sets.Waltz = {}

	sets.Precast = {}
	
	-- Fastcast Set --
	sets.Precast.FastCast = {}

	sets.Midcast = {}
	
	-- Magic Haste Set --
	sets.Midcast.Haste = set_combine(sets.PDT,{})

	sets.organizer = {
		item="Sublime Sushi +1",
		item="Sublime Sushi",
		item="Echo Drops",
		ammo="Thr. Tomahawk"}
		
end

function pretarget(spell,action)
	if spell.action_type == 'Magic' and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
	elseif spell.english == "Seigan" and buffactive.Seigan then -- Change Seigan To Third Eye If Seigan Is On --
		cancel_spell()
		send_command('ThirdEye')
	elseif spell.english == "Meditate" and player.tp > 2900 then -- Cancel Meditate If TP Is Above 2900 --
		cancel_spell()
		add_to_chat(123, spell.name .. ' Canceled: ['..player.tp..' TP]')

	end
end

function precast(spell,action)
	if spell.type == "WeaponSkill" then
			equipSet = sets.WS
			if equipSet[spell.english] then
				equipSet = equipSet[spell.english]
			end
			if Attack == 'ON' then
				equipSet = equipSet["ATT"]
			end
			if equipSet[AccArray[AccIndex]] then
				equipSet = equipSet[AccArray[AccIndex]]
			end
			if buffactive["Mighty Strikes"] then -- Equip MS_WS Set When You Have Mighty Strikes On --
				equipSet = set_combine(equipSet,sets.MS_WS)
			end
			if spell.english == "Ukko's Fury" or spell.english == "King's Justice" then
				if world.time <= (7*60) or world.time >= (17*60) then -- Equip Lugra Earring +1 From Dusk To Dawn --
					equipSet = set_combine(equipSet,{ear1="Lugra Earring +1"})
				end
			end
            if spell.english == "Upheaval" then 
				if player.tp > 2750 then
					equipSet = sets.Upheaval2250

				 elseif player.tp > 2000 then
					equipSet = sets.Upheaval2k
				 end
			end
			
			equip(equipSet)
	elseif spell.type == "JobAbility" then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
	elseif spell.action_type == 'Magic' then
		if spell.english == 'Utsusemi: Ni' then
			if buffactive['Copy Image (3)'] then
				cancel_spell()
				add_to_chat(123, spell.name .. ' Canceled: [3 Images]')
				return
			else
				equip(sets.Precast.FastCast)
			end
		else
			equip(sets.Precast.FastCast)
		end
	elseif spell.type == "Waltz" then
		refine_waltz(spell,action)
		equip(sets.Waltz)
	elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
		cast_delay(0.2)
		send_command('cancel Sneak')
	end
	if Twilight == 'Twilight' then
		equip(sets.Twilight)
	end
end

function midcast(spell,action)
	if spell.action_type == 'Magic' then
		if spell.english:startswith('Utsusemi') then
			if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)']) then -- Cancel Copy Image 1, 2 & 3 For Utsusemi: Ichi --
				send_command('@wait 1.7;cancel Copy Image*')
			end
			equip(sets.Midcast.Haste)
		elseif spell.english == 'Monomi: Ichi' then -- Cancel Sneak --
			if buffactive['Sneak'] then
				send_command('@wait 1.7;cancel sneak')
			end
			equip(sets.Midcast.Haste)
		else
			equip(sets.Midcast.Haste)
		end
	end
end

function aftercast(spell,action)
	if not spell.interrupted then
		if spell.type == "WeaponSkill" then
			send_command('wait 0.2;gs c TP')
		elseif spell.english == "Blood Rage" then -- Blood Rage Timer/Countdown --
			timer_blood_rage()
			send_command('wait 50;input /echo '..spell.name..': [WEARING OFF IN 10 SEC.];wait 10;input /echo '..spell.name..': [OFF]')
		elseif spell.english == "Tomahawk" then -- Tomahawk Timer/Countdown --
			timer_tomahawk()
			send_command('wait 80;input /echo '..spell.name..': [WEARING OFF IN 10 SEC.];wait 10;timers delete "Tomahawk";input /echo '..spell.name..': [OFF]')
		end
	end
	status_change(player.status)
end

function status_change(new,old)
	check_equip_lock()
	if Armor == 'PDT' then
		equip(sets.PDT)
	elseif Armor == 'MDT' then
		equip(sets.MDT)
	elseif Armor == 'Kiting' then
		equip(sets.Kiting)
	elseif new == 'Engaged' then
		equipSet = sets.TP
		if Armor == 'Hybrid' and equipSet["Hybrid"] then
			equipSet = equipSet["Hybrid"]
		end
		if equipSet[WeaponArray[WeaponIndex]] then
			equipSet = equipSet[WeaponArray[WeaponIndex]]
		end
		if equipSet[AccArray[AccIndex]] then
			equipSet = equipSet[AccArray[AccIndex]]
		end
		if buffactive["Aftermath: Lv.3"] and equipSet["AM3"] then
			if Rancor == 'ON' then
				equipSet = set_combine(equipSet["AM3"],sets.TP.Rancor)
			else
				equipSet = equipSet["AM3"]
			end
		end
		if buffactive.Aftermath and equipSet["AM"] then
			equipSet = equipSet["AM"]
		end
		if buffactive["Mighty Strikes"] then
			equipSet = set_combine(equipSet,sets.TP.MS)
		end
		equip(equipSet)
	else
		equipSet = sets.Idle
		if equipSet[IdleArray[IdleIndex]] then
			equipSet = equipSet[IdleArray[IdleIndex]]
		end
		if equipSet[WeaponArray[WeaponIndex]] then
			equipSet = equipSet[WeaponArray[WeaponIndex]]
		end
		if buffactive['Reive Mark'] then
			equipSet = set_combine(equipSet,{neck="Ygnas's Resolve +1"})
		end
		equip(equipSet)
	end
	if Twilight == 'Twilight' then
		equip(sets.Twilight)
	end
end

function buff_change(buff,gain)
	buff = string.lower(buff)
	if buff == "aftermath: lv.3" then -- AM3 Timer/Countdown --
		if gain then
			send_command('timers create "Aftermath: Lv.3" 180 down;wait 150;input /echo Aftermath: Lv.3 [WEARING OFF IN 30 SEC.];wait 15;input /echo Aftermath: Lv.3 [WEARING OFF IN 15 SEC.];wait 5;input /echo Aftermath: Lv.3 [WEARING OFF IN 10 SEC.]')
		else
			send_command('timers delete "Aftermath: Lv.3"')
			add_to_chat(123,'AM3: [OFF]')
		end
	elseif buff == "blood rage" and not gain then
		send_command('timers delete "Blood Rage"')
	elseif buff == 'weakness' then -- Weakness Timer --
		if gain then
			send_command('timers create "Weakness" 300 up')
		else
			send_command('timers delete "Weakness"')
		end
	end
	if buff == "sleep" and gain and player.hp > 200 and player.status == "Engaged" then -- Equip Berserker's Torque When You Are Asleep & Have 200+ HP --
		equip({neck="Berserker's Torque"})
	else
		if not midaction() then
			status_change(player.status)
		end
	end
end

-- In Game: //gs c (command), Macro: /console gs c (command), Bind: gs c (command) --
function self_command(command)
	if command == 'C1' then -- Accuracy Toggle --
		AccIndex = (AccIndex % #AccArray) + 1
		add_to_chat(158,'Accuracy Level: ' .. AccArray[AccIndex])
		status_change(player.status)
	elseif command == 'C2' then -- Main Weapon Toggle --
		WeaponIndex = (WeaponIndex % #WeaponArray) + 1
		add_to_chat(158,'Main Weapon: '..WeaponArray[WeaponIndex])
		status_change(player.status)
	elseif command == 'C5' then -- Auto Update Gear Toggle --
		status_change(player.status)
		add_to_chat(158,'Auto Update Gear')
	elseif command == 'C16' then -- Hybrid Toggle --
		if Armor == 'Hybrid' then
			Armor = 'None'
			add_to_chat(123,'Hybrid Set: [Unlocked]')
		else
			Armor = 'Hybrid'
			add_to_chat(158,'Hybrid Set: '..AccArray[AccIndex])
		end
		status_change(player.status)
	elseif command == 'C7' then -- PDT Toggle --
		if Armor == 'PDT' then
			Armor = 'None'
			add_to_chat(123,'PDT Set: [Unlocked]')
		else
			Armor = 'PDT'
			add_to_chat(158,'PDT Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C15' then -- MDT Toggle --
		if Armor == 'MDT' then
			Armor = 'None'
			add_to_chat(123,'MDT Set: [Unlocked]')
		else
			Armor = 'MDT'
			add_to_chat(158,'MDT Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C12' then -- Kiting Toggle --
		if Armor == 'Kiting' then
			Armor = 'None'
			add_to_chat(123,'Kiting Set: [Unlocked]')
		else
			Armor = 'Kiting'
			add_to_chat(158,'Kiting Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C10' then -- Retaliation Toggle --
		if Retaliation == 'ON' then
			Retaliation = 'OFF'
			add_to_chat(123,'Retaliation Set: [Unlocked]')
		else
			Retaliation = 'ON'
			add_to_chat(158,'Retaliation Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C9' then -- Attack Toggle --
		if Attack == 'ON' then
			Attack = 'OFF'
			add_to_chat(123,'Attack: [OFF]')
		else
			Attack = 'ON'
			add_to_chat(158,'Attack: [ON]')
		end
		status_change(player.status)
	elseif command == 'C3' then -- Twilight Toggle --
		if Twilight == 'Twilight' then
			Twilight = 'None'
			add_to_chat(123,'Twilight Set: [Unlocked]')
		else
			Twilight = 'Twilight'
			add_to_chat(158,'Twilight Set: [locked]')
		end
		status_change(player.status)
	elseif command == 'C6' then -- Idle Toggle --
		IdleIndex = (IdleIndex % #IdleArray) + 1
		add_to_chat(158,'Idle Set: ' .. IdleArray[IdleIndex])
		status_change(player.status)
	elseif command == 'TP' then
		add_to_chat(158,'TP Return: ['..tostring(player.tp)..']')
	elseif command:match('^SC%d$') then
		send_command('//' .. sc_map[command])
	end
end

 
function check_equip_lock() -- Lock Equipment Here --
        if player.equipment.ring1 == "Warp Ring" or player.equipment.ring1 == "Trizec Ring" or player.equipment.ring2 == "Warp Ring" or player.equipment.ring2 == "Facility Ring" then
               disable('ring1','ring2')
        else
                enable('ring1','ring2')
        end
end


function timer_blood_rage()
	local duration = 60
	send_command('timers create "Blood Rage" '..tostring(duration)..' down')
end

function timer_tomahawk()
	local duration = 90
	send_command('timers create "Tomahawk" '..tostring(duration)..' down')
end

function refine_waltz(spell,action)
	if spell.type ~= 'Waltz' then
		return
	end

	if spell.name == "Healing Waltz" or spell.name == "Divine Waltz" or spell.name == "Divine Waltz II" then
		return
	end

	local newWaltz = spell.english
	local waltzID

	local missingHP

	if spell.target.type == "SELF" then
		missingHP = player.max_hp - player.hp
	elseif spell.target.isallymember then
		local target = find_player_in_alliance(spell.target.name)
		local est_max_hp = target.hp / (target.hpp/100)
		missingHP = math.floor(est_max_hp - target.hp)
	end

	if missingHP ~= nil then
		if player.sub_job == 'DNC' then
			if missingHP < 40 and spell.target.name == player.name then
				add_to_chat(8,'Full HP!')
				cancel_spell()
				return
			elseif missingHP < 150 then
				newWaltz = 'Curing Waltz'
				waltzID = 190
			elseif missingHP < 300 then
				newWaltz = 'Curing Waltz II'
				waltzID = 191
			else
				newWaltz = 'Curing Waltz III'
				waltzID = 192
			end
		else
			return
		end
	end

	local waltzTPCost = {['Curing Waltz'] = 20, ['Curing Waltz II'] = 35, ['Curing Waltz III'] = 50}
	local tpCost = waltzTPCost[newWaltz]

	local downgrade

	if player.tp < tpCost and not buffactive.trance then

		if player.tp < 20 then
			add_to_chat(8, 'Insufficient TP ['..tostring(player.tp)..']. Cancelling.')
			cancel_spell()
			return
		elseif player.tp < 35 then
			newWaltz = 'Curing Waltz'
		elseif player.tp < 50 then
			newWaltz = 'Curing Waltz II'
		end

		downgrade = 'Insufficient TP ['..tostring(player.tp)..']. Downgrading to '..newWaltz..'.'
	end

	if newWaltz ~= spell.english then
		send_command('@input /ja "'..newWaltz..'" '..tostring(spell.target.raw))
		if downgrade then
			add_to_chat(158, downgrade)
		end
		cancel_spell()
		return
	end

	if missingHP > 0 then
		add_to_chat(158,'Trying to cure '..tostring(missingHP)..' HP using '..newWaltz..'.')
	end
end

function find_player_in_alliance(name)
	for i,v in ipairs(alliance) do
		for k,p in ipairs(v) do
			if p.name == name then
				return p
			end
		end
	end
end

function sub_job_change(newSubjob, oldSubjob)
	select_default_macro_book()
end

function set_macro_page(set,book)
	if not tonumber(set) then
		add_to_chat(123,'Error setting macro page: Set is not a valid number ('..tostring(set)..').')
		return
	end
	if set < 1 or set > 10 then
		add_to_chat(123,'Error setting macro page: Macro set ('..tostring(set)..') must be between 1 and 10.')
		return
	end

	if book then
		if not tonumber(book) then
			add_to_chat(123,'Error setting macro page: book is not a valid number ('..tostring(book)..').')
			return
		end
		if book < 1 or book > 20 then
			add_to_chat(123,'Error setting macro page: Macro book ('..tostring(book)..') must be between 1 and 20.')
			return
		end
		send_command('@input /macro book '..tostring(book)..';wait .1;input /macro set '..tostring(set))
	else
		send_command('@input /macro set '..tostring(set))
	end
end

function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'SAM' then
        set_macro_page(1, 13)
    elseif player.sub_job == 'NIN' then
        set_macro_page(2, 13)
    elseif player.sub_job == 'BLU' then
        set_macro_page(3, 13)
    elseif player.sub_job == 'DNC' then
        set_macro_page(4, 13)
    else
        set_macro_page(5, 13)
    end
end