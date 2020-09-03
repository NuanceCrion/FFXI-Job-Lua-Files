include('organizer-lib')

	send_command('wait 5; input /lockstyleset 3')
	send_command('bind ^f1 gs c C7')
	send_command('bind ^f2 gs c C15')
	send_command('bind ^f3 gs c C16')
	send_command('bind !f1 gs c C2')
	send_command('bind !f2 gs c C1')
	send_command('bind !f3 gs c C3')

function get_sets() 
	AccIndex = 1
	AccArray = {"LowACC","MidACC","HighACC"} 
	MaccIndex = 1
	MaccArray = {"Potency","Resist","Duration"} 
	WeaponIndex = 1
	WeaponArray = {"Liberator","Caladbolg","Apocalypse","Lycurgos","Anguta","Redemption"}
	IdleIndex = 1
	IdleArray = {"Movement","Regen","Refresh","Regain"}
	DarkSealIndex = 0
	Armor = 'None'
	Twilight = 'None'
	Samurai_Roll = 'ON'
	target_distance = 5
	select_default_macro_book()

	Ankou={}
	Ankou.WSDSTR=	{name="Ankou's Mantle",augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%'}}
	Ankou.DA= 		{name="Ankou's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%'}}
	Ankou.WSDVIT=	{name="Ankou's Mantle",augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%'}}
	Ankou.FC=		{name="Ankou's Mantle",augments={'INT+20','"Fast Cast"+10'}}
    Ankou.STP=      {name="Ankou's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%'}}
	Ankou.WSDINT=	{name="Ankou's Mantle",augments={'INT+20','Accuracy+20 Attack+20','Weapon skill damage +10%'}}
	Ankou.WSDA= 	{name="Ankou's Mantle",augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10'}}
	
	Odyssean= {}
	OdysseanHelm= {}
	OdysseanHelm.WSDVIT = {name="Odyssean Helm",augments={}}
	
	OdysseanLegs= {}
	OdysseanLegs.QA = {name="Odyssean Cuisses",augments={'MND+1','Attack+17','Quadruple Attack +3','Accuracy+8 Attack+8'}}
	OdysseanLegs.STP = {name="Odyssean Cuisses",augments={'Accuracy+17 Attack+17','"Store TP"+8','AGI+1','Accuracy+10'}}
	
	Valorous= {}
	ValorousHands= {}
	ValorousHands.QA= {}
	
	ValorousFeet= {}
	ValorousFeet.QA= {name="Valorous Greaves",augments={'AGI+10','Accuracy+15 Attack+15','Quadruple Attack +2','Mag. Acc.+5 "Mag.Atk.Bns."+5'}}
	ValorousFeet.STP = {name="Valorous Greaves",augments={'"Store TP"+8','DEX+8','"Fast Cast"+6','Accuracy+18 Attack+18','Mag. Acc.+2 "Mag.Atk.Bns."+2'}}
	
	sets.Idle = {
		sub="Utu Grip",
		ammo="Staunch Tathlum +1",
		neck="Bathy Choker +1",
		ear1="Genmei Earring",
		ear2="Etiolation Earring",
		head="Volte Salade",
		body="Sacro Breastplate",
		hands="Volte Moufles",
		ring1="Defending Ring",
		ring2="Chirich Ring +1",
		back="Moonlight Cape",
		waist="Flume Belt +1",
		legs="Volte Brayettes",
		feet="Volte Sollerets"}

		-- Regen Set --
	sets.Idle.Regen = set_combine(sets.Idle,{ring1="Chirich Ring +1"})
	sets.Idle.Regen.Liberator = set_combine(sets.Idle.Regen,{main="Liberator"})
	sets.Idle.Regen.Anguta = set_combine(sets.Idle.Regen,{main="Anguta"})
	sets.Idle.Regen.Caladbolg = set_combine(sets.Idle.Regen,{main="Caladbolg"})
	sets.Idle.Regen.Apocalypse = set_combine(sets.Idle.Regen,{main="Apocalypse"})
	sets.Idle.Regen.Lycurgos = set_combine(sets.Idle.Regen,{main="Lycurgos"})
	sets.Idle.Regen.Redemption= set_combine(sets.Idle.Regen,{main="Redemption"})

		-- Movement Sets --
	sets.Idle.Movement = set_combine(sets.Idle,{legs="Carmine Cuisses +1"})
	sets.Idle.Movement.Liberator = set_combine(sets.Idle.Movement,{main="Liberator"})
	sets.Idle.Movement.Anguta = set_combine(sets.Idle.Movement,{main="Anguta"})
	sets.Idle.Movement.Caladbolg = set_combine(sets.Idle.Movement,{main="Caladbolg"})
	sets.Idle.Movement.Apocalypse = set_combine(sets.Idle.Movement,{main="Apocalypse"})
	sets.Idle.Movement.Lycurgos = set_combine(sets.Idle.Movement,{main="Lycurgos"})
	sets.Idle.Movement.Redemption = set_combine(sets.Idle.Movement,{main="Redemption"})

		-- Refresh Sets --
	sets.Idle.Refresh = set_combine(sets.Idle,{neck="Vim Torque +1",body="Lugra Cloak +1"})
	sets.Idle.Refresh.Liberator = set_combine(sets.Idle.Refresh,{main="Liberator"})
	sets.Idle.Refresh.Anguta = set_combine(sets.Idle.Refresh,{main="Anguta"})
	sets.Idle.Refresh.Caladbolg = set_combine(sets.Idle.Refresh,{main="Caladbolg"})
	sets.Idle.Refresh.Apocalypse = set_combine(sets.Idle.Refresh,{main="Apocalypse"})
	sets.Idle.Refresh.Lycurgos = set_combine(sets.Idle.Refresh,{main="Lycurgos"})
	sets.Idle.Refresh.Redemption = set_combine(sets.Idle.Refresh,{main="Redemption"})

		-- Regain Sets --
	sets.Idle.Regain = set_combine(sets.Idle,{head="Ratri Sallet +1",body="Hjarrandi Breastplate"})
	sets.Idle.Regain.Liberator = set_combine(sets.Idle.Regain,{main="Liberator"})
	sets.Idle.Regain.Anguta = set_combine(sets.Idle.Regain,{main="Anguta"})
	sets.Idle.Regain.Caladbolg = set_combine(sets.Idle.Regain,{main="Caladbolg"})
	sets.Idle.Regain.Apocalypse = set_combine(sets.Idle.Regain,{main="Apocalypse"})
	sets.Idle.Regain.Lycurgos = set_combine(sets.Idle.Regain,{main="Lycurgos"})
	sets.Idle.Regain.Redemption = set_combine(sets.Idle.Regain,{main="Redemption"})

	
	sets.Twilight = set_combine(sets.Idle.Regen,{head="Twilight Helm",body="Twilight Mail"})

	-- JA Sets --
	sets.JA = {}
	sets.JA['Diabolic Eye'] = {hands="Fallen's Finger gauntlets +3"}
	sets.JA['Arcane Circle'] = {feet="Ignominy Sollerets +3"}
	sets.JA['Nether Void'] = {legs="Heath. Flanchard +1"}
	sets.JA['Souleater'] = {head="Ignominy Burgonet +3"}
	sets.JA['Weapon Bash'] = {hands="Ignominy Gauntlets +3"}
	sets.JA['Last Resort'] = {back="Ankou's Mantle",feet="Fallen's Sollerets +3"}
	sets.JA['Dark Seal'] = {head="Fallen's Burgeonet +3"}
	sets.JA['Blood Weapon'] = {body="Fallen's Cuirass +3"}

	sets.Precast = {}
	-- Fastcast Set --
	sets.Precast.FastCast = {
		ammo="Sapience Orb",
		head="Carmine Mask +1",
		neck="Voltsurge Torque",
		ear2="Loquacious Earring",
		ear1="Malignance Earring", 
		body="Fallen's Cuirass +3",
		hands="Leyline Gloves",
		ring1="Kishar Ring",
		ring2="Rahab Ring",
		back=Ankou.FC,
		waist="Sailfi Belt +1",
		legs="Fallen's Flanchard +3",
		feet="Carmine Greaves +1"}
		
	-- Precast Dark Magic --
	sets.Precast['Dark Magic'] = set_combine(sets.Precast.FastCast,{head="Fallen's Burgeonet +3"})

	-- Midcast Base Set --
	sets.Midcast = {}
	
	-- Magic Haste Set --
	sets.Midcast.Haste = set_combine(sets.PDT,{})

	-- Dark Magic Set --
	sets.Midcast['Dark Magic'] = {
		ammo="Pemphredo Tathlum",
		head="Ignominy Burgonet +3",
		body="Carmine Scale Mail +1",
		hands="Fallen's finger gauntlets +3",
		legs="Fallen's Flanchard +3",
		feet="Ratri Sollerets +1",
		neck="Erra Pendant",
		waist="Orpheus's Sash",
		ear1="Malignance Earring",
		ear2="Dark Earring",
		ring1="Stikini Ring +1",
		ring2="Evanescence Ring",
		back="Niht Mantle"}
	
	-- Absorb Set --
    sets.Midcast.Absorb = {
		ammo="Pemphredo Tathlum",
		head="Ignominy Burgonet +3",
		body="Carmine Scale Mail +1",
		legs="Fallen's Flanchard +3",
		feet="Ratri Sollerets +1",
		neck="Erra Pendant",
		waist="Orpheus's Sash",
		ear1="Malignance Earring",
		ear2="Dark Earring",
		ring2="Kishar Ring",
		hands="Fallen's Finger Gauntlets +3",
		ring1="Evanescence Ring",
		back=Ankou.FS}
	
	sets.Midcast.Absorb.Resist = set_combine(sets.Midcast.Absorb,{})
	
	sets.Midcast.Absorb.Duration = set_combine(sets.Midcast.Absorb,{})
			
	-- Absorb-TP Set --
    sets.Midcast['Absorb-TP'] = set_combine(sets.Midcast.Absorb,{hands="Heathen's Gauntlets +1"})

	-- Stun Sets --
	sets.Midcast.Stun = set_combine(sets.Midcast['Dark Magic'],{
		head="Carmine Mask +1",
		hands="Leyline Gloves",
		ring2="Regal Ring",
		waist="Eschan Stone",
		legs="Fallen's Flanchard +3",
		feet="Ignominy Sollerets +3",
		back=Ankou.FC})
		
	sets.Midcast.Stun.Resist = set_combine(sets.Midcast.Stun,{})
	sets.Midcast.Stun.Duration = set_combine(sets.Midcast.Stun,{})

	-- Endark Set --
	sets.Midcast['Endark II'] = {
		head="Ignominy Burgonet +3",
		neck="Erra Pendant",
		ear2="Dark Earring",
		ear1="Malignance Earring",
		body="Carmine Scale Mail +1",
		hands="Fallen's finger gauntlets +3",
		ring1="Stikini Ring +1",
		ring2="Evanescence Ring",
		waist="Casso sash",
		legs="Fallen's Flanchard +3",
		feet="Ratri Sollerets +1",
		back="Niht Mantle"}

	-- Enfeebling Magic Set --
	sets.Midcast['Enfeebling Magic'] = {
		ammo="Pemphredo Tathlum",
		head="Ignominy Burgonet +3",
		body="Ignominy Cuirass +3",
		hands="Leyline Gloves",
		legs="Fallen's Flanchard +3",
		feet="Ignominy Sollerets +3",
		neck="Incanter's Torque",
		waist="Eschan Stone",
		ear1="Malignance Earring",
		ear2="Dignitary's Earring",
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
		back=Ankou.FC}

	-- Elemental Magic Set --
	sets.Midcast['Elemental Magic'] = {
		ammo="Pemphredo Tathlum",
		head="Fallen's Burgeonet +3",
		body="Fallen's Cuirass +3",
		hands="Fallen's Finger Gauntlets +3",
		legs="Fallen's Flanchard +3",
		feet="Ignominy Sollerets +3",
		neck="Sanctity necklace",
		waist="Eschan Stone",
		ear1="Malignance Earring",
		ear2="Friomisi Earring",
		ring1="Shiva Ring +1",
		ring2="Shiva Ring +1",
		back=Ankou.FC}

	-- Dread Spikes Set --
	sets.Midcast['Dread Spikes'] = {
		ammo="Egoist's Tathlum",
		head="Ratri Sallet +1",
		body="Heathen's Cuirass +1",
		hands="Ratri Gadlings +1",
		legs="Ratri Cuisses +1",
		feet="Ratri Sollerets +1",
		neck="Unmoving Collar +1",
		waist="Oneiros Belt",
		ear1="Odnowa Earring +1",
		ear2="Tuisto Earring",
		ring1="Gelatinous Ring +1",
		ring2="Moonlight Ring",
		back="Moonlight Cape",}
		
	sets.Midcast.Drain = {
		ammo="Pemphredo Tathlum",
		neck="Erra Pendant",
		ear1="Malignance Earring",
		ear2="Hirudinea Earring",
		head="Pixie Hairpin +1",
		body="Carmine Scale Mail +1",
		hands="Fallen's finger gauntlets +3",
		ring1="Archon Ring",
		ring2="Evanescence Ring",
		back="Niht Mantle",
		waist="Austerity belt +1",
		legs="Fallen's Flanchard +3",
		feet="Ratri Sollerets +1"} 

	sets.Midcast.Aspir = set_combine(sets.Midcast.Drain, {})
	
	sets.MAXDrain = {main="Father Time",sub="Khonsu",ranged="Ullr"}
	
		-- TP Base Set --
	sets.TP = {}
	
-------------------------------------------------------------------------------------------------------------------------------------------------------------------	
---------------------------------------------------------------- LIBERATOR SETS -----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------	
	
	-- Liberator(AM3 Down) TP Sets --
	sets.TP.Liberator = {main="Liberator",}
	sets.TP.Liberator.MidACC = set_combine(sets.TP.Liberator,{})
	sets.TP.Liberator.HighACC = set_combine(sets.TP.Liberator.MidACC,{})

	-- Liberator(AM3 Up) TP Sets --
	sets.TP.Liberator.AM3 = set_combine(sets.TP.Liberator,{})
	sets.TP.Liberator.MidACC.AM3 = set_combine(sets.TP.Liberator.AM3,{})
	sets.TP.Liberator.HighACC.AM3 = set_combine(sets.TP.Liberator.MidACC.AM3,{})

	-- Liberator(AM3 Down: High Haste) TP Sets --
	sets.TP.Liberator.HighHaste = set_combine(sets.TP.Liberator,{})
	sets.TP.Liberator.MidACC.HighHaste = set_combine(sets.TP.Liberator.HighHaste,{})
	sets.TP.Liberator.HighACC.HighHaste = set_combine(sets.TP.Liberator.MidACC.HighHaste,{})

	-- Liberator(AM3 Up: High Haste) TP Sets --
	sets.TP.Liberator.AM3_HighHaste = set_combine(sets.TP.Liberator.AM3,{})
	sets.TP.Liberator.MidACC.AM3_HighHaste = set_combine(sets.TP.Liberator.AM3_HighHaste,{})
	sets.TP.Liberator.HighACC.AM3_HighHaste = set_combine(sets.TP.Liberator.MidACC.AM3_HighHaste,{})

	-- Liberator(AM3 Down: SAM Roll) TP Sets --
	sets.TP.Liberator.STP = set_combine(sets.TP.Liberator,{})
	sets.TP.Liberator.MidACC.STP = set_combine(sets.TP.Liberator.MidACC,{})
	sets.TP.Liberator.HighACC.STP = set_combine(sets.TP.Liberator.HighACC,{})

	-- Liberator(AM3 Up: SAM Roll) TP Sets --
	sets.TP.Liberator.AM3.STP = set_combine(sets.TP.Liberator.AM3,{})
	sets.TP.Liberator.MidACC.AM3.STP = set_combine(sets.TP.Liberator.MidACC.AM3,{})
	sets.TP.Liberator.HighACC.AM3.STP = set_combine(sets.TP.Liberator.HighACC.AM3,{})

	-- Liberator(AM3 Down: High Haste + SAM Roll) TP Sets --
	sets.TP.Liberator.HighHaste.STP = set_combine(sets.TP.Liberator.HighHaste,{})
	sets.TP.Liberator.MidACC.HighHaste.STP = set_combine(sets.TP.Liberator.MidACC.HighHaste,{})
	sets.TP.Liberator.HighACC.HighHaste.STP = set_combine(sets.TP.Liberator.HighACC.HighHaste,{})

	-- Liberator(AM3 Up: High Haste + SAM Roll) TP Sets --
	sets.TP.Liberator.AM3_HighHaste.STP = set_combine(sets.TP.Liberator.HighHaste,{})
	sets.TP.Liberator.MidACC.AM3_HighHaste.STP = set_combine(sets.TP.Liberator.MidACC.HighHaste,{})
	sets.TP.Liberator.HighACC.AM3_HighHaste.STP = set_combine(sets.TP.Liberator.HighACC.HighHaste,{})

	---------------------------------- /sam sets --------------------------------------
	
	-- Liberator(AM3 Down) /SAM TP Sets --
	sets.TP.Liberator.SAM = {main="Liberator",
	sub="Utu Grip",
    ammo="Aurgelmir Orb +1",
    head="Flam. Zucchetto +2",
    body="Dagon Breastplate",
    hands="Sulevia's Gauntlets +2",
    legs=OdysseanLegs.QA,
    feet="Flam. Gambieras +2",
    neck="Abyssal Beads +2",
    waist="Sailfi Belt +1",
    ear1="Brutal Earring",
    ear2="Balder Earring +1",
    ring1="Flamma Ring",
    ring2="Niqmaddu Ring",
	back=Ankou.DA}
	
	sets.TP.Liberator.SAM.MidACC = set_combine(sets.TP.Liberator.SAM,{})
	sets.TP.Liberator.SAM.HighACC = set_combine(sets.TP.Liberator.SAM.MidACC,{})

	-- Liberator(AM3 Up) /SAM TP Sets --
	sets.TP.Liberator.SAM.AM3 = set_combine(sets.TP.Liberator.SAM,{
	ammo="Aurgelmir Orb +1",
    head="Flam. Zucchetto +2",
    body="Hjarrandi Breastplate",
    hands="Flamma Manopolas +2",
    legs=OdysseanLegs.STP,
    feet=ValorousFeet.STP,
    neck="Abyssal Beads +2",
    waist="Sailfi Belt +1",
    ear1="Digni. Earring",
    ear2="Balder Earring +1",
    ring1="Flamma Ring",
    ring2="Niqmaddu Ring",
	back=Ankou.STP})
	
	sets.TP.Liberator.SAM.MidACC.AM3 = set_combine(sets.TP.Liberator.SAM.AM3,{})
	sets.TP.Liberator.SAM.HighACC.AM3 = set_combine(sets.TP.Liberator.SAM.MidACC.AM3,{})

	-- Liberator(AM3 Down: High Haste) /SAM TP Sets --
	sets.TP.Liberator.SAM.HighHaste = set_combine(sets.TP.Liberator.SAM,{waist="Windbuffet Belt +1",})
	sets.TP.Liberator.SAM.MidACC.HighHaste = set_combine(sets.TP.Liberator.SAM.HighHaste,{})
	sets.TP.Liberator.SAM.HighACC.HighHaste = set_combine(sets.TP.Liberator.SAM.MidACC.HighHaste,{})

	-- Liberator(AM3 Up: High Haste) /SAM TP Sets --
	sets.TP.Liberator.SAM.AM3_HighHaste = set_combine(sets.TP.Liberator.SAM.AM3,{
	ammo="Aurgelmir Orb +1",
    head="Flam. Zucchetto +2",
    body="Hjarrandi Breast.",
    hands="Flam. Manopolas +2",
    legs=OdysseanLegs.STP,
    feet=ValorousFeet.STP,
    neck="Abyssal Beads +2",
    waist="Windbuffet Belt +1",
    ear1="Digni. Earring",
    ear2="Balder Earring +1",
    ring1="Hetairoi Ring",
    ring2="Niqmaddu Ring",
	back=Ankou.STP})
	
	sets.TP.Liberator.SAM.MidACC.AM3_HighHaste = set_combine(sets.TP.Liberator.SAM.AM3_HighHaste,{})
	sets.TP.Liberator.SAM.HighACC.AM3_HighHaste = set_combine(sets.TP.Liberator.SAM.MidACC.AM3_HighHaste,{})

	-- Liberator(AM3 Down: SAM Roll) /SAM TP Sets --
	sets.TP.Liberator.SAM.STP = set_combine(sets.TP.Liberator.SAM,{})
	sets.TP.Liberator.SAM.MidACC.STP = set_combine(sets.TP.Liberator.SAM.MidACC,{})
	sets.TP.Liberator.SAM.HighACC.STP = set_combine(sets.TP.Liberator.SAM.HighACC,{})

	-- Liberator(AM3 Up: SAM Roll) /SAM TP Sets --
	--(1202 ACCURACY) [3-hit]
	sets.TP.Liberator.SAM.AM3.STP = set_combine(sets.TP.Liberator.SAM.AM3,{
	ammo="Aurgelmir Orb +1",
    head="Flam. Zucchetto +2",
    body="Hjarrandi Breast.",
    hands="Flam. Manopolas +2",
    legs=OdysseanLegs.STP,
    feet=ValorousFeet.STP,
    neck="Abyssal Beads +2",
    waist="Sailfi Belt +1",
    ear1="Digni. Earring",
    ear2="Balder Earring +1",
    ring1="Flamma Ring",
    ring2="Niqmaddu Ring",
	back=Ankou.STP})
	
	sets.TP.Liberator.SAM.MidACC.AM3.STP = set_combine(sets.TP.Liberator.SAM.MidACC.AM3,{})
	sets.TP.Liberator.SAM.HighACC.AM3.STP = set_combine(sets.TP.Liberator.SAM.HighACC.AM3,{})

	-- Liberator(AM3 Down: High Haste + SAM Roll) /SAM TP Sets --
	sets.TP.Liberator.SAM.HighHaste.STP = set_combine(sets.TP.Liberator.SAM.AM3.STP,{waist="Windbuffet Belt +1"})
	sets.TP.Liberator.SAM.MidACC.HighHaste.STP = set_combine(sets.TP.Liberator.SAM.MidACC.HighHaste,{})
	sets.TP.Liberator.SAM.HighACC.HighHaste.STP = set_combine(sets.TP.Liberator.SAM.HighACC.HighHaste,{})

	-- Liberator(AM3 Up: High Haste + SAM Roll) /SAM TP Sets --
	sets.TP.Liberator.SAM.AM3_HighHaste.STP = set_combine(sets.TP.Liberator.SAM.HighHaste,{
	ammo="Aurgelmir Orb +1",
    head="Flamma Zucchetto +2",
    body="Hjarrandi Breast.",
    hands="Flam. Manopolas +2",
    legs=OdysseanLegs.STP,
    feet=ValorousFeet.STP,
    neck="Abyssal Beads +2",
    waist="Windbuffet Belt +1",
    ear1="Digni. Earring",
    ear2="Balder Earring +1",
    ring1="Flamma Ring",
    ring2="Niqmaddu Ring",
	back=Ankou.STP})
	
	sets.TP.Liberator.SAM.MidACC.AM3_HighHaste.STP = set_combine(sets.TP.Liberator.SAM.MidACC.HighHaste,{})
	sets.TP.Liberator.SAM.HighACC.AM3_HighHaste.STP = set_combine(sets.TP.Liberator.SAM.HighACC.HighHaste,{})

-------------------------------------------------------------------------------------------------------------------------------------------------------------------	
---------------------------------------------------------------- Redemption SETS -----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------	

	-- Redemption TP Sets --
	sets.TP.Redemption = {main="Redemption",
	sub="Utu Grip",
    ammo="Aurgelmir Orb +1",
    head="Flam. Zucchetto +2",
    body={name="Valorous Mail", augments={'Attack+29','"Dbl.Atk."+5','Accuracy+11'}},
    hands="Sulevia's Gauntlets +2",
    legs="Ig. Flanchard +3",
    feet="Flam. Gambieras +2",
    neck="Abyssal Beads +2",
    waist="Sailfi Belt +1",
    ear1="Brutal Earring",
    ear2="Balder Earring +1",
    ring1="Hetairoi Ring",
    ring2="Niqmaddu Ring",
	back=Ankou.DA} 
		
	sets.TP.Redemption.MidACC = set_combine(sets.TP.Redemption,{}) 
		
	sets.TP.Redemption.HighACC = set_combine(sets.TP.Redemption.MidACC,{})
		
	-- Redemption(High Haste) TP Sets --
	sets.TP.Redemption.HighHaste = set_combine(sets.TP.Redemption,{body="Dagon Breastplate",waist="Windbuffet Belt +1"})
	sets.TP.Redemption.MidACC.HighHaste = set_combine(sets.TP.Redemption.HighHaste,{})
	sets.TP.Redemption.HighACC.HighHaste = set_combine(sets.TP.Redemption.MidACC.HighHaste,{})
	
	-- Redemption(SAM Roll) TP Sets --
	sets.TP.Redemption.STP = set_combine(sets.TP.Redemption,{body="Dagon Breastplate",hands="Flamma Manopolas +2"})
	sets.TP.Redemption.MidACC.STP = set_combine(sets.TP.Redemption.STP,{})
	sets.TP.Redemption.HighACC.STP = set_combine(sets.TP.Redemption.MidACC.STP,{})
							
	-- Redemption(High Haste + SAM Roll) TP Sets --
	sets.TP.Redemption.HighHaste.STP = set_combine(sets.TP.Redemption.STP,{waist="Windbuffet Belt +1"})
	sets.TP.Redemption.MidACC.HighHaste.STP = set_combine(sets.TP.Redemption.MidACC.STP,{})
	sets.TP.Redemption.HighACC.HighHaste.STP = set_combine(sets.TP.Redemption.HighACC.STP,{})
	
	------------------- /sam sets -----------------------------
	
	-- Redemption /SAM TP Sets --
	sets.TP.Redemption.SAM = {main="Redemption",
	sub="Utu Grip",
    ammo="Aurgelmir Orb +1",
    head="Flam. Zucchetto +2",
    body={name="Valorous Mail", augments={'Attack+29','"Dbl.Atk."+5','Accuracy+11'}},
    hands="Sulevia's Gauntlets +2",
    legs=OdysseanLegs.QA,
    feet="Flam. Gambieras +2",
    neck="Abyssal Beads +2",
    waist="Sailfi Belt +1",
    ear1="Brutal Earring",
    ear2="Balder Earring +1",
    ring1="Flamma Ring",
    ring2="Niqmaddu Ring",
	back=Ankou.DA}
	
	sets.TP.Redemption.SAM.MidACC = set_combine(sets.TP.Redemption.SAM,{}) 
	
	sets.TP.Redemption.SAM.HighACC = set_combine(sets.TP.Redemption.SAM.MidACC,{})

	-- Redemption(High Haste) /SAM TP Sets --
	sets.TP.Redemption.SAM.HighHaste = set_combine(sets.TP.Redemption.SAM,{body="Dagon Breastplate",waist="Windbuffet Belt +1"})
	sets.TP.Redemption.SAM.MidACC.HighHaste = set_combine(sets.TP.Redemption.SAM.MidACC,{})
	sets.TP.Redemption.SAM.HighACC.HighHaste = set_combine(sets.TP.Redemption.SAM.HighACC,{})

	-- Redemption(SAM Roll) /SAM TP Sets --
	sets.TP.Redemption.SAM.STP = set_combine(sets.TP.Redemption.SAM,{body="Dagon Breastplate"})
	sets.TP.Redemption.SAM.MidACC.STP = set_combine(sets.TP.Redemption.SAM.MidACC,{})
	sets.TP.Redemption.SAM.HighACC.STP = set_combine(sets.TP.Redemption.SAM.HighACC,{})

	-- Redemption(High Haste + SAM Roll) /SAM TP Sets --
	sets.TP.Redemption.SAM.HighHaste.STP = set_combine(sets.TP.Redemption.SAM.STP,{waist="Windbuffet Belt +1",legs=OdysseanLegs.QA,feet=ValorousFeet.QA})
	sets.TP.Redemption.SAM.MidACC.HighHaste.STP = set_combine(sets.TP.Redemption.SAM.MidACC.STP,{})
	sets.TP.Redemption.SAM.HighACC.HighHaste.STP = set_combine(sets.TP.Redemption.SAM.HighACC.STP,{})
	
-------------------------------------------------------------------------------------------------------------------------------------------------------------------	
---------------------------------------------------------------- APOCALYPSE SETS -----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------	

	-- Apocalypse(AM Down) TP Sets --
	sets.TP.Apocalypse = {main="Apocalypse",
	sub="Utu Grip",
    ammo="Aurgelmir Orb +1",
    head="Flam. Zucchetto +2",
    body={name="Valorous Mail", augments={'Attack+29','"Dbl.Atk."+5','Accuracy+11'}},
    hands="Sulev. Gauntlets +2",
    legs="Ig. Flanchard +3",
    feet="Flam. Gambieras +2",
    neck="Abyssal Beads +2",
    waist="Ioskeha Belt +1",
    ear1="Brutal Earring",
    ear2="Balder Earring +1",
    ring1="Hetairoi Ring",
    ring2="Niqmaddu Ring",
	back=Ankou.DA} 
		
	sets.TP.Apocalypse.MidACC = set_combine(sets.TP.Apocalypse,{})
		
	sets.TP.Apocalypse.HighACC = set_combine(sets.TP.Apocalypse.MidACC,{})

	-- Apocalypse(AM Down: High Haste) TP Sets --
	sets.TP.Apocalypse.HighHaste = set_combine(sets.TP.Apocalypse,{waist="Windbuffet Belt +1",body="Dagon Breastplate",})
	sets.TP.Apocalypse.MidACC.HighHaste = set_combine(sets.TP.Apocalypse.MidACC,{waist="Windbuffet Belt +1",})
	sets.TP.Apocalypse.HighACC.HighHaste = set_combine(sets.TP.Apocalypse.HighACC,{waist="Windbuffet Belt +1",})
	
	-- Apocalypse(AM Down: SAM Roll) TP Sets --
	sets.TP.Apocalypse.STP = set_combine(sets.TP.Apocalypse,{neck="Ganesha's Mala",ear1="Brutal earring",})
	sets.TP.Apocalypse.MidACC.STP = set_combine(sets.TP.Apocalypse.MidACC,{neck="Ganesha's Mala",ring1="Regal Ring",})
	sets.TP.Apocalypse.HighACC.STP = set_combine(sets.TP.Apocalypse.HighACC,{ammo="Seething Bomblet",})
	
	-- Apocalypse(AM Down: High Haste + SAM Roll) TP Sets --
	sets.TP.Apocalypse.HighHaste.STP = set_combine(sets.TP.Apocalypse.STP,{waist="Windbuffet Belt +1",body="Dagon Breastplate",})
	sets.TP.Apocalypse.MidACC.HighHaste.STP = set_combine(sets.TP.Apocalypse.MidACC.STP,{waist="Windbuffet Belt +1",})
	sets.TP.Apocalypse.HighACC.HighHaste.STP = set_combine(sets.TP.Apocalypse.HighACC.STP,{waist="Windbuffet Belt +1",})
	
	-- Apocalypse(AM Up) TP Sets --
	sets.TP.Apocalypse.AM = set_combine(sets.TP.Apocalypse,{waist="Windbuffet Belt +1",})
	sets.TP.Apocalypse.MidACC.AM = set_combine(sets.TP.Apocalypse.MidACC,{waist="Windbuffet Belt +1",})
	sets.TP.Apocalypse.HighACC.AM = set_combine(sets.TP.Apocalypse.HighACC,{waist="Windbuffet Belt +1",})

	-- Apocalypse(AM Up: High Haste) TP Sets --
	sets.TP.Apocalypse.AM.HighHaste = set_combine(sets.TP.Apocalypse.AM,{waist="Windbuffet Belt +1",body="Dagon Breastplate",})
	sets.TP.Apocalypse.MidACC.AM.HighHaste = set_combine(sets.TP.Apocalypse.MidACC.AM,{waist="Windbuffet Belt +1",})
	sets.TP.Apocalypse.HighACC.AM.HighHaste = set_combine(sets.TP.Apocalypse.HighACC.AM,{waist="Windbuffet Belt +1",})

	-- Apocalypse(AM Up: SAM Roll) TP Sets --
	sets.TP.Apocalypse.AM.STP = set_combine(sets.TP.Apocalypse.AM,{neck="Ganesha's Mala",ear1="Brutal earring",})
	sets.TP.Apocalypse.MidACC.AM.STP = set_combine(sets.TP.Apocalypse.MidACC.AM,{neck="Ganesha's Mala",ring1="Regal Ring",})
	sets.TP.Apocalypse.HighACC.AM.STP = set_combine(sets.TP.Apocalypse.HighACC.AM,{ammo="Seething Bomblet",})

	-- Apocalypse(AM Up: High Haste + SAM Roll) TP Sets --
	sets.TP.Apocalypse.AM.HighHaste.STP = set_combine(sets.TP.Apocalypse.AM.STP,{waist="Windbuffet Belt +1",body="Dagon Breastplate",})
	sets.TP.Apocalypse.MidACC.AM.HighHaste.STP = set_combine(sets.TP.Apocalypse.MidACC.AM.STP,{waist="Windbuffet Belt +1",})
	sets.TP.Apocalypse.HighACC.AM.HighHaste.STP = set_combine(sets.TP.Apocalypse.HighACC.AM.STP,{waist="Windbuffet Belt +1",})

	------------ /sam sets --------------------------------
	
	-- Apocalypse(AM Down) /SAM TP Sets --
	sets.TP.Apocalypse.SAM = {main="Apocalypse",
	sub="Utu Grip",
    ammo="Aurgelmir Orb +1",
    head="Flam. Zucchetto +2",
    body="Dagon Breastplate",
    hands="Flamma Manopolas +2",
    legs="Ig. Flanchard +3",
    feet="Flam. Gambieras +2",
    neck="Abyssal Beads +2",
    waist="Sailfi Belt +1",
    ear1="Brutal Earring",
    ear2="Balder Earring +1",
    ring1="Hetairoi Ring",
    ring2="Niqmaddu Ring",
	back=Ankou.DA} 
		
	sets.TP.Apocalypse.SAM.MidACC = set_combine(sets.TP.Apocalypse.SAM,{})
		
	sets.TP.Apocalypse.SAM.HighACC = set_combine(sets.TP.Apocalypse.SAM.MidACC,{})

	-- Apocalypse(AM Down: High Haste) /SAM TP Sets --
	sets.TP.Apocalypse.SAM.HighHaste = set_combine(sets.TP.Apocalypse.SAM,{waist="Windbuffet Belt +1",body="Dagon Breastplate",})
	sets.TP.Apocalypse.SAM.MidACC.HighHaste = set_combine(sets.TP.Apocalypse.SAM.MidACC,{waist="Windbuffet Belt +1",})
	sets.TP.Apocalypse.SAM.HighACC.HighHaste = set_combine(sets.TP.Apocalypse.SAM.HighACC,{waist="Windbuffet Belt +1",})

	-- Apocalypse(AM Down: SAM Roll) /SAM TP Sets --
	sets.TP.Apocalypse.SAM.STP = set_combine(sets.TP.Apocalypse.SAM,{main="Apocalypse",
	sub="Utu Grip",
    ammo="Aurgelmir Orb +1",
    head="Flam. Zucchetto +2",
    body="Dagon Breastplate",
    hands="Flamma Manopolas +2",
    legs="Ig. Flanchard +3",
    feet="Flam. Gambieras +2",
    neck="Abyssal Beads +2",
    waist="Sailfi Belt +1",
    ear1="Brutal Earring",
    ear2="Balder Earring +1",
    ring1="Hetairoi Ring",
    ring2="Niqmaddu Ring",
	back=Ankou.DA})
	
	sets.TP.Apocalypse.SAM.MidACC.STP = set_combine(sets.TP.Apocalypse.SAM.MidACC,{neck="Ganesha's Mala",ring1="Regal Ring",})
	sets.TP.Apocalypse.SAM.HighACC.STP = set_combine(sets.TP.Apocalypse.SAM.HighACC,{ammo="Seething Bomblet",})
	
	-- Apocalypse(AM Down: High Haste + SAM Roll) /SAM TP Sets --
	sets.TP.Apocalypse.SAM.HighHaste.STP = set_combine(sets.TP.Apocalypse.SAM.STP,{body="Dagon Breastplate",waist="Windbuffet Belt +1"})
	sets.TP.Apocalypse.SAM.MidACC.HighHaste.STP = set_combine(sets.TP.Apocalypse.SAM.MidACC.STP,{waist="Windbuffet Belt +1",})
	sets.TP.Apocalypse.SAM.HighACC.HighHaste.STP = set_combine(sets.TP.Apocalypse.SAM.HighACC.STP,{waist="Windbuffet Belt +1",})
	
	-- Apocalypse(AM Up) /SAM TP Sets --
	sets.TP.Apocalypse.SAM.AM = set_combine(sets.TP.Apocalypse.SAM,{main="Apocalypse",
	sub="Utu Grip",
    ammo="Aurgelmir Orb +1",
    head="Flam. Zucchetto +2",
    body="Dagon Breastplate",
    hands="Flamma Manopolas +2",
    legs="Ig. Flanchard +3",
    feet="Flam. Gambieras +2",
    neck="Abyssal Beads +2",
    waist="Sailfi Belt +1",
    ear1="Brutal Earring",
    ear2="Balder Earring +1",
    ring1="Hetairoi Ring",
    ring2="Niqmaddu Ring",
	back=Ankou.DA})
	
	sets.TP.Apocalypse.SAM.MidACC.AM = set_combine(sets.TP.Apocalypse.SAM.AM,{})
	sets.TP.Apocalypse.SAM.HighACC.AM = set_combine(sets.TP.Apocalypse.SAM.MidACC.AM,{})

	-- Apocalypse(AM Up: High Haste) /SAM TP Sets --
	sets.TP.Apocalypse.SAM.AM.HighHaste = set_combine(sets.TP.Apocalypse.SAM.AM,{waist="Windbuffet Belt +1",body="Dagon Breastplate",})
	sets.TP.Apocalypse.SAM.MidACC.AM.HighHaste = set_combine(sets.TP.Apocalypse.SAM.MidACC.AM,{waist="Windbuffet Belt +1",})
	sets.TP.Apocalypse.SAM.HighACC.AM.HighHaste = set_combine(sets.TP.Apocalypse.SAM.HighACC.AM,{waist="Windbuffet Belt +1",})

	-- Apocalypse(AM Up: SAM Roll) /SAM TP Sets --
	sets.TP.Apocalypse.SAM.AM.STP = set_combine(sets.TP.Apocalypse.SAM.AM,{})
	sets.TP.Apocalypse.SAM.MidACC.AM.STP = set_combine(sets.TP.Apocalypse.SAM.MidACC.AM,{})
	sets.TP.Apocalypse.SAM.HighACC.AM.STP = set_combine(sets.TP.Apocalypse.SAM.HighACC.AM,{})

	-- Apocalypse(AM Up: High Haste + SAM Roll) /SAM TP Sets --
	sets.TP.Apocalypse.SAM.AM.HighHaste.STP = set_combine(sets.TP.Apocalypse.SAM.AM.STP,{body="Dagon Breastplate",waist="Windbuffet Belt +1",})
	sets.TP.Apocalypse.SAM.MidACC.AM.HighHaste.STP = set_combine(sets.TP.Apocalypse.SAM.MidACC.AM.STP,{waist="Windbuffet Belt +1",})
	sets.TP.Apocalypse.SAM.HighACC.AM.HighHaste.STP = set_combine(sets.TP.Apocalypse.SAM.HighACC.AM.STP,{waist="Windbuffet Belt +1",})

-------------------------------------------------------------------------------------------------------------------------------------------------------------------	
---------------------------------------------------------------- CALADBOLG SETS -----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------	
	
	-- Caladbolg(AM Down) TP Sets --
	sets.TP.Caladbolg = {main="Caladbolg"} 
		
	sets.TP.Caladbolg.MidACC = set_combine(sets.TP.Caladbolg,{}) 
		
	sets.TP.Caladbolg.HighACC = set_combine(sets.TP.Caladbolg.MidACC,{})
		
	-- Caladbolg(AM Down: High Haste) TP Sets --
	sets.TP.Caladbolg.HighHaste = set_combine(sets.TP.Caladbolg,{body="Dagon Breastplate",waist="Windbuffet Belt +1",})
	sets.TP.Caladbolg.MidACC.HighHaste = set_combine(sets.TP.Caladbolg.MidACC,{waist="Windbuffet Belt +1",})
	sets.TP.Caladbolg.HighACC.HighHaste = set_combine(sets.TP.Caladbolg.HighACC,{waist="Kentarch Belt +1",})

	-- Caladbolg(AM Down: SAM Roll) TP Sets --
	sets.TP.Caladbolg.STP = set_combine(sets.TP.Caladbolg,{sub="Utu Grip",
    ammo="Aurgelmir Orb +1",
    head="Flam. Zucchetto +2",
    body={name="Valorous Mail", augments={'Attack+29','"Dbl.Atk."+5','Accuracy+11'}},
    hands="Sulev. Gauntlets +2",
    legs="Ig. Flanchard +3",
    feet="Flam. Gambieras +2",
    neck="Abyssal Beads +2",
    waist="Ioskeha Belt +1",
    ear1="Brutal Earring",
    ear2="Balder Earring +1",
    ring1="Hetairoi Ring",
    ring2="Niqmaddu Ring",
	back=Ankou.DA})
	
	sets.TP.Caladbolg.MidACC.STP = set_combine(sets.TP.Caladbolg.MidACC,{})
	sets.TP.Caladbolg.HighACC.STP = set_combine(sets.TP.Caladbolg.HighACC,{})

	-- Caladbolg(AM Down: High Haste + SAM Roll) TP Sets --
	sets.TP.Caladbolg.HighHaste.STP = set_combine(sets.TP.Caladbolg.STP,{body="Dagon Breastplate",waist="Windbuffet Belt +1",})
	sets.TP.Caladbolg.MidACC.HighHaste.STP = set_combine(sets.TP.Caladbolg.MidACC.STP,{waist="Windbuffet Belt +1",})
	sets.TP.Caladbolg.HighACC.HighHaste.STP = set_combine(sets.TP.Caladbolg.HighACC.STP,{waist="Windbuffet Belt +1",})
	
	-- Caladbolg(AM Up) TP Sets --
	sets.TP.Caladbolg.AM = set_combine(sets.TP.Caladbolg,{
	sub="Utu Grip",
    ammo="Aurgelmir Orb +1",
    head="Flam. Zucchetto +2",
    body={name="Valorous Mail", augments={'Attack+29','"Dbl.Atk."+5','Accuracy+11'}},
    hands="Sulev. Gauntlets +2",
    legs="Ig. Flanchard +3",
    feet="Flam. Gambieras +2",
    neck="Abyssal Beads +2",
    waist="Ioskeha Belt +1",
    ear1="Brutal Earring",
    ear2="Balder Earring +1",
    ring1="Hetairoi Ring",
    ring2="Niqmaddu Ring",
	back=Ankou.DA})
		
	sets.TP.Caladbolg.MidACC.AM = set_combine(sets.TP.Caladbolg.AM,{}) 
		
	sets.TP.Caladbolg.HighACC.AM = set_combine(sets.TP.Caladbolg.MidACC.AM,{})

	-- Caladbolg(AM Up: High Haste) TP Sets --
	sets.TP.Caladbolg.AM.HighHaste = set_combine(sets.TP.Caladbolg.AM,{body="Dagon Breastplate",waist="Windbuffet Belt +1",})
	sets.TP.Caladbolg.MidACC.AM.HighHaste = set_combine(sets.TP.Caladbolg.AM.MidACC,{waist="Windbuffet Belt +1",})
	sets.TP.Caladbolg.HighACC.AM.HighHaste = set_combine(sets.TP.Caladbolg.HighACC.AM,{waist="Kentarch Belt +1",})

	-- Caladbolg(AM Up: SAM Roll) TP Sets --
	sets.TP.Caladbolg.AM.STP = set_combine(sets.TP.Caladbolg.STP,{})
	sets.TP.Caladbolg.MidACC.AM.STP = set_combine(sets.TP.Caladbolg.MidACC.AM,{})
	sets.TP.Caladbolg.HighACC.AM.STP = set_combine(sets.TP.Caladbolg.HighACC.AM,{})

	-- Caladbolg(AM Up: High Haste + SAM Roll) TP Sets --
	sets.TP.Caladbolg.AM.HighHaste.STP = set_combine(sets.TP.Caladbolg.HighHaste.STP,{body="Dagon Breastplate",waist="Windbuffet Belt +1",})
	sets.TP.Caladbolg.MidACC.AM.HighHaste.STP = set_combine(sets.TP.Caladbolg.MidACC.STP,{waist="Windbuffet Belt +1",})
	sets.TP.Caladbolg.HighACC.AM.HighHaste.STP = set_combine(sets.TP.Caladbolg.HighACC.STP,{waist="Windbuffet Belt +1",})
	
	
	-- Caladbolg /SAM TP Sets -------------------------------------------------------------------

	-- Caladbolg(AM Down) TP Sets --  /SAM
	--[ACC: 1150 STP: 61]--
	sets.TP.Caladbolg.SAM = {main="Caladbolg",
	sub="Utu Grip",
    ammo="Aurgelmir Orb +1",
    head="Flam. Zucchetto +2",
    body="Dagon Breastplate",
    hands="Flamma Manopolas +2",
    legs="Ig. Flanchard +3",
    feet="Flam. Gambieras +2",
    neck="Abyssal Beads +2",
    waist="Sailfi Belt +1",
    ear1="Brutal Earring",
    ear2="Balder Earring +1",
    ring1="Hetairoi Ring",
    ring2="Niqmaddu Ring",
	back=Ankou.DA} 

	sets.TP.Caladbolg.SAM.MidACC = set_combine(sets.TP.Caladbolg.SAM,{}) 	
	sets.TP.Caladbolg.SAM.HighACC = set_combine(sets.TP.Caladbolg.SAM.MidACC,{})

	-- Caladbolg(AM Down: High Haste) TP Sets -- /SAM
	sets.TP.Caladbolg.SAM.HighHaste = set_combine(sets.TP.Caladbolg.SAM,{body="Dagon Breastplate",waist="Windbuffet Belt +1",})
	sets.TP.Caladbolg.SAM.MidACC.HighHaste = set_combine(sets.TP.Caladbolg.SAM.MidACC,{waist="Windbuffet Belt +1",})
	sets.TP.Caladbolg.SAM.HighACC.HighHaste = set_combine(sets.TP.Caladbolg.SAM.HighACC,{waist="Kentarch Belt +1",})
	
	-- Caladbolg(AM Down: SAM Roll) TP Sets -- /SAM
	sets.TP.Caladbolg.SAM.STP = set_combine(sets.TP.Caladbolg.SAM,{})
	sets.TP.Caladbolg.SAM.MidACC.STP = set_combine(sets.TP.Caladbolg.SAM.MidACC,{})
	sets.TP.Caladbolg.SAM.HighACC.STP = set_combine(sets.TP.Caladbolg.SAM.HighACC,{})

	-- Caladbolg(AM Down: High Haste + SAM Roll) TP Sets -- /SAM
	sets.TP.Caladbolg.SAM.HighHaste.STP = set_combine(sets.TP.Caladbolg.SAM.STP,{body="Dagon Breastplate",waist="Windbuffet Belt +1",})
	sets.TP.Caladbolg.SAM.MidACC.HighHaste.STP = set_combine(sets.TP.Caladbolg.SAM.MidACC.STP,{waist="Windbuffet Belt +1",})
	sets.TP.Caladbolg.SAM.HighACC.HighHaste.STP = set_combine(sets.TP.Caladbolg.SAM.HighACC.STP,{waist="Windbuffet Belt +1",})
	
	-- Caladbolg(AM Up) TP Sets -- /SAM
	sets.TP.Caladbolg.SAM.AM = set_combine(sets.TP.Caladbolg.SAM,{
	sub="Utu Grip",
    ammo="Aurgelmir Orb +1",
    head="Flam. Zucchetto +2",
    body="Dagon Breastplate",
    hands="Flamma Manopolas +2",
    legs="Ig. Flanchard +3",
    feet="Flam. Gambieras +2",
    neck="Abyssal Beads +2",
    waist="Sailfi Belt +1",
    ear1="Brutal Earring",
    ear2="Balder Earring +1",
    ring1="Hetairoi Ring",
    ring2="Niqmaddu Ring",
	back=Ankou.DA})		
	
	sets.TP.Caladbolg.SAM.MidACC.AM = set_combine(sets.TP.Caladbolg.SAM.AM,{}) 	
	sets.TP.Caladbolg.SAM.HighACC.AM = set_combine(sets.TP.Caladbolg.SAM.MidACC.AM,{})
	
	-- Caladbolg(AM Up: High Haste) TP Sets -- /SAM
	sets.TP.Caladbolg.SAM.AM.HighHaste = set_combine(sets.TP.Caladbolg.SAM.AM,{ammo="Yetshila +1",ring1="Hetairoi Ring",waist="Windbuffet Belt +1",})
	sets.TP.Caladbolg.SAM.MidACC.AM.HighHaste = set_combine(sets.TP.Caladbolg.SAM.MidACC.AM,{waist="Windbuffet Belt +1",})
	sets.TP.Caladbolg.SAM.HighACC.AM.HighHaste = set_combine(sets.TP.Caladbolg.SAM.HighACC.AM,{waist="Kentarch Belt +1",})

	-- Caladbolg(AM Up: SAM Roll) TP Sets -- /SAM
	sets.TP.Caladbolg.SAM.AM.STP = set_combine(sets.TP.Caladbolg.SAM.STP,{ammo="Yetshila +1",ring1="Hetairoi Ring"})
	sets.TP.Caladbolg.SAM.MidACC.AM.STP = set_combine(sets.TP.Caladbolg.SAM.MidACC.AM,{})
	sets.TP.Caladbolg.SAM.HighACC.AM.STP = set_combine(sets.TP.Caladbolg.SAM.HighACC.AM,{})

	-- Caladbolg(AM Up: High Haste + SAM Roll) TP Sets --
	sets.TP.Caladbolg.SAM.AM.HighHaste.STP = set_combine(sets.TP.Caladbolg.SAM.HighHaste.STP,{waist="Windbuffet Belt +1",})
	sets.TP.Caladbolg.SAM.MidACC.AM.HighHaste.STP = set_combine(sets.TP.Caladbolg.SAM.MidACC.STP,{waist="Windbuffet Belt +1",})
	sets.TP.Caladbolg.SAM.HighACC.AM.HighHaste.STP = set_combine(sets.TP.Caladbolg.SAM.HighACC.STP,{waist="Windbuffet Belt +1",})

-------------------------------------------------------------------------------------------------------------------------------------------------------------------	
---------------------------------------------------------------- ANGUTA SETS -----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------		

	-- Anguta TP Sets --
	sets.TP.Anguta = {main="Anguta",
	sub="Utu Grip",
    ammo="Aurgelmir Orb +1",
    head="Flam. Zucchetto +2",
    body={name="Valorous Mail",augments={'Accuracy+17 Attack+17','"Store TP"+7','DEX+6','Accuracy+7'}},
    hands="Flamma Manopolas +2",
    legs="Ig. Flanchard +3",
    feet="Flam. Gambieras +2",
    neck="Abyssal Beads +2",
    waist="Sailfi Belt +1",
    ear1="Telos Earring",
    ear2="Balder Earring +1",
    ring1="Flamma Ring",
    ring2="Niqmaddu Ring",
	back=Ankou.DA}
	
	sets.TP.Anguta.MidACC = set_combine(sets.TP.Anguta,{})
	sets.TP.Anguta.HighACC = set_combine(sets.TP.Anguta.MidACC,{})

	-- Anguta(High Haste) TP Sets --
	sets.TP.Anguta.HighHaste = set_combine(sets.TP.Anguta,{})
	sets.TP.Anguta.MidACC.HighHaste = set_combine(sets.TP.Anguta.MidACC,{})
	sets.TP.Anguta.HighACC.HighHaste = set_combine(sets.TP.Anguta.HighACC,{})

	-- Anguta(SAM Roll) TP Sets --
	sets.TP.Anguta.STP = set_combine(sets.TP.Anguta,{})
	sets.TP.Anguta.MidACC.STP = set_combine(sets.TP.Anguta.MidACC,{})
	sets.TP.Anguta.HighACC.STP = set_combine(sets.TP.Anguta.HighACC,{})

	-- Anguta(High Haste + SAM Roll) TP Sets --
	sets.TP.Anguta.HighHaste.STP = set_combine(sets.TP.Anguta.STP,{})
	sets.TP.Anguta.MidACC.HighHaste.STP = set_combine(sets.TP.Anguta.MidACC.STP,{})
	sets.TP.Anguta.HighACC.HighHaste.STP = set_combine(sets.TP.Anguta.HighACC.STP,{})

	----------------- /sam sets -----------------------------
	
	-- Anguta /SAM TP Sets --
	sets.TP.Anguta.SAM = {main="Anguta",
	sub="Utu Grip",
    ammo="Seething Bomblet +1",
    head="Hjarrandi Helm",
    body="Hjarrandi Breastplate",
    hands="Flamma Manopolas +2",
    legs="Ig. Flanchard +3",
    feet="Flam. Gambieras +2",
    neck="Abyssal Beads +2",
    waist="Sailfi Belt +1",
    ear1="Odnowa Earring +1",
    ear2="Brutal Earring",
    ring1="Moonlight Ring",
    ring2="Moonlight Ring",
	back=Ankou.DA}
		
	sets.TP.Anguta.SAM.MidACC = set_combine(sets.TP.Anguta.SAM,{})
		
	sets.TP.Anguta.SAM.HighACC = set_combine(sets.TP.Anguta.SAM.MidACC,{})

	-- Anguta(High Haste) /SAM TP Sets --
	sets.TP.Anguta.SAM.HighHaste = set_combine(sets.TP.Anguta.SAM,{ammo="Aurgelmir Orb +1",hands="Sulev. Gauntlets +2"})
	sets.TP.Anguta.SAM.MidACC.HighHaste = set_combine(sets.TP.Anguta.SAM.MidACC,{})
	sets.TP.Anguta.SAM.HighACC.HighHaste = set_combine(sets.TP.Anguta.SAM.HighACC,{})

	-- Anguta(SAM Roll) /SAM TP Sets --
	sets.TP.Anguta.SAM.STP = set_combine(sets.TP.Anguta.SAM,{main="Anguta",
	sub="Utu Grip",
    ammo="Seething Bomblet +1",
    head="Hjarrandi Helm",
    body="Hjarrandi Breastplate",
    hands="Flamma Manopolas +2",
    legs="Ig. Flanchard +3",
    feet="Flam. Gambieras +2",
    neck="Abyssal Beads +2",
    waist="Sailfi Belt +1",
    ear1="Odnowa Earring +1",
    ear2="Brutal Earring",
    ring1="Moonlight Ring",
    ring2="Moonlight Ring",
	back=Ankou.DA})
		
	sets.TP.Anguta.SAM.MidACC.STP = set_combine(sets.TP.Anguta.SAM.MidACC,{})
		
	sets.TP.Anguta.SAM.HighACC.STP = set_combine(sets.TP.Anguta.SAM.HighACC,{})

	-- Anguta(High Haste + SAM Roll) /SAM TP Sets --
	sets.TP.Anguta.SAM.HighHaste.STP = set_combine(sets.TP.Anguta.SAM.STP,{ammo="Aurgelmir Orb +1",hands="Sulev. Gauntlets +2"})
	sets.TP.Anguta.SAM.MidACC.HighHaste.STP = set_combine(sets.TP.Anguta.SAM.MidACC.STP,{})
	sets.TP.Anguta.SAM.HighACC.HighHaste.STP = set_combine(sets.TP.Anguta.SAM.HighACC.STP,{})
	
-------------------------------------------------------------------------------------------------------------------------------------------------------------------	
---------------------------------------------------------------- Lycurgos SETS -----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------		

	sets.TP.Lycurgos = {main="Lycurgos",
	sub="Utu Grip",
    ammo="Aurgelmir Orb +1",
    head="Flam. Zucchetto +2",
    body="Dagon Breastplate",
    hands="Flamma Manopolas +2",
    legs="Ig. Flanchard +3",
    feet="Flam. Gambieras +2",
    neck="Abyssal Beads +2",
    waist="Sailfi Belt +1",
    ear1="Brutal Earring",
    ear2="Balder Earring +1",
    ring1="Hetairoi Ring",
    ring2="Niqmaddu Ring",
	back=Ankou.DA}
	
	sets.TP.Lycurgos.MidACC = set_combine(sets.TP.Lycurgos,{})
	sets.TP.Lycurgos.HighACC = set_combine(sets.TP.Lycurgos.MidACC,{})


	sets.TP.Lycurgos.HighHaste = set_combine(sets.TP.Lycurgos,{body="Dagon Breastplate",waist="Windbuffet Belt +1"})
	sets.TP.Lycurgos.MidACC.HighHaste = set_combine(sets.TP.Lycurgos.MidACC,{})
	sets.TP.Lycurgos.HighACC.HighHaste = set_combine(sets.TP.Lycurgos.HighACC,{})

	sets.TP.Lycurgos.STP = set_combine(sets.TP.Lycurgos,{})
	sets.TP.Lycurgos.MidACC.STP = set_combine(sets.TP.Lycurgos.MidACC,{})
	sets.TP.Lycurgos.HighACC.STP = set_combine(sets.TP.Lycurgos.HighACC,{})

	-- Lycurgos(High Haste + SAM Roll) TP Sets --
	sets.TP.Lycurgos.HighHaste.STP = set_combine(sets.TP.Lycurgos.STP,{body="Dagon Breastplate",waist="Windbuffet Belt +1"})
	sets.TP.Lycurgos.MidACC.HighHaste.STP = set_combine(sets.TP.Lycurgos.MidACC.STP,{})
	sets.TP.Lycurgos.HighACC.HighHaste.STP = set_combine(sets.TP.Lycurgos.HighACC.STP,{})

	----------------- /sam sets -----------------------------
	
	-- Lycurgos /SAM TP Sets --
	sets.TP.Lycurgos.SAM = {main="Lycurgos",
	sub="Utu Grip",
    ammo="Aurgelmir Orb +1",
    head="Flam. Zucchetto +2",
    body="Dagon Breastplate",
    hands="Flamma Manopolas +2",
    legs="Ig. Flanchard +3",
    feet="Flam. Gambieras +2",
    neck="Abyssal Beads +2",
    waist="Sailfi Belt +1",
    ear1="Brutal Earring",
    ear2="Balder Earring +1",
    ring1="Hetairoi Ring",
    ring2="Niqmaddu Ring",
	back=Ankou.DA}
		
	sets.TP.Lycurgos.SAM.MidACC = set_combine(sets.TP.Lycurgos.SAM,{})
		
	sets.TP.Lycurgos.SAM.HighACC = set_combine(sets.TP.Lycurgos.SAM.MidACC,{})

	-- Lycurgos(High Haste) /SAM TP Sets --
	sets.TP.Lycurgos.SAM.HighHaste = set_combine(sets.TP.Lycurgos.SAM,{body="Dagon Breastplate",waist="Windbuffet Belt +1"})
	sets.TP.Lycurgos.SAM.MidACC.HighHaste = set_combine(sets.TP.Lycurgos.SAM.MidACC,{})
	sets.TP.Lycurgos.SAM.HighACC.HighHaste = set_combine(sets.TP.Lycurgos.SAM.HighACC,{})

	-- Lycurgos(SAM Roll) /SAM TP Sets --
	sets.TP.Lycurgos.SAM.STP = set_combine(sets.TP.Lycurgos.SAM,{})
		
	sets.TP.Lycurgos.SAM.MidACC.STP = set_combine(sets.TP.Lycurgos.SAM.MidACC,{})
		
	sets.TP.Lycurgos.SAM.HighACC.STP = set_combine(sets.TP.Lycurgos.SAM.HighACC,{})

	-- Lycurgos(High Haste + SAM Roll) /SAM TP Sets --
	sets.TP.Lycurgos.SAM.HighHaste.STP = set_combine(sets.TP.Lycurgos.SAM.STP,{body="Dagon Breastplate",waist="Windbuffet Belt +1"})
	sets.TP.Lycurgos.SAM.MidACC.HighHaste.STP = set_combine(sets.TP.Lycurgos.SAM.MidACC.STP,{})
	sets.TP.Lycurgos.SAM.HighACC.HighHaste.STP = set_combine(sets.TP.Lycurgos.SAM.HighACC.STP,{})
	
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------

	-- PDT/MDT Sets --
	sets.PDT = {
	sub="Utu Grip",
    ammo="Seething Bomblet +1",
    head="Hjarrandi Helm",
    body="Hjarrandi Breastplate",
    hands="Flamma Manopolas +2",
    legs="Ig. Flanchard +3",
    feet="Flam. Gambieras +2",
    neck="Abyssal Beads +2",
    waist="Sailfi Belt +1",
    ear1="Odnowa Earring +1",
    ear2="Brutal Earring",
    ring1="Moonlight Ring",
    ring2="Moonlight Ring",
	back=Ankou.DA}
		
		-- all these specialize PDT sets seems to not be working
	sets.PDT.Liberator = set_combine(sets.PDT,{main="Liberator"})
		
	sets.PDT.Anguta = set_combine(sets.PDT,{main="Anguta"})
		
	sets.PDT.Caladbolg = set_combine(sets.PDT,{main="Caladbolg"})
		
	sets.PDT.Apocalypse = set_combine(sets.PDT,{main="Apocalypse"})
	
	sets.PDT.Redemption = set_combine(sets.PDT,{main="Redemption"})
	
	sets.PDT.Lycurgos = set_combine(sets.PDT,{main="Lycurgos"})
		
	sets.MDT = set_combine(sets.PDT,{
	ammo="Staunch Tathlum +1",
	head="Volte Salade",
	body="Sacro Breastplate",
	hands="Volte Moufles",
	legs="Volte Brayettes",
	feet="Volte Sollerets",
	waist="Ioskeha Belt +1"})
							
	sets.Scarlet = set_combine(sets.PDT,{})

	-- Hybrid Set --
	sets.TP.Hybrid = set_combine(sets.PDT,{
	sub="Utu Grip",
    ammo="Seething Bomblet +1",
    head="Hjarrandi Helm",
    body="Hjarrandi Breastplate",
    hands="Flamma Manopolas +2",
    legs="Ig. Flanchard +3",
    feet="Flam. Gambieras +2",
    neck="Abyssal Beads +2",
    waist="Sailfi Belt +1",
    ear1="Odnowa Earring +1",
    ear2="Brutal Earring",
    ring1="Moonlight Ring",
    ring2="Moonlight Ring",
	back=Ankou.DA})
		
	sets.TP.Hybrid.Liberator = set_combine(sets.TP.Hybrid,{main="Liberator",sub="Utu Grip",legs=OdysseanLegs.STP,back=Ankou.STP,ear2="Telos Earring"})
	sets.TP.Hybrid.Anguta = set_combine(sets.TP.Hybrid,{main="Anguta",sub="Utu Grip"})
	sets.TP.Hybrid.Caladbolg = set_combine(sets.TP.Hybrid,{main="Caladbolg",sub="Utu Grip"})
	sets.TP.Hybrid.Apocalypse = set_combine(sets.TP.Hybrid,{main="Apocalypse",sub="Utu Grip"})
	sets.TP.Hybrid.Anguta = set_combine(sets.TP.Hybrid,{main="Anguta",sub="Utu Grip"})
	sets.TP.Hybrid.Lycurgos = set_combine(sets.TP.Hybrid,{main="Lycurgos",sub="Utu Grip"})
	sets.TP.Hybrid.Redemption = set_combine(sets.TP.Hybrid,{main="Redemption",sub="Utu Grip"})
	
	sets.TP.Hybrid.MidACC = set_combine(sets.TP.Hybrid,{})
		
	sets.TP.Hybrid.HighACC = set_combine(sets.TP.Hybrid.MidACC,{})

----------------------------------------------------------------------------------------------

	-- WS Base Set --
	sets.WS = {		
		ammo="Seething Bomblet +1",
		head="Flamma Zucchetto +2",
		body="Argosy Hauberk +1",
		hands="Argosy Mufflers +1",
		legs="Ignominy Flanchard +3",
		feet="Flamma Gambieras +2",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		ear1="Lugra Earring +1",
		ear2="Moonshade Earring",
		ring1="Regal Ring",
		ring2="Niqmaddu Ring",
		back=Ankou.WSDA}

	-- Resolution Sets --
	--Description:	Delivers a fivefold attack. Damage varies with TP.
	--Stat Modifier:	73~85% STR fTP:	0.71875	1.5	2.25
	sets.WS.Resolution = {		
		ammo="Seething Bomblet +1",
		head="Flamma Zucchetto +2",
		body="Argosy Hauberk +1",
		hands="Argosy Mufflers +1",
		legs="Ignominy Flanchard +3",
		feet="Flamma Gambieras +2",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		ear1="Lugra Earring +1",
		ear2="Moonshade Earring",
		ring1="Regal Ring",
		ring2="Niqmaddu Ring",
		back=Ankou.WSDA}
	
	sets.WS.Resolution.MidACC = set_combine(sets.WS.Resolution,{})
		
	sets.WS.Resolution.HighACC = set_combine(sets.WS.Resolution.MidACC,{})
	
	-- Torcleaver Sets --
	-- Description:	Deals triple damage. Damage varies with TP.
	-- Stat Modifier:	80% VIT fTP:	4.75	7.5	10
    sets.WS.Torcleaver = {		
		ammo="Knobkierrie",
		head="Odyssean Helm",
		body="Ignominy Cuirass +3",
		hands="Odyssean Gauntlets",
		legs="Fallen's Flanchard +3",
		feet="Sulevia's Leggings +2",
		neck="Abyssal Bead Necklace +2",
		waist="Fotia Belt",
		ear1="Thrud Earring",
		ear2="Moonshade earring",
		ring1="Gelatinous Ring +1",
		ring2="Niqmaddu Ring",
		back=Ankou.WSDVIT}
		
    sets.WS.Torcleaver.MidACC = set_combine(sets.WS.Torcleaver,{})
		
    sets.WS.Torcleaver.HighACC = set_combine(sets.WS.Torcleaver.MidACC,{})

	-- Scourge Sets --
	--Relic Aftermath: +5% Critical Hit Rate 15 acc
	--Stat Modifier:	40% STR / 40% VIT	fTP:	3.0
    sets.WS.Scourge = {}
		
    sets.WS.Scourge.MidACC = set_combine(sets.WS.Scourge,{})
		
	sets.WS.Scourge.HighACC = set_combine(sets.WS.Scourge.MidACC,{})	

    sets.WS.Shockwave = {
		ammo="Pemphredo Tathlum",
		head="Fallen's Burgeonet +3",
		body="Fallen's Cuirass +3",
		hands="Fallen's Finger Gauntlets +3",
		legs="Fallen's Flanchard +3",
		feet="Ignominy Sollerets +3",
		neck="Erra Pendant",
		waist="Orpheus's Sash",
		ear1="Malignance Earring",
		ear2="Telos Earring",
		ring1="Regal Ring",
		ring2="Niqmaddu Ring",
		back=Ankou.WSDINT}	

	-- Catastrophe Sets --
	--Stat Modifier:	40% STR / 40% INT	fTP:	2.75
	--Relic Aftermath: 10% Equipment Haste (+102/1024) AG 10% Ability
	sets.WS.Catastrophe = {
		ammo="Knobkierrie",
		head="Ratri Sallet +1",
		body="Ignominy Cuirass +3",
		hands="Ratri Gadlings +1",
		legs="Ratri Cuisses +1",
		feet="Ratri Sollerets +1",
		neck="Abyssal Bead Necklace +2",
		waist="Sailfi Belt +1",
		ear1="Thrud Earring",
		ear2="Lugra Earring +1",
		ring1="Epaminondas's Ring",
		ring2="Niqmaddu Ring",
		back=Ankou.WSDSTR}
		
	sets.WS.Catastrophe.MidACC = set_combine(sets.WS.Catastrophe,{})
		
	sets.WS.Catastrophe.HighACC = set_combine(sets.WS.Catastrophe.MidACC,{})

	-- Entropy Sets --
	--Delivers a fourfold attack. Converts some of the damage into MP. Damage varies with TP.
	--Stat Modifier:	73~85% INT fTP:	0.75	1.25	2.0
	sets.WS.Entropy = {
		ammo="Aurgelmir Orb +1",
		head="Hjarrandi Helm",
		body="Dagon Breastplate",
		hands="Sulevia's Gauntlets +2",
		legs="Ignominy Flanchard +3",
		feet="Flamma Gambieras +2",
		neck="Abyssal Bead Necklace +2",
		waist="Fotia Belt",
		ear2="Moonshade earring",
		ear1="Lugra earring +1",
		ring1="Metamorph Ring +1",
		ring2="Shiva Ring +1",
		back=Ankou.WSDINT}
		
	sets.WS.Entropy.MidACC = set_combine(sets.WS.Entropy,{})
		
	sets.WS.Entropy.HighACC = set_combine(sets.WS.Entropy.MidACC,{})
							
	-- CrossReaper Sets --
	--Delivers a two-hit attack. Damage varies with TP.
	--Stat Modifier:	60% STR / 60% MND fTP:	2.0	4.0	7.0
	sets.WS['Cross Reaper'] = {
		ammo="Knobkierrie",
		head="Ratri Sallet +1",
		body="Ignominy Cuirass +3",
		hands="Odyssean Gauntlets",
		legs="Ratri Cuisses +1",
		feet="Ratri Sollerets +1",
		neck="Abyssal Bead Necklace +2",
		waist="Sailfi Belt +1",
		ear2="Moonshade earring",
		ear1="Thrud earring",
		ring1="Regal Ring",
		ring2="Niqmaddu Ring",
		back=Ankou.WSDSTR}
		
	sets.WS['Cross Reaper'].MidACC = set_combine(sets.WS['Cross Reaper'],{})
		
	sets.WS['Cross Reaper'].HighACC = set_combine(sets.WS['Cross Reaper'].MidACC,{})							

	-- Insurgency Sets --
	--Delivers a fourfold attack. Damage varies with TP.
	--Stat Modifier:	20% STR / 20% INT fTP:	0.5	3.25	6.0
	sets.WS.Insurgency = {
		ammo="Knobkierrie",
		head="Ratri Sallet +1",
		body="Ignominy Cuirass +3",
		hands="Odyssean Gauntlets",
		legs="Ratri Cuisses +1",
		feet="Ratri Sollerets +1",
		neck="Abyssal Bead Necklace +2",
		waist="Fotia Belt",
		ear2="Moonshade earring",
		ear1="Thrud Earring",
		ring1="Regal Ring",
		ring2="Niqmaddu Ring",
		back=Ankou.WSDSTR}
		
	sets.WS.Insurgency.MidACC = set_combine(sets.WS.Insurgency,{})
		
	sets.WS.Insurgency.HighACC = set_combine(sets.WS.Insurgency.MidACC,{})
		
	-- Quietus Sets --
	--Delivers a triple damage attack that ignores target's defense. Amount ignored varies with TP.
	--Stat Modifier:	60% STR / 60% MND Defense ignored:	10%	30%	50% fTP:	3.0
	sets.WS.Quietus = {
		ammo="Knobkierrie",
		head="Ratri Sallet +1",
		body="Ignominy Cuirass +3",
		hands="Ratri Gadlings +1",
		legs="Ratri Cuisses +1",
		feet="Ratri Sollerets +1",
		neck="Abyssal Bead Necklace +2",
		waist="Sailfi Belt +1",
		ear2="Moonshade earring",
		ear1="Thrud Earring",
		ring1="Epaminondas's Ring",
		ring2="Niqmaddu Ring",
		back=Ankou.WSDSTR}

	sets.WS.Quietus.MidACC = set_combine(sets.WS.Quietus, {})
		
	sets.WS.Quietus.HighACC = set_combine(sets.WS.Quietus.MidACC, {})
	
	sets.WS['Savage Blade'] = {}

	sets.WS.Upheaval = {		
		ammo="Knobkierrie",
		head="Fallen's Burgeonet +3",
		body="Ignominy Cuirass +3",
		hands="Ignominy Gauntlets +3",
		legs="Fallen's Flanchard +3",
		feet="Sulevia's Leggings +2",
		neck="Abyssal Bead Necklace +2",
		waist="Ioskeha Belt +1",
		ear1="Thrud Earring",
		ear2="Moonshade earring",
		ring1="Regal Ring",
		ring2="Niqmaddu Ring",
		back=Ankou.WSDVIT}
		
	sets.WS['Steel Cyclone'] = {		
		ammo="Knobkierrie",
		head="Fallen's Burgeonet +3",
		body="Ignominy Cuirass +3",
		hands="Ignominy Gauntlets +3",
		legs="Fallen's Flanchard +3",
		feet="Sulevia's Leggings +2",
		neck="Abyssal Bead Necklace +2",
		waist="Ioskeha Belt +1",
		ear1="Thrud Earring",
		ear2="Moonshade earring",
		ring1="Regal Ring",
		ring2="Niqmaddu Ring",
		back=Ankou.WSDSTR}	

	sets.WS['Fell Cleave'] = {		
		ammo="Knobkierrie",
		head="Fallen's Burgeonet +3",
		body="Ignominy Cuirass +3",
		hands="Ignominy Gauntlets +3",
		legs="Fallen's Flanchard +3",
		feet="Sulevia's Leggings +2",
		neck="Abyssal Bead Necklace +2",
		waist="Ioskeha Belt +1",
		ear1="Thrud Earring",
		ear2="Moonshade earring",
		ring1="Regal Ring",
		ring2="Niqmaddu Ring",
		back=Ankou.WSDSTR}			
	
	-----------------------------------------------------------------------------------------------------------------
	-- works in motes based, not sure how to get it to work here
	sets.Item = {HolyWater}
	sets.Item['Holy Water'] = {ring1="Blenmot's Ring", ring2="Blenmot's Ring"}
	
	--react sets
	sets.Meva = {}
	
	sets.CurePotencyRecieved = {waist="Gishdubar sash", neck="Phalaina Locket", ring1="Kunaji Ring", hands="Buremte Gloves",}
	sets.PhalanxRecieved = {}
	sets.RefreshRecieved = {waist="Gishdubar sash",}
	sets.CursnaRecieved = {waist="Gishdubar sash", legs="Shabti Cuisses +1", ring1="Eshmun's Ring", ring2="Eshmun's Ring"}
	sets.ResistStun = set_combine(sets.Meva, {ear2="Arete del Luna", ear1="Hearty Earring", body="Onca Suit", })
	sets.ProShellRecieved = {ear1="Brachyura Earring",}
	sets.ResistTerror = set_combine(sets.Meva,{feet="Founder's Greaves"})
	
end

function pretarget(spell,action)
	if spell.action_type == 'Magic' and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
	elseif spell.english == "Berserk" and buffactive.Berserk then -- Change Berserk To Aggressor If Berserk Is On --
		cancel_spell()
		send_command('Aggressor')
	elseif spell.english == "Seigan" and buffactive.Seigan then -- Change Seigan To Third Eye If Seigan Is On --
		cancel_spell()
		send_command('ThirdEye')
	elseif spell.english == "Meditate" and player.tp > 2900 then -- Cancel Meditate If TP Is Above 2900 --
		cancel_spell()
		add_to_chat(123, spell.name .. ' Canceled: ['..player.tp..' TP]')
	elseif spell.type == "WeaponSkill" and spell.target.distance > target_distance and player.status == 'Engaged' then -- Cancel WS If You Are Out Of Range --
		cancel_spell()
		add_to_chat(123, spell.name..' Canceled: [Out of Range]')
		return
	end
end

function precast(spell,action)
	if spell.type == "WeaponSkill" then
			equipSet = sets.WS
			if equipSet[spell.english] then
				equipSet = equipSet[spell.english]
			end
			if equipSet[AccArray[AccIndex]] then
				equipSet = equipSet[AccArray[AccIndex]]
			end
			if buffactive['Reive Mark'] then -- Equip Ygnas's Resolve +1 During Reive --
				equipSet = set_combine(equipSet,{neck="Ygnas's Resolve +1"})
			end
			if (spell.english == "Entropy" or spell.english == "Resolution" or spell.english == "Insurgency") and (player.tp > 2990 or buffactive.Sekkanoki) then
				if world.time <= (7*60) or world.time >= (17*60) then 
					equipSet = set_combine(equipSet,{ear1="Lugra Earring +1"})
				else
					equipSet = set_combine(equipSet,{ear1="Thrud Earring"})
				end
			end
			equip(equipSet)
	elseif spell.type == "JobAbility" then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
	elseif spell.action_type == 'Magic' then
		if buffactive.silence or spell.target.distance > 16+target_distance then -- Cancel Magic or Ninjutsu If You Are Silenced or Out of Range --
			cancel_spell()
			add_to_chat(123, spell.name..' Canceled: [Silenced or Out of Casting Range]')
			return
		else
			if spell.english == 'Utsusemi: Ni' then
				if buffactive['Copy Image (3)'] then
					cancel_spell()
					add_to_chat(123, spell.name .. ' Canceled: [3 Images]')
					return
				else
					equip(sets.Precast.FastCast)
				end
			elseif sets.Precast[spell.skill] then
				equip(sets.Precast[spell.skill])
			else
				equip(sets.Precast.FastCast)
			end
		end
	elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
		cast_delay(0.2)
		send_command('cancel Sneak')
	end
	if Twilight == 'Twilight' then
		equip(sets.Twilight)
	end
end

function midcast(spell,action)
	equipSet = {}
	if spell.action_type == 'Magic' then
		equipSet = sets.Midcast
		if spell.english:startswith('Absorb') and spell.english ~= "Absorb-TP" then
			equipSet = sets.Midcast.Absorb
			if equipSet[MaccArray[MaccIndex]] then
				equipSet = equipSet[MaccArray[MaccIndex]]
			end
		elseif spell.english:startswith('Drain') or spell.english:startswith('Aspir') or spell.english:startswith('Bio') then
			if world.day == "Darksday" or world.weather_element == "Dark" then -- Equip Hachirin-no-Obi On Darksday or Dark Weather --
				equipSet = set_combine(equipSet,{waist="Hachirin-no-Obi"})
			end
			equipSet = 	sets.Midcast.Drain
		elseif spell.english == "Stoneskin" then
			if buffactive.Stoneskin then
				send_command('@wait 1.7;cancel stoneskin')
			end
			equipSet = equipSet.Stoneskin
		elseif spell.english == "Sneak" then
			if spell.target.name == player.name and buffactive['Sneak'] then
				send_command('cancel sneak')
			end
			equipSet = equipSet.Haste
		elseif spell.english:startswith('Utsusemi') then
			if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)']) then
				send_command('@wait 1.7;cancel Copy Image*')
			end
			equipSet = equipSet.Haste
		elseif spell.english == 'Monomi: Ichi' then
			if buffactive['Sneak'] then
				send_command('@wait 1.7;cancel sneak')
			end
			equipSet = equipSet.Haste
		else
			if equipSet[spell.english] then
				equipSet = equipSet[spell.english]
			end
			if equipSet[MaccArray[MaccIndex]] then
				equipSet = equipSet[MaccArray[MaccIndex]]
			end
			if equipSet[spell.skill] then
				equipSet = equipSet[spell.skill]
			end
			if equipSet[spell.type] then
				equipSet = equipSet[spell.type]
			end
		end
	elseif equipSet[spell.english] then
		equipSet = equipSet[spell.english]
	end
	if buffactive["Dark Seal"] and DarkSealIndex==0 then -- Equip Aug'd Fall. Burgonet +1 When You Have Dark Seal Up --
        equipSet = set_combine(equipSet,{head="Fallen's Burgeonet +3"})
    end
	if buffactive['Dark Seal'] and buffactive['Nether Void'] and S{"Drain II","Drain III"}:contains(spell.english) and player.tp<600 then
		equipSet = set_combine(equipSet,(sets.MAXDrain))
		add_to_chat(100,'WARNING: Father Time / Khonsu is on now *****')
	end
	equip(equipSet)
end

function aftercast(spell,action)

		if spell.type == "WeaponSkill" then
			send_command('wait 0.2;gs c TP')
		elseif spell.english == "Arcane Circle" then -- Arcane Circle Countdown --
			send_command('wait 260;input /echo '..spell.name..': [WEARING OFF IN 10 SEC.];wait 10;input /echo '..spell.name..': [OFF]')
		elseif spell.english == "Sleep II" then -- Sleep II Countdown --
			send_command('wait 60;input /echo Sleep Effect: [WEARING OFF IN 30 SEC.];wait 15;input /echo Sleep Effect: [WEARING OFF IN 15 SEC.];wait 10;input /echo Sleep Effect: [WEARING OFF IN 5 SEC.]')
		elseif spell.english == "Sleep" then -- Sleep Countdown --
			send_command('wait 30;input /echo Sleep Effect: [WEARING OFF IN 30 SEC.];wait 15;input /echo Sleep Effect: [WEARING OFF IN 15 SEC.];wait 10;input /echo Sleep Effect: [WEARING OFF IN 5 SEC.]')
		end
		status_change(player.status)
	end
	

function status_change(new,old)
	if Armor == 'PDT' then
		equip(sets.PDT)
	elseif Armor == 'MDT' then
		equip(sets.MDT)
	elseif Armor == 'Scarlet' then
		equip(sets.Scarlet)
	elseif new == 'Engaged' then
		equipSet = sets.TP
		if Armor == 'Hybrid' and equipSet["Hybrid"] then
			equipSet = equipSet["Hybrid"]
		end
		if equipSet[WeaponArray[WeaponIndex]] then
			equipSet = equipSet[WeaponArray[WeaponIndex]]
		end
		if equipSet[player.sub_job] then
			equipSet = equipSet[player.sub_job]
		end
		if equipSet[AccArray[AccIndex]] then
			equipSet = equipSet[AccArray[AccIndex]]
		end
	    if buffactive["Aftermath: Lv.3"] and equipSet["AM3"] then
    			if buffactive["Last Resort"] and ((buffactive.Haste and buffactive.March == 1) or (buffactive.Embrava and (buffactive.March == 1 or (buffactive.March and buffactive.Haste) or (buffactive.March and buffactive['Mighty Guard']) or (buffactive['Mighty Guard'] and buffactive.Haste))) or (buffactive[580] and (buffactive.March or buffactive.Haste or buffactive.Embrava or buffactive['Mighty Guard']))) and equipSet["HighHaste"] then
    				equipSet = equipSet["AM3_HighHaste"]
    			else 
    				equipSet = equipSet["AM3"]
    			end
    	end	
		if buffactive.Aftermath and equipSet["AM"] then
			equipSet = equipSet["AM"]
		end
		if buffactive["Last Resort"] and ((buffactive.Haste and buffactive.March == 1) or (buffactive.Embrava and (buffactive.March == 1 or (buffactive.March and buffactive.Haste) or (buffactive.March and buffactive['Mighty Guard']) or (buffactive['Mighty Guard'] and buffactive.Haste))) or (buffactive[580] and (buffactive.March or buffactive.Haste or buffactive.Embrava or buffactive['Mighty Guard']))) and equipSet["HighHaste"] then
			equipSet = equipSet["HighHaste"]
		end
		if buffactive["Samurai Roll"] and equipSet["STP"] and Samurai_Roll == 'ON' then
			equipSet = equipSet["STP"]
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
		if equipSet[player.sub_job] then
			equipSet = equipSet[player.sub_job]
		end
		if buffactive['Reive Mark'] then -- Equip Ygnas's Resolve +1 During Reive --
			equipSet = set_combine(equipSet,{neck="Ygnas's Resolve +1"})
		end
		if world.area:endswith('Adoulin') then
			equipSet = set_combine(equipSet,{body="Councilor's Garb"})
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
	elseif buff == 'weakness' then -- Weakness Timer --
		if gain then
			send_command('timers create "Weakness" 300 up')
		else
			send_command('timers delete "Weakness"')
		end
	end
	if buff == "sleep" and gain and player.hp > 200 and player.status == "Engaged" then -- Equip Berserker's Torque When You Are Asleep & Have 200+ HP --
		equip({neck="Vim Torque +1"})
	else
		if not midaction() then
			status_change(player.status)
		end
	end
end

-- In Game: //gs c (command), Macro: /console gs c (command), Bind: gs c (command) --
function self_command(command)
	if command == 'C1' then -- Accuracy Level Toggle --
		AccIndex = (AccIndex % #AccArray) + 1
		status_change(player.status)
		add_to_chat(158,'Accuracy Level: '..AccArray[AccIndex])
	elseif command == 'C17' then -- Main Weapon Toggle --
		WeaponIndex = (WeaponIndex % #WeaponArray) + 1
		add_to_chat(158,'Main Weapon: '..WeaponArray[WeaponIndex])
		status_change(player.status)
	elseif command == 'C14' then -- Macc Toggle --
		MaccIndex = (MaccIndex % #MaccArray) + 1
		add_to_chat(158,'Macc Level: '..MaccArray[MaccIndex])
		status_change(player.status)
	elseif command == 'C5' then -- Auto Update Gear Toggle --
		status_change(player.status)
		add_to_chat(158,'Auto Update Gear')
	elseif command == 'C2' then -- Hybrid Toggle --
		if Armor == 'Hybrid' then
			Armor = 'None'
			add_to_chat(123,'Hybrid Set: [Unlocked]')
		else
			Armor = 'Hybrid'
			add_to_chat(158,'Hybrid Set: '..AccArray[AccIndex])
		end
		status_change(player.status)
		elseif command == 'C10' then -- DarkSeal Toggle --
        if DarkSealIndex == 1 then
                        DarkSealIndex = 0
                        add_to_chat(158,'DarkSeal Duration: [On]')
        else
                        DarkSealIndex = 1
                        add_to_chat(158,'DarkSeal Potency: [On]')
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
	elseif command == 'C9' then -- Scarlet Toggle --
		if Armor == 'Scarlet' then
			Armor = 'None'
			add_to_chat(123,'Scarlet Set: [Unlocked]')
		else
			Armor = 'Scarlet'
			add_to_chat(158,'Scarlet Set: [Locked]')
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
	elseif command == 'C8' then -- Distance Toggle --
		if player.target.distance then
			target_distance = math.floor(player.target.distance*10)/10
			add_to_chat(158,'Distance: '..target_distance)
		else
			add_to_chat(123,'No Target Selected')
		end
	elseif command == 'C6' then -- Idle Toggle --
		IdleIndex = (IdleIndex % #IdleArray) + 1
		status_change(player.status)
		add_to_chat(158,'Idle Set: '..IdleArray[IdleIndex])
	elseif command == 'TP' then
		add_to_chat(158,'TP Return: ['..tostring(player.tp)..']')
	elseif command:match('^SC%d$') then
		send_command('//' .. sc_map[command])
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
		set_macro_page(1, 1)
	else
		set_macro_page(1, 1)
	end
end