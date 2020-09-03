function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
	
    send_command('bind !f1 gs c cycle AutoWSMode') --ALT+F1
    send_command('bind ` input /ma "Sudden Lunge" <t>') -- `
end

function file_unload()
    send_command('unbind `')
	send_command('unbind !f1')
end

function job_setup()

send_command('alias mab input /equip sub "Naegling"; input /equip main "Kaja Rod";' )
send_command('alias tp input /equip main "Tizona"; input /equip sub "Almace";' )
send_command('alias mac input /equip main "Tizona"; input /equip sub "Naegling";' )
send_command('alias exp input /equip main "Tizona"; input /equip sub "Thibron";')

send_command('alias hw input /item "Holy Water" <me>' )
send_command('alias re input /item "Remedy" <me>' )
send_command('alias ed input /item "Echo Drops" <me>' )
send_command('alias pa input /item "Panacea" <me>' )

	state.Buff['Burst Affinity'] = buffactive['Burst Affinity'] or false
	state.Buff['Chain Affinity'] = buffactive['Chain Affinity'] or false
	state.Buff.Convergence = buffactive.Convergence or false
	state.Buff.Diffusion = buffactive.Diffusion or false
	state.Buff.Efflux = buffactive.Efflux or false
	
	state.Buff['Unbridled Learning'] = buffactive['Unbridled Learning'] or false
	state.Buff['Unbridled Wisdom'] = buffactive['Unbridled Wisdom'] or false

	blue_magic_maps = {}
	
	blue_magic_maps.Physical = S{
	'Bilgestorm',
	'Sweeping Gouge',
	'Saurian Slide'}

	blue_magic_maps.PhysicalAcc = S{
	'Heavy Strike'}

	blue_magic_maps.PhysicalStr = S{
	'Battle Dance',
	'Bloodrake',
	'Death Scissors',
	'Dimensional Death',
	'Empty Thrash',
	'Quadrastrike',
	'Sinker Drill',
	'Spinal Cleave',
	'Uppercut',
	'Vertical Cleave'}

	blue_magic_maps.PhysicalDex = S{
	'Amorphic Spikes',
	'Asuran Claws',
	'Barbed Crescent',
	'Claw Cyclone',
	'Disseverment',
	'Foot Kick',
	'Frenetic Rip',
	'Goblin Rush',
	'Hysteric Barrage',
	'Paralyzing Triad',
	'Seedspray',
	'Sickle Slash',
	'Smite of Rage',
	'Terror Touch',
	'Thrashing Assault',
	'Vanity Dive'}
		
	blue_magic_maps.PhysicalVit = S{
	'Body Slam',
	'Cannonball',
	'Delta Thrust',
	'Glutinous Dart',
	'Grand Slam',
	'Power Attack',
	'Quad. Continuum',
	'Sprout Smack',
	'Sub-zero Smash'}
		
	blue_magic_maps.PhysicalAgi = S{
	'Benthic Typhoon',
	'Feather Storm',
	'Helldive',
	'Hydro Shot',
	'Jet Stream',
	'Pinecone Bomb',
	'Spiral Spin',
	'Wild Oats'}

	blue_magic_maps.PhysicalInt = S{
	'Mandibular Bite',
	'Queasyshroom'}

	blue_magic_maps.PhysicalMnd = S{
	'Ram Charge',
	'Screwdriver',
	'Tourbillion'}

	blue_magic_maps.PhysicalChr = S{
	'Bludgeon'}

	blue_magic_maps.PhysicalHP = S{
	'Final Sting'}

	blue_magic_maps.Magical = S{
	'Anvil Lightning',
	'Atra. Libations',
	'Blastbomb',
	'Blazing Bound',
	'Blinding Fulgor',
	'Bomb Toss',
	'Cursed Sphere',
	'Dark Orb',
	'Death Ray',
	'Diffusion Ray',
	'Droning Whirlwind',
	'Embalming Earth',
	'Entomb','Firespit',
	'Foul Waters',
	'Ice Break',
	'Leafstorm',
	'Maelstrom',
	'Molting Plumage',
	'Nectarous Deluge',
	'Rail Cannon',
	'Regurgitation',
	'Rending Deluge',
	'Retinal Glare',
	'Scouring Spate',
	'Searing Tempest',
	'Silent Storm',
	'Spectral Floe',
	'Subduction',
	'Tem. Upheaval',
	'Water Bomb',
	'Tearing Gust',
	'Cesspool',
	'Cruel Joke',
	'Polar Roar',
	'Crashing Thunder',
	'Uproot'}

	blue_magic_maps.MagicalMnd = S{
	'Acrid Stream',
	'Evryone. Grudge',
	'Magic Hammer',
	'Mind Blast'}

	blue_magic_maps.MagicalChr = S{
	'Eyes On Me',
	'Mysterious Light'}

	blue_magic_maps.MagicalVit = S{
	'Thermal Pulse'}

	blue_magic_maps.MagicalStr = S{
	'Searing Tempest'}

	blue_magic_maps.MagicalAgi = S{
	'Silent Storm'}

	blue_magic_maps.MagicalDex = S{
	'Charged Whisker',
	'Gates of Hades'}

	blue_magic_maps.MagicalDark = S{'Palling Salvo',
	'Tenebral Crush'}

	blue_magic_maps.MagicAccuracy = S{
	'1000 Needles',
	'Absolute Terror',
	'Actinic Burst',
	'Auroral Drape',
	'Awful Eye',
	'Blank Gaze',
	'Blistering Roar',
	'Blood Drain',
	'Blood Saber',
	'Chaotic Eye',
	'Cimicine Discharge',
	'Cold Wave',
	'Corrosive Ooze',
	'Demoralizing Roar',
	'Digest',
	'Dream Flower',
	'Enervation',
	'Feather Tickle',
	'Filamented Hold',
	'Frightful Roar',
	'Geist Wall',
	'Hecatomb Wave',
	'Infrasonics',
	'Jettatura',
	'Light of Penance',
	'Lowing',
	'Mind Blast',
	'Mortal Ray',
	'MP Drainkiss',
	'Osmosis',
	'Reaving Wind',
	'Sandspin',
	'Sandspray',
	'Sheep Song',
	'Soporific',
	'Sound Blast',
	'Stinking Gas',
	'Sub-zero Smash',
	'Venom Shell',
	'Voracious Trunk',
	'Yawn'}
		
	blue_magic_maps.Breath = S{	
	'Bad Breath',
	'Flying Hip Press',
	'Frost Breath',
	'Heat Breath',
	'Hecatomb Wave',
	'Magnetite Cloud',
	'Poison Breath',
	'Radiant Breath',
	'Self-Destruct',
	'Thunder Breath',
	'Vapor Spray',
	'Wind Breath'}

	blue_magic_maps.Stun = S{
	'Blitzstrahl',
	'Frypan',
	'Head Butt',
	'Sudden Lunge',
	'Tail slap',
	'Temporal Shift',
	'Thunderbolt',
	'Whirl of Rage'}
		
	blue_magic_maps.Healing = S{
	'Healing Breeze',
	'Magic Fruit',
	'Plenilune Embrace',
	'Pollen',
	'Restoral',
	'White Wind',
	'Wild Carrot'}
	
	blue_magic_maps.SkillBasedBuff = S{
	'Barrier Tusk',
	'Diamondhide',
	'Magic Barrier',
	'Metallic Body',
	'Plasma Charge',
	'Pyric Bulwark',
	'Reactor Cool',
	'Occultation',
	'Mighty Guard', 
	'Cocoon', 
	'Fantod', 
	'Carcharian Verve'}

	blue_magic_maps.Buff = S{
	'Amplification', 
	'Animating Wail', 
	'Battery Charge', 
	'Erratic Flutter', 
	'Exuviation', 
	'Feather Barrier', 
	'Harden Shell', 
	'Memento Mori', 
	'Nat. Meditation',
	'Orcish Counterstance', 
	'Refueling', 
	'Regeneration', 
	'Saline Coat', 
	'Triumphant Roar', 
	'Warm-Up', 
	'Winds of Promyvion', 
	'Zephyr Mantle'}
	
	unbridled_spells = S{
	'Absolute Terror',
	'Bilgestorm',
	'Blistering Roar',
	'Bloodrake',
	'Carcharian Verve',
	'Cesspool',
	'Crashing Thunder',
	'Cruel Joke',
	'Droning Whirlwind',
	'Gates of Hades',
	'Harden Shell',
	'Mighty Guard',
	'Polar Roar',
	'Pyric Bulwark',
	'Tearing Gust',
	'Thunderbolt',
	'Tourbillion',
	'Uproot'}
end

function user_setup()

	state.OffenseMode:options('STP', 'DT', 'TANK')
    state.CastingMode:options('Normal', 'Resistant')
	state.IdleMode:options('Normal', 'PDT')
	state.Buff.Diffusion = buffactive.Diffusion or false

    state.AutoWSMode = M(false, 'AutoWSMode')

    update_combat_form()
    select_default_macro_book()
end

function init_gear_sets()

	Rosmerta= {}
	Rosmerta.STP = {name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','System: 1 ID: 640 Val: 4'}}
	Rosmerta.CRIT = {name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10','Phys. dmg. taken-10%'}}
	Rosmerta.WSD = {name="Rosmerta's Cape",augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%'}}
	Rosmerta.NUKE = {name="Rosmerta's Cape",augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%'}}
	Rosmerta.DA = {name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%'}}
	Rosmerta.IdleFC = {name="Rosmerta's Cape",augments={'MND+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10'}}
	
	
	HerculeanBoots = {}
	HerculeanBoots.TP = {name="Herculean Boots",augments={'Accuracy+23 Attack+23','"Triple Atk."+4','DEX+10','Accuracy+11'}}
	HerculeanBoots.QA = {name="Herculean Boots",augments={'Pet: INT+3','Attack+9','Quadruple Attack +3','Accuracy+5 Attack+5'}}
	HerculeanBoots.CRIT = {name="Herculean Boots",augments={'Accuracy+25 Attack+25','Crit. hit damage +5%','DEX+7','Accuracy+12'}}
	HerculeanBoots.WSD = {name="Herculean Boots",augments={}}
	
	HerculeanVest = {}
	HerculeanVest.CRIT = {name="Herculean Vest",augments={'Accuracy+25','Crit. hit damage +3%','DEX+14','Attack+5'}}
	
	HerculeanHelm = {}
	HerculeanHelm.WSD = {}

    sets.precast.FC = {
		ammo="Staunch Tathlum +1",
    	head="Carmine Mask +1", --10
    	body="Luhlaza Jubbah +3", --9
    	hands="Leyline Gloves", --8
    	legs="Psycloth Lappas", --7
    	feet="Carmine Greaves +1", --8
    	neck="Voltsurge Torque", --4
    	waist="Witful Belt", --3
    	ear1="Etiolation Earring", --1
    	ear2="Loquacious Earring", --2
    	ring1="Kishar Ring", --4
    	ring2="Defending Ring",
    	back=Rosmerta.IdleFC} --10
    
    sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, {})
    
    sets.precast.WS = {
	ammo="Aurgelmir Orb +1",
    head="Adhemar Bonnet +1",
	neck="Mirage Stole +2",
	ear1="Mache Earring +1",
	ear2="Odr Earring",
	body=HerculeanVest.CRIT,
	hands="Adhemar Wristbands +1",
	ring1="Begrudging Ring",
    ring2="Epona's Ring",
	back=Rosmerta.CRIT,
	waist="Fotia Belt",
	legs="Samnuha TIghts",
	feet=HerculeanBoots.CRIT}
        
    sets.precast.WS['Chant du Cygne'] = {
	ammo="Aurgelmir Orb +1",
    head="Adhemar Bonnet +1",
	neck="Mirage Stole +2",
	ear1="Mache Earring +1",
	ear2="Odr Earring",
	body=HerculeanVest.CRIT,
	hands="Adhemar Wristbands +1",
	ring1="Ilabrat Ring",
    ring2="Epona's Ring",
	back=Rosmerta.CRIT,
	waist="Fotia Belt",
	legs="Samnuha TIghts",
	feet=HerculeanBoots.CRIT}        
    
	sets.precast.WS['Requiescat'] = {
	ammo="Aurgelmir Orb +1",
    head="Adhemar Bonnet +1",
	neck="Fotia Gorget",
	ear1="Mache Earring +1",
	ear2="Mache Earring +1",
	body=HerculeanVest.CRIT,
	hands="Adhemar Wristbands +1",
	ring1="Begrudging Ring",
    ring2="Epona's Ring",
	back=Rosmerta.CRIT,
	waist="Fotia Belt",
	legs="Samnuha TIghts",
	feet=HerculeanBoots.CRIT}
        
	sets.precast.WS['Savage Blade'] = {
	ammo="Aurgelmir Orb +1",
    head="Adhemar Bonnet +1",
	neck="Mirage Stole +2",
	ear1="Ishvara Earring",
	ear2="Moonshade Earring",
	body="Assimilator's Jubbah +3",
	hands="Jhakri Cuffs +2",
	ring1="Epaminondas's Ring",
    ring2="Epona's Ring",
	back=Rosmerta.WSD,
	waist="Sailfi Belt +1",
	legs="Luhlaza Shalwar +3",
	feet=HerculeanBoots.CRIT}

	sets.precast.WS['Expiacion'] = {
	ammo="Aurgelmir Orb +1",
    head="Herculean Helm",
	neck="Mirage Stole +2",
	ear1="Ishvara Earring",
	ear2="Moonshade Earring",
	body="Assimilator's Jubbah +3",
	hands="Jhakri Cuffs +2",
	ring1="Epaminondas's Ring",
    ring2="Epona's Ring",
	back=Rosmerta.WSD,
	waist="Sailfi Belt +1",
	legs="Luhlaza Shalwar +3",
	feet=HerculeanBoots.CRIT}
	
	sets.precast.WS['Flat Blade'] = {
	ammo="Aurgelmir Orb +1",
    head="Adhemar Bonnet +1",
	neck="Fotia Gorget",
	ear1="Mache Earring +1",
	ear2="Mache Earring +1",
	body=HerculeanVest.CRIT,
	hands="Adhemar Wristbands +1",
	ring1="Begrudging Ring",
    ring2="Epona's Ring",
	back=Rosmerta.WSD,
	waist="Fotia Belt",
	legs="Samnuha TIghts",
	feet=HerculeanBoots.CRIT}

	sets.precast.WS['Sanguine Blade'] = {
	ammo="Pemphredo Tathlum",
	head="Pixie Hairpin +1",
	neck="Baetyl Pendant",
	ear1="Friomisi Earring",
	ear2="Regal Earring",
	body="Amalric Doublet +1",
	hands="Jhakri Cuffs +2",
	ring1="Archon Ring",
	ring2="Epaminondas's Ring",
	back=Rosmerta.NUKE,
	waist="Orpheus's Sash",
	legs="Luhlaza Shalwar +3",
	feet="Amalric Nails +1"}

    sets.midcast.FastRecast = set_combine(sets.precast.FC, {})
 	
	sets.midcast['Blue Magic'] = {}
	
	sets.midcast['Blue Magic'].Physical = {
	ammo="Aurgelmir Orb +1",
    head="Luhlaza Keffiyeh +3",
    body="Luhlaza Jubbah +3",
    hands="Luhlaza Bazubands +3",
    legs="Jhakri Slops +2",
    feet="Luhlaza Charuqs +3",
    neck="Mirage Stole +2",
    waist="Sailfi Belt +1",
    ear1="Odr Earring",
    ear2="Telos Earring",
    ring1="Ilabrat Ring",
    ring2="Petrov Ring",
    back=Rosmerta.WSD}

	sets.midcast['Blue Magic'].PhysicalAcc = set_combine(sets.midcast['Blue Magic'].Physical,{})

	sets.midcast['Blue Magic'].PhysicalStr = set_combine(sets.midcast['Blue Magic'].Physical,{})

	sets.midcast['Blue Magic'].PhysicalDex = set_combine(sets.midcast['Blue Magic'].Physical,{})

	sets.midcast['Blue Magic'].PhysicalVit = set_combine(sets.midcast['Blue Magic'].Physical,{})

	sets.midcast['Blue Magic'].PhysicalAgi = set_combine(sets.midcast['Blue Magic'].Physical,{})

	sets.midcast['Blue Magic'].PhysicalInt = set_combine(sets.midcast['Blue Magic'].Physical,{})

	sets.midcast['Blue Magic'].PhysicalMnd = set_combine(sets.midcast['Blue Magic'].Physical,{})

	sets.midcast['Blue Magic'].PhysicalChr = set_combine(sets.midcast['Blue Magic'].Physical,{})

	sets.midcast['Blue Magic'].PhysicalHP = set_combine(sets.midcast['Blue Magic'].Physical,{})
	
    sets.midcast['Blue Magic'].Magical =  {
	ammo="Ghastly Tathlum +1",
	head="empty",
	body="Cohort Cloak +1",
	hands="Amalric Gages +1",
	legs="Amalric Slops +1",
	feet="Amalric Nails +1",
	neck="Baetyl Pendant",
	waist="Orpheus's Sash",
	ear1="Regal Earring",
	ear2="Friomisi Earring",
	ring1="Metamorph Ring +1",
	ring2="Shiva Ring +1",
    back=Rosmerta.NUKE}

	sets.midcast['Blue Magic'].Magical.Resistant = set_combine(sets.midcast['Blue Magic'].Magical,{})
	
	sets.midcast['Blue Magic'].MagicalMnd = set_combine(sets.midcast['Blue Magic'].Magical,{})

	sets.midcast['Blue Magic'].MagicalChr = set_combine(sets.midcast['Blue Magic'].Magical)

	sets.midcast['Blue Magic'].MagicalVit = set_combine(sets.midcast['Blue Magic'].Magical)

	sets.midcast['Blue Magic'].MagicalStr = set_combine(sets.midcast['Blue Magic'].Magical,{legs="Luhlaza Shalwar +3"})

	sets.midcast['Blue Magic'].MagicalAgi = set_combine(sets.midcast['Blue Magic'].Magical,{legs="Luhlaza Shalwar +3"})

	sets.midcast['Blue Magic'].MagicalDex = set_combine(sets.midcast['Blue Magic'].Magical)

	sets.midcast['Blue Magic'].MagicalDark = set_combine(sets.midcast['Blue Magic'].Magical,{head="Pixie Hairpin +1",body="Amalric Doublet +1",ring2="Archon Ring"})

	sets.midcast['Blue Magic'].MagicAccuracy = set_combine(sets.midcast['Blue Magic'].Magical,{
    head="Malignance Chapeau", 
    neck="Mirage Stole +2",
	body="Malignance Tabard",
    hands="Malignance Gloves", 
    ear1="Regal Earring", 
    ear2="Digni. Earring",
    ring1="Metamorph Ring +1", 
    ring2="Stikini Ring +1",
    waist="Acuity Belt +1", 
    legs="Malignance Tights", 
    feet="Malignance Boots"})

	sets.midcast['Blue Magic'].Breath = {}
	
	sets.midcast.Swipe = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast.Lunge = set_combine(sets.midcast['Blue Magic'].Magical, {})

	sets.midcast['Blue Magic'].Stun = set_combine(sets.midcast['Blue Magic'].MagicAccuracy,{})
	
	sets.midcast['Blue Magic'].Healing = {
	ammo="Mavi Tathlum",
    head="Malignance Chapeau",
    body="Vrikodara Jupon",
    hands="Telchine Gloves",
    legs="Malignance Tights",
    feet="Carmine Greaves +1",
    neck="Dualism Collar +1",
    waist="Gishdubar Sash",
    ear1="Etiolation Earring",
    ear2="Odnowa Earring +1",
    ring1="Stikini Ring +1",
    ring2="Stikini Ring +1"}
	
	sets.midcast['White Wind'] = {}

	sets.midcast['Blue Magic'].SkillBasedBuff = set_combine(sets.precast.FC, {
	ammo="Mavi Tathlum",
    head="Luhlaza Keffiyeh +3",
    neck="Mirage Stole +2",
    body="Assim. Jubbah +3",
    hands="Rawhide Gloves",
    legs="Hashishin Tayt +1",
    feet="Luhlaza Charuqs +3",
	ear2="Njordr Earring",
    ring1="Stikini Ring +1",
    ring2="Stikini Ring +1",
    back="Cornflower Cape"})

    sets.resting = {}

    sets.idle = {
	ammo="Staunch Tathlum +1",
    head="Malignance Chapeau",
    body="Shamash Robe",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    ear1="Etiolation Earring",
    ear2="Genmei Earring",
    ring1="Stikini Ring +1",
    ring2="Stikini Ring +1",
    back=Rosmerta.IdleFC}

    sets.idle.PDT = {
    ammo="Staunch Tathlum +1",
    head="Malignance Chapeau",
    body="Shamash Robe",
    hands="Volte Bracers",
    legs="Malignance Tights",
    feet=HerculeanBoots.TP,
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    ear1="Etiolation Earring",
    ear2="Genmei Earring",
    ring1="Defending Ring",
    ring2="Stikini Ring +1",
    back=Rosmerta.DA}
    
    sets.Kiting = {legs="Carmine cuisses +1"}
	
	sets.engaged.STP = {
    ammo="Aurgelmir Orb +1",
    head="Dampening Tam",
    body="Adhemar Jacket +1",
    hands="Adhemar Wristbands +1",
    legs="Samnuha Tights",
    feet=HerculeanBoots.QA,
    neck="Mirage Stole +2",
    waist="Windbuffet Belt +1",
    ear1="Suppanomimi",
    ear2="Balder Earring +1",
    ring1="Petrov Ring",
    ring2="Epona's Ring",
    back=Rosmerta.DA}

	sets.engaged.DT = set_combine(sets.engaged.STP, {
    head="Malignance Chapeau",
    body="Malignance Tabard",
	hands="Malignance Gloves",
    legs="Malignance Tights",
	feet="Malignance Boots",
	ring1="Chirich Ring +1",
	ear1="Eabani Earring",
    ring2="Defending Ring",
	waist="Reiki Yotai",
	back=Rosmerta.STP})
	
	sets.engaged.TANK = set_combine(sets.engaged.STP, {
	ammo="Amar Cluster",
	neck="Bathy Choker +1",
    body="Malignance Tabard",
	hands="Luhlaza Bazubands +3",
    legs="Malignance Tights",
	feet="Malignance Boots",
	ring1="Chirich Ring +1",
	ring2="Chirich Ring +1",
	ear1="Eabani Earring",
	ear2="Cryptic Earring",
	waist="Reiki Yotai",
	back=Rosmerta.STP})

	sets.buff['Diffusion'] = {feet = "Luhlaza Charuqs +3"}
	sets.buff['Chain Affinity'] = {feet="Assimilator's Charuqs +2"}
end

function job_precast(spell, action, spellMap, eventArgs)
	if unbridled_spells:contains(spell.english) and not (state.Buff['Unbridled Learning'] or state.Buff['Unbridled Wisdom']) then
		eventArgs.cancel = true
		windower.send_command('@input /ja "Unbridled Learning" <me>; wait 1.5; input /ma "'..spell.name..'" '..spell.target.name)
	end
	if spellMap == 'Cure' or spellMap == 'Curaga' then
		gear.default.obi_waist = ""
		if spell.element == world.weather_element or spell.element == world.day_element then
			gear.default.obi_waist = "Hachirin-no-Obi"
		end
	elseif spell.skill == 'Elemental Magic' or spell.skill == 'Dark Magic' or spell.skill == "Blue Magic" then
		gear.default.obi_waist = "Eschan Stone"
		if spell.element == world.weather_element or spell.element == world.day_element then
			gear.default.obi_waist = "Hachirin-no-Obi"
		end
	end
end

function job_post_midcast(spell, action, spellMap, eventArgs)
	if spell.skill == 'Blue Magic' then
		for buff,active in pairs(state.Buff) do
			if active and sets.buff[buff] then
				equip(sets.buff[buff])
			end
		end
		if spellMap == 'Healing' and spell.target.type == 'SELF' and sets.self_healing then
			equip(sets.self_healing)
		end
	end
end

function job_get_spell_map(spell, default_spell_map)
	if spell.skill == 'Blue Magic' then
		for category,spell_list in pairs(blue_magic_maps) do
			if spell_list:contains(spell.english) then
				return category
			end
		end
	end
end

function customize_idle_set(idleSet)
	if player.mpp < 51 then
		set_combine(idleSet, sets.latent_refresh)
	end
	return idleSet
end

function job_update(cmdParams, eventArgs)
	update_combat_form()
end

function update_combat_form()
	if player.equipment.sub == "Genbu's Shield" or player.equipment.sub == 'empty' then
		state.CombatForm:reset()
	else
		state.CombatForm:set('DW')
	end
end

function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Normal' then
            disable('main','sub','range')
        else
            enable('main','sub','range')
        end
    end
end

windower.register_event('tp change', function(tp)
   if state.AutoWSMode.value == true then
    if player.tp > 999 and player.status == 'Engaged' then
      if player.equipment.sub == 'Machaera +2' then
        send_command('input /ws "Expiacion" <t>')
    else
        send_command('input /ws "Chant du Cygne" <t>')
    end
end
    if player.hp < 1000 then
        send_command('input /ma "Magic Fruit" <me>')
    end
   end
end)

function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(1, 3)
end