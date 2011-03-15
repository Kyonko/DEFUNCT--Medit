--Mission Editor database of the universe.
--Made from http://www.vendetta-online.com/js/ed209.js
--Totally a pain in the ass to make.
medit.db = {}

medit.db.npc = {}
medit.db.npcgroup = {}
medit.db.npc_r = {}
medit.db.npcgroup_r = {}

medit.db.action = {
	skipstage = {
		"Jump to stage",
		["Jump to stage"] = { 
			stage = 'text'
		}
	},
	msg = {
		"Write to mission log...",
		["Write to mission log..."] = {
			msg = 'multiline',
		}
	},
	hudmsg = { 
		"Send message to player's HUD...",
		["Send message to player's HUD..."] = {
			msg = 'longtext', 
			["Fade out after (seconds)"] = {
				_type = 'label',
				seconds = 'text'
			}
		}
	},
	npcmsg = {
		"Send message from NPC...",
		["Send message from NPC..."] = {
			from = 'npc', 
			msg = 'longtext',
		}
	},
	makenpc = {
		"Spawn NPC...",
		["Spawn NPC..."] = {
		 	npctype = 'npctype', 
			faction = 'faction',
			spawn = 'spawntype',
			action = 'npcaction'
		},
		npc_ = 'character'
	},
	makenpcs = {
		"Spawn NPC group...",
		["Spawn NPC group..."] = {
		 	nbots = 'text',
			npctype = 'npctype', 
			faction = 'faction',
			spawn = 'spawntype',
			action = 'npcaction'
		},
		npcgroup_ = 'chargroup'
	},
	alternpc = {
		"Change NPC action...",
		["Change NPC action..."] = {
			npc = 'npc', 
			action = 'npcaction',
		}
	},
	alternpcgroup = {
		"Change NPC group action...",
		["Change NPC group action..."] = {
			group = 'npcgroup', 
			action = 'npcaction',
		}
	},
	setnav = {
		"Set Nav route to...",
		["Set Nav route to..."] = {
			dest = 'sector'
		}
	},
	setaccom = {
		"Set accomplishment flag...",
		["Set accomplishment flag..."] = {
			accom = 'longtext', 
			value = 'text',
		}
	},
	removeaccom = {
		"Remove accomplishment flag...",
		["Remove accomplishment flag..."] = {
			accom = 'longtext',
		}
	},
	incaccom = {
		"Increment accomplishment flag...",
		["Increment accomplishment flag..."] = {
			accom = 'longtext'
		}
	},
	decaccom = { 
		"Decrement accomplishment flag...",
		["Decrement accomplishment flag..."] = {
			accom = 'longtext'
		}
	},
	starttimer = {
		"Start timer...",
		["Start timer..."] = {
		 	when = 'time',
			clock = 'checkbox',
			a = 'action'
		},
		timer_ = 'timer'
	},
	killtimer = {
		"Kill a timer...",
		["Kill a timer..."] = {
			timer = 'timer',
		}
	},
	wait = {
		"Wait, then do remaining actions",
		["Wait, then do remaining actions"] = {
			when = 'time'
		}
	},
	givexp = {
		"Give skill points...",
		["Give skill points..."] = {
			skill = 'licensetype', 
			amount = 'text',
		}
	},
	givemoney = {
		"Give money...",
		["Give money..."] = {
			amount = 'text',
		}
	},
	givestanding = {
		"+/- faction standing...",
		["+/- faction standing..."] = {
			faction = 'faction',
			amount = 'text'
		}
	},
	giveitem = {
		"Give item...",
		["Give item..."] = {
			item = 'itemtype',
			qty = 'text',
		}
	},
	fail = "Fail the mission",
	win = "Complete the mission"
}

medit.db.time = {
	mmss = {
		"MM:SS...",
		["MM:SS..."] = {
			mmss = 'text',
		}
	},
	timer = {
		"Time left on timer...",
		["Time left on timer..."] = {
			timer = 'timer'
		}
	}
}

medit.db.time_r = {
	["MM:SS..."] = "mmss",
	["Time left on timer..."] = "timer"
}

medit.db.action_r = {
	["Jump to stage"] = "skipstage",
	["Write to mission log..."] = "msg",
	["Send message to player's HUD..."] = "hudmsg",
	["Send message from NPC..."] = "npcmsg",
	["Spawn NPC..."] = "makenpc",
	["Spawn NPC group..."] = "makenpcs",
	["Change NPC action..."] = "alternpc",
	["Change NPC group action..."] = "alternpcgroup",
	["Set Nav route to..."] = "setnav",
	["Set accomplishment flag..."] = "setaccom",
	["Remove accomplishment flag..."] = "removeaccom",
	["Increment accomplishment flag..."] = "incaccom",
	["Decrement accomplishment flag..."] = "decaccom",
	["Start timer..."] = "starttimer",
	["Kill a timer..."] = "killtimer",
	["Wait, then do remaining actions"] = "wait",
	["Give skill points..."] = "givexp",
	["Give money..."] = "givemoney",
	["+/- faction standing..."] = "givestanding",
	["Give item..."] = "giveitem",
	["Fail the mission"] = "fail",
	["Complete the mission"] = "win"
}

medit.db.timer = {}
medit.db.timer_r = {}

medit.db.obj_goto_event = {
	firsthop = {
		"Player reached first hop",
		["Player reached first hop"] = {
			a = 'action',
		}
	},
	lasthop = {
		"Last hop before destination",
		["Last hop before destination"] = {
			a = 'action'
		}
	}
}
medit.db.obj_goto_event_r = {
	["Player reached first hop"] = "firsthop",
	["Last hope before destination"] = "lasthop",
}

medit.db.obj_kill_event = {
	targetkilled = {
		"Completed: Target killed by someone else",
		["Completed: Target killed by someone else"] = {
			a  = 'action',
		}
	},
	otherkill = {
		"Status: Player killed someone else",
		["Status: Player killed someone else"] = {
			a = 'action'
		}
	}
}
medit.db.obj_kill_event_r = {
	["Completed: Target killed by someone else"] = "targetkilled",
	["Status: Player killed someone else"] = "otherkill",
}

medit.db.obj_deliver_event = {
	shipment = { 
		"Partial shipment (defines [nleft])",
		["Partial shipment (defines [nleft])"] = {
			a = 'action'
		}
	}
}

medit.db.obj_deliver_event_r = {
	["Partial shipment (defines [nleft])"] = "shipment"
}

medit.db.objective = {
	goto = {
		"Go to sector...",
		["Go to sector..."] = {
			where = 'sector',
			e = 'obj_goto_event'
		}
	},
	dock = {
		"Dock with station...",
		["Dock with station..."] = {
			station = 'station'
		}
	},
	launch = "Launch from station",
	kill = {
		"Destroy one ship...",
		["Destroy one ship..."] = {
			who = 'character', 
			e = 'obj_kill_event'
		}
	},
	killgroup = {
		"Destroy N in group...", 
		["Destroy N in group..."] = {
			nkills = 'text',
			who = 'chargroup'
		}
	},
	deliver = {
		"Deliver N items to station", 
		["Deliver N items to station"] = {
			nitems = 'text', 
			item = 'itemtype', 
			station = 'station',
		},
		e = 'obj_deliver_event',
	},
	mine = {
		"Mine N crates of ore", 
		["Mine N crates of ore"] = {
			ncrates = 'text', 
			ore = 'ore',
		}
	},
	waitinput = "Wait for user input"
}

medit.db.objective_r = {
	["Go to sector..."] = "goto",
	["Dock with station..."] = "dock",
	["Launch from station"] = "launch",
	["Destroy one ship..."] = "kill",
	["Destroy N in group..."] = "killgroup",
	["Deliver N items to station"] = "deliver",
	["Mine N crates of ore"] = "mine",
	["Wait for user input"] = "waitinput"
}

medit.db.event = {
	abort = { 
		"Mission aborted",
		["Mission aborted"] = {
			a = 'action',
		}
	},
	died = {
		"Player died",
		["Player died"] = {
			a = 'action'
		}
	},
	npcdied = {
		"NPC died",
		["NPC died"] = {
			who = 'npc',
			a = 'action'
		}
	},
	killednpc = {
		"Player killed NPC",
		["Player killed NPC"] = {
			who = 'npc',
			a = 'action'
		}
	},
	groupdied = { 
		"Someone else died",
		["Someone else died"] = {
			who = 'chargroup',
			a = 'action'
		}
	},
	launch = {
		"Launched from (any) station",
		["Launched from (any) station"] = {
			a = 'action'
		}
	},
	dock = {
		"Docked with (any) station",
		["Docked with (any) station"] = {
			a = 'action'
		}
	},
	missionmsg = {
		"Message from player",
		["Message from player"] = {
			msg = 'text', 
			a = 'action'
		}
	}
}

medit.db.event_r = {
	["Mission aborted"] = "abort",
	["Player died"] = "died",
	["NPC died"] = "npcdied",
	["Player killed NPC"] = "killednpc",
	["Someone else died"] = "groupdied",
	["Launched from (any) station"] = "launch",
	["Docked with (any) station"] = "dock",
	["Message from player"] = "missionmsg"
}

medit.db.missionreq = {
	minlicense = {
		"Minimum license",
		["Minimum license"] = {
			ltype = 'licensetype', 
			min = 'text',
		}
	},
	maxlicense = {
		"Maximum license",
		["Maximum license"] = {
			ltype = 'licensetype',
			max = 'text', 
		}
	},
	minfaction = {
		"Minimum faction",
		["Minimum faction"] = {
			fac = 'faction', 
			min = 'factionthresh' 
		}
	},
	maxfaction = {
		"Maximum faction",
		["Maximum faction"] = {
			fac = 'faction', 
			max = 'factionthresh'
		}
	},
	accomexist = {
		"Accomplishment must exist",
		["Accomplishment must exist"] = {
			accom = 'longtext', 
		}
	},
	accomnexist = {
		"Accomplishment must not exist",
		["Accomplishment must not exist"] = {
			accom = 'longtext',
		}
	},
	accomequals = {
		"Accomplishment must be equal to",
		["Accomplishment must be equal to"] = {
			accom = 'longtext', 
			value = 'text'
		}
	},
	accomgreater = {
		"Accomplishment greater than",
		["Accomplishment greater than"] = {
			accom = 'longtext',
			value = 'text'
		}
	},
	accomless = {
		"Accomplishment less than",
		["Accomplishment less than"] = {
			accom = 'longtext', 
			value = 'text'
		}
	}
}

medit.db.missionreq_r = {
	["Minimum license"] = "minlicense",
	["Maximum license"] = "maxlicense",
	["Minimum faction"] = "minfaction",
	["Maximum faction"] = "maxfaction",
	["Accomplishment must exist"] = "accomexist",
	["Accomplishment must not exist"] = "accomnexist",
	["Accomplishment must be equal to"] = "accomequals",
	["Accomplishment greater than"] = "accomgreater",
	["Accomplishment less than"] = "accomless",
}

medit.db.station = {
	issuing = "Station issuing mission", 
	random = {
		"Station in system/faction...",
		["Station in system/faction..."] = {
		 	system = 'system',  
			faction = 'faction', 
			stationclass = 'stationclass'  
		}, 
		station_ = 'station'
	},
	newb = {
		"\"Newbie\" stations...",
		["\"Newbie\" stations..."] = { 
			faction = 'majorfaction'  
		},
		station_ = 'station'
	}
}

medit.db.station_r = {
	["Station issuing mission"] = "issuing",
	["Station in system/faction..."] = "random",
	["\"Newbie\" stations..."] = "newb",
}
	

medit.db.sector = {
	random = {
		"Sector in system of type...",
		["Sector in system of type..."] = {
			system = 'system', 
			sectype = 'sectype'
		},
		sector_ = 'sector'
	},
	newb = {
		"\"Newbie\" combat zones...",
		["\"Newbie\" combat zones..."] = { 
			faction = 'majorfaction'
		},
		sector_ = 'sector'
	},
	station = {
		"Sector containing station...",
		["Sector containing station..."] = {		
			station = 'station'
		},
		sector_ = 'sector'
	},
	player = "Sector player is in", 
}

medit.db.sector_r = {
	["Sector in system of type..."] = "random",
	["\"Newbie\" combat zones..."] = "newb",
	["Sector containing station..."] = "station",
	["Sector player is in"] = "player"
}

medit.db.spawntype = {
	warpin = {
		"Warp into sector",
		["Warp into sector"] = {
			sector = 'sector'
		}
	},
	undock = {
		"Undock from station",
		["Undock from station"] = { 
			station = 'station'
		}
	}
}

medit.db.spawntype_r = {
	["Warp into sector"] = "warpin",
	["Undock from station"] = "undock"
}

medit.db.chargroup = {
	likedby = {
		"Anyone liked by...",
		["Anyone liked by..."] = {
			faction = 'faction'
		}
	},
	hatedby = {
		"Anyone hated by...",
		["Anyone hated by..."] = {
			faction = 'faction'
		}
	},
	npctype = {
		"NPCs of type...",
		["NPCs of type..."] = {
			mptype = 'npctype'
		}
	},
}

medit.db.chargroup_r = {
	["Anyone liked by..."] = "likedby",
	["Anyone hated by..."] = "hatedby",
	["NPCs of type..."] = "npctype"
}

medit.db.npcaction = {
	engage = {
		"Attack...",
		["Attack..."] = {
			who = 'character'
		}
	},
	defend = {
		"Defend...",
		["Defend..."] = {
			who = 'character'
		}
	},
	follow = {
		"Follow...",
		["Follow..."] = {
			who = 'character'
		}
	},
	beaggressive = "Attack anybody I hate", 
	goto = {
		"Go to sector...",
		["Go to sector..."] = {
			sector = 'sector'
		}
	},
	mine = "Mine stuff", 
	dock = {
		"Dock to station...",
		["Dock to station..."] = {
			station = 'station'
		}
	},
	goaway = "Go away (warp out)", 
	explode = "Explode spontaneously", 
}

medit.db.npcaction_r = {
	["Attack..."] = "engage",
	["Defend..."] = "defend",
	["Folow..."] = "follow",
	["Attack anybody I hate"] = "beaggressive",
	["Go to sector..."] = "goto",
	["Mine stuff"] = "mine",
	["Dock to station..."] = "dock",
	["Go away (warp out)"] = "goaway",
	["Explode spontaneously"] = "explode"
}

medit.db.ship = {
	roboship_seeker = {
		'*Aerna Seeker XZ-1372m',
		["Small Port"] = 'smallweapon', 
	},
	roboship_transport3 = {
		'*Aerna Transport XZ-1372m',
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
	},
	roboship2_recon = {
		'*ApuTech Observer XZ-1372m',
		["Small Port"] = 'smallweapon', 
	},
	roboship2_sentry = {
		'*ApuTech-17 Guardian XWD-3725-46',
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
	},
	roboship_sentry = {
		'*ApuTech-5 Guardian XWD-3725-46',
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
	},
	roboship2_defender = {
		'*Arklan Guardian XZ-1372m',
		["Large Port - Bottom"] = 'largeweapon', 
		["Large Port - Top"] = 'largeweapon', 
	},
	roboship2_drone2 = {
		'*Artemis Collector XZ-1372m',
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
		["Large Port - Front"] = 'largeweapon', 
	},
	roboship_transport = {
		'*Axia RT29 Transport XZ-1372m',
		["Small Port"] = 'smallweapon', 
	},
	roboship2_assault2 = {
		'*DenTek Assault XZ-1372m',
		["Small Port"] = 'smallweapon', 
	},
	roboship_drone2 = {
		'*DenTek Collector XZ-1372m',
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
		["Large Port - Front"] = 'largeweapon', 
	},
	roboship2_guardian = {
		'*Devus D3 Guardian XZ-1372m',
		["Small Port - Front"] = 'smallweapon', 
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
	},
	roboship_recon = {
		'*Fennus R-12 Observer XZ-1372m',
		["Small Port"] = 'smallweapon', 
	},
	roboship_guardian = {
		'*Fennus R-18 Guardian XZ-1372m',
		["Small Port - Front"] = 'smallweapon', 
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
	},
	roboship2_mothership = {
		'*Helman K-27 Overseer XZ-1372m',
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
		["Large Port - Front"] = 'largeweapon', 
	},
	roboship_mothership = {
		'*Helman K-3 Overseer XZ-1372m',
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
		["Large Port - Front"] = 'largeweapon', 
	},
	roboship_queen = {
		'*Hive Queen XZ-1372m',
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
		["Large Port - Front"] = 'largeweapon', 
	},
	roboship_assault2 = {
		'*Infiltrator XWD-3725-46',
		["Small Port"] = 'smallweapon', 
	},
	roboship2_drone1 = {
		'*Kannik Collector XZ-1372m',
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
	},
	roboship2_transport3 = {
		'*Milanar Transport XZ-1372m',
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
	},
	roboship2_transport2 = {
		'*Orion R14 Transport XZ-1372m',
		["Small Port"] = 'smallweapon', 
	},
	roboship_defender = {
		'*Orne Guardian XZ-1372m',
		["Large Port - Bottom"] = 'largeweapon', 
		["Large Port - Top"] = 'largeweapon', 
	},
	roboship_drone1 = {
		'*Orun Collector XZ-1372m',
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
	},
	roboship2_assault = {
		'*Prosus Assault XWD-3725-46',
		["Small Port"] = 'smallweapon', 
	},
	roboship_transport2 = {
		'*Siepos T11 Transport XZ-1372m',
		["Small Port"] = 'smallweapon', 
	},
	roboship2_transport = {
		'*Siepos T38 Transport XZ-1372m',
		["Small Port"] = 'smallweapon', 
	},
	roboship_assault = {
		'*Valent A-47 Assault XWD-3725-46',
		["Small Port"] = 'smallweapon', 
	},
	atlas = {
		'Atlas',
		["Small Port"] = 'smallweapon', 
		["Large Port"] = 'largeweapon', 
	},
	atlasMkII = {
		'Atlas MkII',
		["Small Port"] = 'smallweapon', 
		["Large Port"] = 'largeweapon', 
	},
	atlasMkIII = {
		'Atlas MkIII',
		["Small Port"] = 'smallweapon', 
		["Large Port"] = 'largeweapon', 
	},
	ship_generic_ec101mkII = {
		'Axia EC-101 MkII',
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
	},
	wraithguardian = {
		'Axia Guardian Wraith',
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
		["Large Port"] = 'largeweapon', 
	},
	marauderMkII = {
		'Axia Marauder MkII',
		["Small Port - Front"] = 'smallweapon', 
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
	},
	behemoth = {
		'Behemoth',
		["Large Port - Left"] = 'largeweapon', 
		["Large Port - Right"] = 'largeweapon', 
	},
	vultureXT = {
		'BioCom Vulture XT',
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
	},
	bunchiesufo = {
		'Bunchies UFO',
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
		["Large Port"] = 'largeweapon', 
	},
	centaur = {
		'Centaur',
		["Small Port"] = 'smallweapon', 
		["Large Port - Front"] = 'largeweapon', 
		["Large Port - Rear"] = 'largeweapon', 
	},
	centaurMkII = {
		'Centaur MkII',
		["Small Port"] = 'smallweapon', 
		["Large Port - Front"] = 'largeweapon', 
		["Large Port - Rear"] = 'largeweapon', 
	},
	centaurMkIII = {
		'Centaur MkIII',
		["Small Port"] = 'smallweapon', 
		["Large Port - Front"] = 'largeweapon', 
		["Large Port - Rear"] = 'largeweapon', 
	},
	centurion = {
		'Centurion',
		["Small Port"] = 'smallweapon', 
	},
	centurionIBG = {
		'Centurion Itani Border Guardian',
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
	},
	centurionMkII = {
		'Centurion MkII',
		["Small Port"] = 'smallweapon', 
	},
	centurionMkIII = {
		'Centurion MkIII',
		["Small Port"] = 'smallweapon', 
	},
	marauderMerc = {
		'Corvus Marauder Mercenary',
		["Small Port - Front"] = 'smallweapon', 
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
	},
	vulturius = {
		'Corvus Vulturius',
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
	},
	ship_generic_ec101 = {
		'EC-101',
		["Small Port"] = 'smallweapon', 
	},
	ship_generic_ec107 = {
		'EC-107',
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
	},
	ship_generic_ec98 = {
		'EC-98',
		["Small Port"] = 'smallweapon', 
	},
	hornet = {
		'Hornet',
		["Small Port - Front"] = 'smallweapon', 
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
		["Small Port - Rear"] = 'smallweapon', 
	},
	hornetMkII = {
		'Hornet MkII',
		["Small Port - Front"] = 'smallweapon', 
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
		["Small Port - Rear"] = 'smallweapon', 
	},
	hornetMkIII = {
		'Hornet MkIII',
		["Small Port - Front"] = 'smallweapon', 
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
		["Small Port - Rear"] = 'smallweapon', 
	},
	valkyrieIDF = {
		'IDF Valkyrie Vigilant',
		["Small Port - Front"] = 'smallweapon', 
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
	},
	valkyrie = {
		'Itani Valkyrie',
		["Small Port - Front"] = 'smallweapon', 
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
	},
	centurionRevC = {
		'Orion Centurion Rev C',
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
	},
	hornetCG = {
		'Orion Hornet Convoy Guardian',
		["Small Port - Front"] = 'smallweapon', 
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
		["Small Port - Rear"] = 'smallweapon', 
	},
	ragnarok = {
		'Ragnarok',
		["Small Port - Front"] = 'smallweapon', 
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
		["Large Port - Front"] = 'largeweapon', 
		["Large Port - Rear"] = 'largeweapon', 
	},
	ragnarokMkII = {
		'Ragnarok MkII',
		["Small Port - Front"] = 'smallweapon', 
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
		["Large Port - Front"] = 'largeweapon', 
		["Large Port - Rear"] = 'largeweapon', 
	},
	ragnarokMkIII = {
		'Ragnarok MkIII',
		["Small Port - Front"] = 'smallweapon', 
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
		["Large Port - Front"] = 'largeweapon', 
		["Large Port - Rear"] = 'largeweapon', 
	},
	prometheus = {
		'Serco Prometheus',
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
		["Large Port"] = 'largeweapon', 
	},
	prometheusMkII = {
		'Serco Prometheus MkII',
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
		["Large Port"] = 'largeweapon', 
	},
	prometheusMkIII = {
		'Serco Prometheus MkIII',
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
		["Large Port"] = 'largeweapon', 
	},
	prometheusSC = {
		'Serco SkyCommand Prometheus',
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
		["Large Port"] = 'largeweapon', 
	},
	vultureguardian = {
		'Serco Vulture Guardian',
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
	},
	shortbus = {
		'Short Bus',
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
		["Large Port"] = 'largeweapon', 
	},
	guildfurie = {
		'Stygian Furie',
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
		["Large Port"] = 'largeweapon', 
	},
	roboship_assault3 = {
		'Stygian Furie',
		["Small Port - Front"] = 'smallweapon', 
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
	},
	superbus = {
		'SuperBus',
		["Large Port - Front"] = 'largeweapon', 
		["Large Port - Left"] = 'largeweapon', 
		["Large Port - Right"] = 'largeweapon', 
		["Large Port - Middle"] = 'largeweapon', 
		["Large Port - Left Wing"] = 'largeweapon', 
		["Large Port - Right Wing"] = 'largeweapon', 
		["Large Port - Roof"] = 'largeweapon', 
		["Large Port - Left Tail"] = 'largeweapon', 
		["Large Port - Right Tail"] = 'largeweapon', 
		["Large Port - Rear"] = 'largeweapon', 
	},
	atlasTPGtypeB = {
		'TPG Atlas Type B',
		["Small Port"] = 'smallweapon', 
		["Large Port"] = 'largeweapon', 
	},
	atlasTPGtypeX = {
		'TPG Atlas Type X',
		["Small Port"] = 'smallweapon', 
		["Large Port"] = 'largeweapon', 
	},
	marauderTypeB = {
		'TPG Marauder Type B',
		["Small Port - Front"] = 'smallweapon', 
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
	},
	marauderTypeX = {
		'TPG Marauder Type X',
		["Small Port - Front"] = 'smallweapon', 
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
	},
	centauragg = {
		'Tunguska Centaur Aggresso',
		["Small Port"] = 'smallweapon', 
		["Large Port - Front"] = 'largeweapon', 
		["Large Port - Rear"] = 'largeweapon', 
	},
	marauderMiner = {
		'Tunguska Mineral Marauder',
		["Small Port"] = 'smallweapon', 
		["Large Port"] = 'largeweapon', 
	},
	turret01 = {
		'Turret',
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
	},
	roboufo = {
		'UFO',
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
		["Large Port"] = 'largeweapon', 
	},
	marauder = {
		'UIT Marauder',
		["Small Port - Front"] = 'smallweapon', 
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
	},
	ship_generic_ec101typeB = {
		'Valent EC-101 Type B',
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
	},
	marauderRevB = {
		'Valent Marauder Rev B',
		["Small Port - Front"] = 'smallweapon', 
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
	},
	valkyrieRune = {
		'Valkyrie Rune',
		["Small Port - Front"] = 'smallweapon', 
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
	},
	valkyrievgc = {
		'Valkyrie Vengeance',
		["Small Port - Front"] = 'smallweapon', 
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
	},
	vulture = {
		'Vulture',
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
	},
	vultureMkII = {
		'Vulture MkII',
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
	},
	vultureMkIII = {
		'Vulture MkIII',
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
	},
	vultureMkIV = {
		'Vulture MkIV',
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
	},
	warthog = {
		'Warthog',
		["Small Port"] = 'smallweapon', 
		["Large Port"] = 'largeweapon', 
	},
	warthogMiner = {
		'Warthog Mineral Extractor',
		["Small Port"] = 'smallweapon', 
		["Large Port"] = 'largeweapon', 
	},
	warthogMkII = {
		'Warthog MkII',
		["Small Port"] = 'smallweapon', 
		["Large Port"] = 'largeweapon', 
	},
	warthogMkIII = {
		'Warthog MkIII',
		["Small Port"] = 'smallweapon', 
		["Large Port"] = 'largeweapon', 
	},
	warthogMkIV = {
		'Warthog MkIV',
		["Small Port"] = 'smallweapon', 
		["Large Port"] = 'largeweapon', 
	},
	warthogTD = {
		'Warthog Territorial Defender',
		["Small Port"] = 'smallweapon', 
		["Large Port"] = 'largeweapon', 
	},
	wraith = {
		'Wraith',
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
		["Large Port"] = 'largeweapon', 
	},
	wraithMkII = {
		'Wraith MkII',
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
		["Large Port"] = 'largeweapon', 
	},
	wraithMkIII = {
		'Wraith MkIII',
		["Small Port - Left"] = 'smallweapon', 
		["Small Port - Right"] = 'smallweapon', 
		["Large Port"] = 'largeweapon', 
	}
}

medit.db.ship_r = {
	["*Aerna Seeker XZ-1372m"] = "roboship_seeker",
	["*Aerna Transport XZ-1372m"] = "roboship_transport3",
	["*ApuTech Observer XZ-1372m"] = "roboship2_recon",
	["*ApuTech-17 Guardian XWD-3725-46"] = "roboship2_sentry", 
	["*ApuTech-5 Guardian XWD-3725-46"] = "roboship_sentry", 
	["*Arklan Guardian XZ-1372m"] = "roboship2_defender",
	["*Artemis Collector XZ-1372m"] = "roboship2_drone2",
	["*Axia RT29 Transport XZ-1372m"] = "roboship_transport",
	["*DenTek Assault XZ-1372m"] = "roboship2_assault2",
	["*DenTek Collector XZ-1372m"] = "roboship_drone2",
	["*Devus D3 Guardian XZ-1372m"] = "roboship2_guardian",
	["*Fennus R-12 Observer XZ-1372m"] = "roboship_recon",
	["*Fennus R-18 Guardian XZ-1372m"] = "roboship_guardian", 
	["*Helman K-27 Overseer XZ-1372m"] = "roboship2_mothership", 
	["*Helman K-3 Overseer XZ-1372m"] = "roboship_mothership", 
	["*Hive Queen XZ-1372m"] = "roboship_queen",
	["*Infiltrator XWD-3725-46"] = "roboship_assault2",
	["*Kannik Collector XZ-1372m"] = "roboship2_drone1", 
	["*Milanar Transport XZ-1372m"] = "roboship2_transport3",
	["*Orion R14 Transport XZ-1372m"] = "roboship2_transport2", 
	["*Orne Guardian XZ-1372m"] = "roboship_defender",
	["*Orun Collector XZ-1372m"] = "roboship_drone1", 
	["*Prosus Assault XWD-3725-46"] = "roboship2_assault",
	["*Siepos T11 Transport XZ-1372m"] = "roboship_transport2",
	["*Siepos T38 Transport XZ-1372m"] = "roboship2_transport",
	["*Valent A-47 Assault XWD-3725-46"] = "roboship_assault",
	["Atlas"] = "atlas",
	["Atlas MkII"] = "atlasMkII",
	["Atlas MkIII"] = "atlasMkIII",
	["Axia EC-101 MkII"] = "ship_generic_ec101mkII", 
	["Axia Guardian Wraith"] = "wraithguardian",
	["Axia Marauder MkII"] = "marauderMkII",
	["Behemoth"] = "behemoth", 
	["BioCom Vulture XT"] = "vultureXT", 
	["Bunchies UFO"] = "bunchiesufo",
	["Centaur"] = "centaur",
	["Centaur MkII"] = "centaurMkII",
	["Centaur MkIII"] = "centaurMkIII",
	["Centurion"] = "centurion",
	["Centurion Itani Border Guardian"] = "centurionIBG", 
	["Centurion MkII"] = "centurionMkII",
	["Centurion MkIII"] = "centurionMkIII", 
	["Corvus Marauder Mercenary"] = "marauderMerc", 
	["Corvus Vulturius"] = "vulturius",
	["EC-101"] = "ship_generic_ec101",
	["EC-107"] = "ship_generic_ec107",
	["EC-98"] = "ship_generic_ec98",
	["Hornet"] = "hornet", 
	["Hornet MkII"] = "hornetMkII",
	["Hornet MkIII"] = "hornetMkIII", 
	["IDF Valkyrie Vigilant"] = "valkyrieIDF", 
	["Itani Valkyrie"] = "valkyrie", 
	["Orion Centurion Rev C"] = "centurionRevC",
	["Orion Hornet Convoy Guardian"] = "hornetCG",
	["Ragnarok"] = "ragnarok", 
	["Ragnarok MkII"] = "ragnarokMkII",
	["Ragnarok MkIII"] = "ragnarokMkIII",
	["Serco Prometheus"] = "prometheus",
	["Serco Prometheus MkII"] = "prometheusMkII",
	["Serco Prometheus MkIII"] = "prometheusMkIII",
	["Serco SkyCommand Prometheus"] = "prometheusSC",
	["Serco Vulture Guardian"] = "vultureguardian", 
	["Short Bus"] = "shortbus",
	["Stygian Furie"] = "guildfurie",
	["Stygian Furie"] = "roboship_assault3", 
	["SuperBus"] = "superbus", 
	["TPG Atlas Type B"] = "atlasTPGtypeB",
	["TPG Atlas Type X"] = "atlasTPGtypeX",
	["TPG Marauder Type B"] = "marauderTypeB", 
	["TPG Marauder Type X"] = "marauderTypeX",
	["Tunguska Centaur Aggresso"] = "centauragg",
	["Tunguska Mineral Marauder"] = "marauderMiner",
	["Turret"] = "turret01",
	["UFO"] = "roboufo",
	["UIT Marauder"] = "marauder",
	["Valent EC-101 Type B"] = "ship_generic_ec101typeB",
	["Valent Marauder Rev B"] = "marauderRevB",
	["Valkyrie Rune"] = "valkyrieRune", 
	["Valkyrie Vengeance"] = "valkyrievgc",
	["Vulture"] = "vulture",
	["Vulture MkII"] = "vultureMkII", 
	["Vulture MkIII"] = "vultureMkIII",
	["Vulture MkIV"] = "vultureMkIV",
	["Warthog"] = "warthog",
	["Warthog Mineral Extractor"] = "warthogMiner",
	["Warthog MkII"] = "warthogMkII", 
	["Warthog MkIII"] = "warthogMkIII",
	["Warthog MkIV"] = "warthogMkIV",
	["Warthog Territorial Defender"] = "warthogTD",
	["Wraith"] = "wraith",
	["Wraith MkII"] = "wraithMkII",
	["Wraith MkIII"] = "wraithMkIII",
}

medit.db.character = {
	player = "The player",
}
medit.db.character_r = {
	["The player"] = "player", 	
}

medit.db.licensetype = {
	["1"] = 'Combat',
	["2"] = 'Light Weapons',
	["3"] = 'Heavy Weapons',
	["4"] = 'Trade',
	["5"] = 'Mining',
}
medit.db.licensetype_r = {
	["Combat"] = '1',
	["Light Weapons"] = '2',
	["Heavy Weapons"] = '3',
	["Trade"] = '4',
	["Mining"] = '5'
}

medit.db.factionthresh = {
	["65535"] = 'Pillar of Society',
	["52428"] = 'Admired',
	["39321"] = 'Respected',
	["32768"] = 'Neutral',
	["26214"] = 'Disliked',
	["13107"] = 'Hated',
	["0"] = 'Kill on Sight',
}
medit.db.factionthresh_r = {
	["Pillar of Society"] = '65535',
	["Admired"] = '52428',
	["Respected"] = '39321',
	["Neutral"] = '32768',
	["Disliked"] = '26214',
	["Hated"] = '13107',
	["Kill on Sight"] = '0' 
}

medit.db.sectype = {
	empty = "Empty sector", 
	rocks = "Sector with asteroids", 
}
medit.db.sectype_r = {
	["Empty sector"] = "empty", 
	["Sector with asteroids"] = "rocks", 
}

medit.db.smallweapon = {
	BeamCannon00 = 'Beam Cannon', 
	BeamCannon01 = 'Super Beam Cannon', 
	BeamCannon02 = 'Ultra Beam Cannon', 
	BeamCannon03 = 'Frigate Beam Cannon', 
	Blaster00 = 'Ion Blaster', 
	Blaster01 = 'Ion Blaster', 
	Blaster01MkII = 'Ion Blaster MkII', 
	Blaster01MkIII = 'Ion Blaster MkIII', 
	Blaster02 = 'Phase Blaster', 
	Blaster02MkII = 'Phase Blaster MkII', 
	Blaster02Orion = 'Orion Phase Blaster XGX', 
	Blaster02TPG = 'TPG Sparrow Phase Blaster', 
	Blaster03 = 'Neutron Blaster', 
	Blaster03MkII = 'Neutron Blaster MkII', 
	Blaster03MkIII = 'Neutron Blaster MkIII', 
	Blaster04 = 'Positron Blaster', 
	Blaster04Axia = 'Axia Accelerated Positron Blaster', 
	Blaster05 = 'Uber Tachyon Blaster', 
	BlasterX = 'Frigate Buster', 
	CapitalCannon = 'Capital Cannon', 
	CapitalCannon02 = 'Capital Cannon Highpower', 
	ChargedCannon01 = 'Charged Cannon', 
	FlareLauncher01 = 'Iceflare Rocket Launcher', 
	FlareLauncher02 = 'Starflare Rocket Launcher', 
	FlechetteCannon01 = 'Flechette Cannon', 
	FlechetteCannon02 = 'Flechette Cannon MkII', 
	FreeLaserCannon01 = 'Government-Issued Plasma Cannon', 
	GaussCannon01 = 'Gauss Cannon', 
	GaussCannon01MkII = 'Gauss Cannon MkII', 
	HeatSeekerLauncher01 = 'Gemini Homing Missile Launcher', 
	LaserCannon02 = 'Plasma Cannon MkII', 
	LaserCannon03 = 'Plasma Cannon MkIII', 
	LaserCannon04 = 'Plasma Cannon HX', 
	MissileLauncher01 = 'YellowJacket Missile Launcher', 
	MissileLauncher03 = 'Firefly Homing Missile Launcher', 
	QueenBlaster04 = 'Graviton Blaster', 
	QueenSeekerLauncher01 = "The Queen's Missile Launcher", 
	RailGun01 = 'Rail Gun', 
	RailGun02 = 'Rail Gun MkII', 
	RailGun03 = 'Rail Gun MkIII', 
	RailGun04 = 'Rail Gun Advanced', 
	RocketLauncher01 = 'Sunflare Rocket Launcher', 
	SeekerRocketLauncher01 = "The seeker's Missile Launcher", 
}
medit.db.smallweapon_r = {
	["Beam Cannon"] = 'BeamCannon00', 
	["Super Beam Cannon"] = 'BeamCannon01', 
	["Ultra Beam Cannon"] = 'BeamCannon02', 
	["Frigate Beam Cannon"] = 'BeamCannon03', 
	["Ion Blaster"] = 'Blaster00', 
	["Ion Blaster"] = 'Blaster01', 
	["Ion Blaster MkII"] = 'Blaster01MkII', 
	["Ion Blaster MkIII"] = 'Blaster01MkIII', 
	["Phase Blaster"] = 'Blaster02', 
	["Phase Blaster MkII"] = 'Blaster02MkII', 
	["Orion Phase Blaster XGX"] = 'Blaster02Orion', 
	["TPG Sparrow Phase Blaster"] = 'Blaster02TPG', 
	["Neutron Blaster"] = 'Blaster03', 
	["Neutron Blaster MkII"] = 'Blaster03MkII', 
	["Neutron Blaster MkIII"] = 'Blaster03MkIII', 
	["Positron Blaster"] = 'Blaster04', 
	["Axia Accelerated Positron Blaster"] = 'Blaster04Axia', 
	["Uber Tachyon Blaster"] = 'Blaster05', 
	["Frigate Buster"] = 'BlasterX', 
	["Capital Cannon"] = 'CapitalCannon', 
	["Capital Cannon Highpower"] = 'CapitalCannon02', 
	["Charged Cannon"] = 'ChargedCannon01', 
	["Iceflare Rocket Launcher"] = 'FlareLauncher01', 
	["Starflare Rocket Launcher"] = 'FlareLauncher02', 
	["Flechette Cannon"] = 'FlechetteCannon01', 
	["Flechette Cannon MkII"] = 'FlechetteCannon02', 
	["Government-Issued Plasma Cannon"] = 'FreeLaserCannon01', 
	["Gauss Cannon"] = 'GaussCannon01', 
	["Gauss Cannon MkII"] = 'GaussCannon01MkII', 
	["Gemini Homing Missile Launcher"] = 'HeatSeekerLauncher01', 
	["Plasma Cannon MkII"] = 'LaserCannon02', 
	["Plasma Cannon MkIII"] = 'LaserCannon03', 
	["Plasma Cannon HX"] = 'LaserCannon04', 
	["YellowJacket Missile Launcher"] = 'MissileLauncher01', 
	["Firefly Homing Missile Launcher"] = 'MissileLauncher03', 
	["Graviton Blaster"] = 'QueenBlaster04', 
	["The Queen's Missile Launcher"] = "QueenSeekerLauncher01", 
	["Rail Gun"] = 'RailGun01', 
	["Rail Gun MkII"] = 'RailGun02', 
	["Rail Gun MkIII"] = 'RailGun03', 
	["Rail Gun Advanced"] = 'RailGun04', 
	["Sunflare Rocket Launcher"] = 'RocketLauncher01', 
	["The seeker's Missile Launcher"] = "SeekerRocketLauncher01",
}

medit.db.largeweapon = {
	Blaster04Mega = 'Mega Positron Blaster', 
	GatlingCannon01 = 'Gatling Cannon', 
	GatlingCannon02 = 'Gatling Turret', 
	LightningMineLauncher01 = 'Lightning Mine Launcher', 
	MineLauncher01 = 'Proximity Mine Launcher', 
	MineLauncher02 = 'Concussion Mine Launcher', 
	MissileLauncher02 = 'Stingray Homing Missile Launcher', 
	PlasmaCannon01 = 'Plasma Devastator', 
	PlasmaCannon01MkII = 'Plasma Devastator MkII', 
	QueenGatlingCannon01 = "The Queen's Gatling Turret", 
	RepairCannon01 = 'Repair Module', 
	RepairCannon02 = 'Repair Module MkII', 
	RocketLauncher02 = 'Jackhammer Rocket Launcher', 
	RocketLauncher03 = 'Screamer Rocket Launcher', 
	RocketLauncher04 = 'Avalon Torpedo Launcher', 
	RocketLauncherX = 'Dev Avalon Torpedo Launcher', 
	SwarmMissileLauncher01 = 'Locust Swarm Missile Launcher', 
	SwarmMissileLauncher02 = 'Chaos Swarm Missile Launcher', 
}
medit.db.largeweapon_r = {
	["Mega Positron Blaster"] = 'Blaster04Mega', 
	["Gatling Cannon"] = 'GatlingCannon01', 
	["Gatling Turret"] = 'GatlingCannon02', 
	["Lightning Mine Launcher"] = 'LightningMineLauncher01', 
	["Proximity Mine Launcher"] = 'MineLauncher01', 
	["Concussion Mine Launcher"] = 'MineLauncher02', 
	["Stingray Homing Missile Launcher"] = 'MissileLauncher02', 
	["Plasma Devastator"] = 'PlasmaCannon01', 
	["Plasma Devastator MkII"] = 'PlasmaCannon01MkII', 
	["The Queen's Gatling Turret"] = "QueenGatlingCannon01", 
	["Repair Module"] = 'RepairCannon01', 
	["Repair Module MkII"] = 'RepairCannon02', 
	["Jackhammer Rocket Launcher"] = 'RocketLauncher02', 
	["Screamer Rocket Launcher"] = 'RocketLauncher03', 
	["Avalon Torpedo Launcher"] = 'RocketLauncher04', 
	["Dev Avalon Torpedo Launcher"] = 'RocketLauncherX', 
	["Locust Swarm Missile Launcher"] = 'SwarmMissileLauncher01', 
	["Chaos Swarm Missile Launcher"] = 'SwarmMissileLauncher02', 
}

medit.db.npctype = {
-- hive npcs
    targetdrone = "Target Drone",
    combatdrone = "Combat Drone",
    assault = "Valent A-47 Assault",
    assaultb = "Prosus Assault",
    assault2 = "TyCorp Assault",
    assault2b = "DenTek Assault",
    assault3 = "Valent A-3 Assault",
    assault3b = "Axia RA18 Assault",
    defender = "Orne Guardian",
    defenderb = "Arklan Guardian",
    drone2 = "DenTek Collector",
    drone2b = "Artemis Collector",
    drone = "Orun Collector",
    droneb = "Kannik Collector",
    guardian = "Fennus R-18 Guardian",
    guardianb = "Devus D3 Guardian",
    infiltrator = "Infiltrator",
    transport2 = "Siepos T11 Transport",
    transport2b = "Orion R14 Transport",
    transport3 = "Aerna Transport",
    transport3b = "Milanar Transport",
    transport = "Axia RT29 Transport",
    transportb = "Siepos T38 Transport",
    mothership = "Helman K-3 Overseer",
    mothershipb = "Helman K-27 Overseer",
    queen2 = "Hive Queen",
    recon = "Fennus R-12 Observer",
    reconb = "ApuTech Observer",
    seeker = "Aerna Seeker",
    sentry = "ApuTech-5 Guardian",
    sentryb = "ApuTech-17 Guardian",

-- NPC npcs
    transport_behemoth = "Behemoth Transport",
    cap_wing1 = "Serco Prometheus (Gauss+Flares)",
    cap_wing2 = "Serco Vulture Guardian (NB3s)",
    borderguard1 = "Border Guard Centurion",
    nationdef = "Station Guard",
    nationstrike = "Strike Force",
    trader_atlas = "Convoy Atlas",
    trader_centaur = "Convoy Centaur",
    trader_ec101b = "Convoy EC101",
    trader_wraith = "Convoy Wraith",
    escort_centurion3 = "Convoy Escort Centurion",
    escort_vulture4 = "Convoy Escort Vulture",
    escort_warthogtd = "Convoy Escort Warthog",

    easy_centurion = "Easy Centurion",
    medium_centurion = "Medium Centurion",
    easy_vulture = "Easy Vulture",
    medium_vulture = "Medium Vulture",
    easy_raptor = "Easy Raptor",
    medium_raptor = "Medium Raptor",

-- Capital ships
    trident = "Trident",
    teradon = "TPG Teradon",
    constellation = "TPG Constellation",
    frigate2 = "Serco HAC",
}

medit.db.npctype_r = {
	-- hive npcs
	["Target Drone"] = "targetdrone",
	["Combat Drone"] = "combatdrone",
	["Valent A-47 Assault"] = "assault",
	["Prosus Assault"] = "assaultb",
	["TyCorp Assault"] = "assault2",
	["DenTek Assault"] = "assault2b",
	["Valent A-3 Assault"] = "assault3",
	["Axia RA18 Assault"] = "assault3b",
	["Orne Guardian"] = "defender",
	["Arklan Guardian"] = "defenderb",
	["DenTek Collector"] = "drone2",
	["Artemis Collector"] = "drone2b",
	["Orun Collector"] = "drone",
	["Kannik Collector"] = "droneb",
	["Fennus R-18 Guardian"] = "guardian",
	["Devus D3 Guardian"] = "guardianb",
	["Infiltrator"] = "infiltrator",
	["Siepos T11 Transport"] = "transport2",
	["Orion R14 Transport"] = "transport2b",
	["Aerna Transport"] = "transport3",
	["Milanar Transport"] = "transport3b",
	["Axia RT29 Transport"] = "transport",
	["Siepos T38 Transport"] = "transportb",
	["Helman K-3 Overseer"] = "mothership",
	["Helman K-27 Overseer"] = "mothershipb",
	["Hive Queen"] = "queen2",
	["Fennus R-12 Observer"] = "recon",
	["ApuTech Observer"] = "reconb",
	["Aerna Seeker"] = "seeker",
	["ApuTech-5 Guardian"] = "sentry",
	["ApuTech-17 Guardian"] = "sentryb",

-- NPC npcs
	["Behemoth Transport"] = "transport_behemoth",
	["Serco Prometheus (Gauss+Flares)"] = "cap_wing1",
	["Serco Vulture Guardian (NB3s)"] = "cap_wing2",
	["Border Guard Centurion"] = "borderguard1",
	["Station Guard"] = "nationdef",
	["Strike Force"] = "nationstrike",
	["Convoy Atlas"] = "trader_atlas",
	["Convoy Centaur"] = "trader_centaur",
	["Convoy EC101"] = "trader_ec101b",
	["Convoy Wraith"] = "trader_wraith",
	["Convoy Escort Centurion"] = "escort_centurion3",
	["Convoy Escort Vulture"] = "escort_vulture4",
	["Convoy Escort Warthog"] = "escort_warthogtd",

	["Easy Centurion"] = "easy_centurion",
	["Medium Centurion"] = "medium_centurion",
	["Easy Vulture"] = "easy_vulture",
	["Medium Vulture"] = "medium_vulture",
	["Easy Raptor"] = "easy_raptor",
	["Medium Raptor"] = "medium_raptor",

-- Capital ships
	["Trident"] = "trident",
	["TPG Teradon"] = "teradon",
	["TPG Constellation"] = "constellation",
	["Serco HAC"] = "frigate2"
}

medit.db.system = {
	any = "Any system", 
	player = "System player is in", 
	["4"] = "[Itani] Deneb", 
	["5"] = "[Itani] Eo", 
	["6"] = "[Itani] Cantus", 
	["7"] = "[Itani] Metana",
	["8"] = "[Itani] Setalli Shinas",
	["9"] = "[Itani] Itan", 
	["10"] = "[Itani] Pherona", 
	["11"] = "[Itani] Artana Aquilus", 
	["12"] = "[Itani] Divinia", 
	["13"] = "[Itani] Jallik", 
	["27"] = "[Serco] Initros", 
	["1"] = "[Serco] Sol II", 
	["2"] = "[Serco] Betheshee", 
	["3"] = "[Serco] Geira Rutilus", 
	["28"] = "[Serco] Pyronis", 
	["29"] = "[Serco] Rhamus", 
	["30"] = "[Serco] Dantia",
	["15"] = "[UIT] Verasi", 
	["18"] = "[UIT] Nyrius", 
	["19"] = "[UIT] Dau",
	["21"] = "[UIT] Azek", 
	["24"] = "[UIT] Arta Caelestis", 
	["14"] = "[Grey] Edras", 
	["16"] = "[Grey] Pelatus", 
	["17"] = "[Grey] Bractus", 
	["20"] = "[Grey] Sedina", 
	["22"] = "[Grey] Odia", 
	["23"] = "[Grey] Latos", 
	["25"] = "[Grey] Ukari", 
	["26"] = "[Grey] Helios",
}

medit.db.system_r = {
	["Any system"] = "any", 
	["System player is in"] = "player", 
	["[Itani] Deneb"] = "4", 
	["[Itani] Eo"] = "5", 
	["[Itani] Cantus"] = "6", 
	["[Itani] Metana"] = "7",
	["[Itani] Setalli Shinas"] = "8",
	["[Itani] Itan"] = "9", 
	["[Itani] Pherona"] = "10", 
	["[Itani] Artana Aquilus"] = "11", 
	["[Itani] Divinia"] = "12", 
	["[Itani] Jallik"] = "13", 
	["[Serco] Initros"] = "27", 
	["[Serco] Sol II"] = "1", 
	["[Serco] Betheshee"] = "2", 
	["[Serco] Geira Rutilus"] = "3", 
	["[Serco] Pyronis"] = "28", 
	["[Serco] Rhamus"] = "29", 
	["[Serco] Dantia"] = "30",
	["[UIT] Verasi"] = "15", 
	["[UIT] Nyrius"] = "18", 
	["[UIT] Dau"] = "19",
	["[UIT] Azek"] = "21", 
	["[UIT] Arta Caelestis"] = "24", 
	["[Grey] Edras"] = "14", 
	["[Grey] Pelatus"] = "16", 
	["[Grey] Bractus"] = "17", 
	["[Grey] Sedina"] = "20", 
	["[Grey] Odia"] = "22", 
	["[Grey] Latos"] = "23", 
	["[Grey] Ukari"] = "25", 
	["[Grey] Helios"] = "26"
}

medit.db.majorfaction = {
	["1"] = "Itani", 
	["2"] = "Serco", 
	["3"] = "UIT",
}
medit.db.majorfaction_r = {
	["Itani"] = "1", 
	["Serco"] = "2", 
	["UIT"] = "3"
}

medit.db.faction = {
	any = "Any faction", 
	player = "Player's faction", 
	sector = "Station issuing mission's faction", 
	["0"] = "Hostile",
	["1"] = "Itani", 
	["2"] = "Serco", 
	["3"] = "UIT", 
	["4"] = "TPG",
	["5"] = "BioCom", 
	["6"] = "Valent", 
	["7"] = "Orion", 
	["8"] = "Axia", 
	["9"] = "Corvus",
	["10"] = "Tunguska", 
	["11"] = "Aeolus", 
	["12"] = "Ineubis", 
	["13"] = "Xang Xi",
}

medit.db.faction_r = {
	["Any faction"] = "any", 
	["Player's faction"] = "player", 
	["Station issuing mission's faction"] = "sector", 
	["Hostile"] = "0",
	["Itani"] = "1", 
	["Serco"] = "2", 
	["UIT"] = "3", 
	["TPG"] = "4",
	["BioCom"] = "5", 
	["Valent"] = "6", 
	["Orion"] = "7", 
	["Axia"] = "8", 
	["Corvus"] = "9",
	["Tunguska"] = "10", 
	["Aeolus"] = "11", 
	["Ineubis"] = "12", 
	["Xang Xi"] = "13"
}

medit.db.stationclass = {
	any = "Any type", 
	Capitol = "Capitol", 
	Barracks = "Barracks", 
	Commercial = "Commercial", 
	Mining = "Mining", 
	Research = "Research",
}
medit.db.stationclass_r = {	
	["Any type"] = "any", 
	Capitol = "Capitol", 
	Barracks = "Barracks", 
	Commercial = "Commercial", 
	Mining = "Mining", 
	Research = "Research", 
}

medit.db.itemtype = {
	AdvancedLogisticsSystem = "Advanced Logistics System", 
	AeolusPilotTrainingUnit = "Aeolus Pilot Training Unit", 
	AgriculturalResearchSupplies = "Agricultural Research Supplies", 
	AirlockMaintenanceSupplies = "Airlock Maintenance Supplies", 
	AmplificationModule = "Amplification Module", 
	BasicResearchSupplies = "Basic Research Supplies", 
	BasicRoboticEquipment = "Basic Robotic Equipment", 
	BearingGrease = "Bearing Grease", 
	BethesheeSpices = "Betheshee Spices", 
	BioComImplants = "BioCom Implants", 
	BiomedicalNanites = "Biomedical Nanites", 
	BiotechnologyResearchSupplies = "Biotechnology Research Supplies", 
	BlankDataPads = "Blank DataPads", 
	ChemicalSpillKit = "Chemical Spill Kit", 
	CombatSimulators = "Combat Simulators", 
	CommercialTextiles = "Commercial Textiles", 
	CookingSupplies = "Cooking Supplies", 
	Coolant = "Coolant", 
	CorvusHoloDisks = "Corvus Holo Disks", 
	CorvusTextiles = "Corvus Textiles", 
	CyberneticsGradeAA = "Cybernetics Grade AA", 
	CyberneticsGradeBB = "Cybernetics Grade BB", 
	CyberneticsGradeEE = "Cybernetics Grade EE", 
	DataLinkConnectors = "Data Link Connectors", 
	DauSpices = "Dau Spices", 
	DauWine = "Dau Wine", 
	DenebRum = "Deneb Rum", 
	DiagnosticImagers = "Diagnostic Imagers", 
	DiviniaSpices = "Divinia Spices", 
	DopplerArray = "Doppler Array", 
	DriedMeat = "Dried Meat", 
	ECClassShipRepairManual = "EC-Class Ship Repair Manual", 
	EmergencyRepairKit = "Emergency Repair Kit", 
	EnergyConversionModule = "Energy Conversion Module", 
	EngineMounts = "Engine Mounts", 
	EscapeHatchSystem = "Escape Hatch System", 
	ExhaustManifold = "Exhaust Manifold", 
	ExternalEquipmentMounts = "External Equipment Mounts", 
	ExternalThermalCouplers = "External Thermal Couplers", 
	ExtravehicularSuits = "Extravehicular Suits", 
	FineChina = "Fine China", 
	FineFurniture = "Fine Furniture", 
	Firesuppressionsystem = "Fire-suppression system", 
	FitnessEquipment = "Fitness Equipment", 
	FlightAssistControlModule = "Flight Assist Control Module", 
	FrequencyModulators = "Frequency Modulators", 
	FreshFlowers = "Fresh Flowers", 
	FuelFlowRegulator = "Fuel Flow Regulator", 
	FuelStorageContainer = "Fuel Storage Container", 
	GuidedMissileCasings = "Guided Missile Casings", 
	Gyroscopes = "Gyroscopes", 
	HoloDisks = "Holo Disks", 
	HullPanels = "Hull Panels", 
	HydraulicTappets = "Hydraulic Tappets", 
	HydrogenIonCollector = "Hydrogen Ion Collector", 
	IndustrialCooling = "Cooling Systems", 
	IndustrialIonCore = "Ion Core", 
	IndustrialOxygenRecycler = "Oxygen Recycling System", 
	IndustrialPhaseArray = "Phase Array", 
	IndustrialPlasmaCore = "Plasma Core", 
	IndustrialPowerRegulators = "Power Regulators", 
	IndustrialStabilizers = "Stabilizing Systems", 
	IndustrialTargeting = "Basic Targeting Systems", 
	IndustrialTargeting2 = "Advanced Targeting Systems", 
	IndustrialTools = "Manufacturing Tools", 
	IndustrialTracking = "ERS Tracking Systems", 
	IndustrialresearchSupplies = "Industrial Research Supplies", 
	IneubisAutomatedDefenseUnit = "Ineubis Automated Defense Unit", 
	IneubisPersonalDefenseSystems = "Ineubis Personal Defense Systems", 
	InstrumentationPanel = "Instrumentation Panel", 
	ItaniEducationDiskLevelM = "Itani Education Disk Level M", 
	ItaniEducationDiskLevelN = "Itani Education Disk Level N", 
	ItaniEducationDiskLevelO = "Itani Education Disk Level O", 
	JanitorialSupplies = "Janitorial Supplies", 
	LCD = "LCD", 
	LifeSupportSystem = "Life Support System", 
	Magnetometer = "Magnetometer", 
	MeditationCrystals = "Meditation Crystals", 
	MentanaSweets = "Metana Sweets", 
	MilitaryResearchSupplies = "Military Research Supplies", 
	MineralAssayEquipment = "Mineral Assay Equipment", 
	NaniteModulators = "Nanite Modulators", 
	NaniteReplicator = "Nanite Replicator", 
	NavigationUnit = "Navigation Unit", 
	NeuralNodule = "Neural Nodule", 
	Optics = "Optics", 
	Ore2Aquean = "Premium Aquean Ore", 
	Ore2Carbonic = "Premium Carbonic Ore", 
	Ore2Ferric = "Premium Ferric Ore", 
	Ore2Ishik = "Premium Ishik Ore", 
	Ore2Silicate = "Premium Silicate Ore", 
	Ore2VanAzek = "Premium VanAzek Ore", 
	Ore2Xithricite = "Premium Xithricite Ore", 
	OreApicene = "Apicene Ore", 
	OreAquean = "Aquean Ore", 
	OreCarbonic = "Carbonic Ore", 
	OreDenic = "Denic Ore", 
	OreFerric = "Ferric Ore", 
	OreHeliocene = "Heliocene Ore", 
	OreIshik = "Ishik Ore", 
	OreItani = "Purified Xithricite Ore", 
	OreLanthanic = "Lanthanic Ore", 
	OrePentric = "Pentric Ore", 
	OrePyronic = "Pyronic Ore", 
	OreSerco = "Purified Xithricite Ore", 
	OreSilicate = "Silicate Ore", 
	OreUIT = "Purified Xithricite Ore", 
	OreVanAzek = "VanAzek Ore", 
	OreXithricite = "Xithricite Ore", 
	OrionDrillBits = "Orion Drill Bits", 
	OrionExtractorComponent = "Orion Extractor Component", 
	OtherScrap = "Scrap Metal", 
	OuterHullPlate = "Outer Hull Plate ", 
	PelatusSpices = "Pelatus Spices", 
	Pharmaceuticals = "Pharmaceuticals", 
	PhernoaSpices = "Pherona Spices", 
	PilotSafetyHarness = "Pilot Safety Harness", 
	PlasmaTorches = "Plasma Torches", 
	PressureReliefValves = "Pressure Relief Valves", 
	ProductDefense = "Personal Defense Systems", 
	ProductElectronics = "Consumer Electronics", 
	ProductLuxury = "Luxury Goods", 
	ProductMedical = "Medical Supplies", 
	ProductReplicator = "MicroTech Replicator", 
	ProductRobotics = "Consumer Robotics", 
	ProductTextiles = "Civilian Textiles", 
	PropellantActuators = "Propellant Actuators", 
	ProtectiveOuterwear = "Protective Outerwear", 
	QuantitativeAnalysisEquipment = "Quantitative Analysis Equipment", 
	RadiationContainmentKit = "Radiation Containment Kit", 
	RareBooks = "Rare Book", 
	RecycledPlastic = "Recycled Plastic", 
	Refined2NanoPigments = "NanoPigments", 
	Refined2OrganoSolvents = "Organic Solvents", 
	Refined2Plasteel = "Plasteel", 
	Refined2Plastics = "Simple Plastics", 
	Refined2Silksteel = "Silksteel", 
	Refined2SynthWood = "SynthWood", 
	Refined2Vismetal = "Vismetal", 
	RefinedChemCorrosive = "Corrosive Chemicals", 
	RefinedChemInert = "Inert Chemicals", 
	RefinedChemVolatile = "Volatile Chemicals", 
	RefinedDyes = "Dyes", 
	RefinedFood = "Food", 
	RefinedHydrocarbons = "Synthetic Hydrocarbons", 
	RefinedNanoFeed = "NanoFeed", 
	RefinedPreciousMetals = "Precious Metals", 
	RefinedSteel = "Steel", 
	RefinedWater = "Purified Water", 
	RefinedXiRite = "XiRite Alloy", 
	RefugeeSupportKit = "Refugee Support Kit", 
	ReplacementHydraulicFluid = "Replacement Hydraulic Fluid", 
	Samoflange = "Samoflange", 
	ScannerCircuitBoards = "Scanner Circuit Boards", 
	SedinaChocolates = "Sedina Chocolates", 
	SercoAle = "Serco Ale", 
	SercoCyberneticImplants = "Serco Cybernetic Implants", 
	SercoTrainingLevelV = "Serco Training Level V", 
	SercoTrainingLevelVI = "Serco Training Level VI", 
	SercoTrainingLevelVII = "Serco Training Level VII", 
	ShipPaint = "Ship Paint", 
	SolidExplosives = "Solid Explosives", 
	SolidFuelPacks = "Solid Fuel Packs", 
	StationConduit = "Station Conduit", 
	Storage = "Storage Container", 
	Superconductors = "Superconductors", 
	SurveillanceEquipment = "Surveillance Equipment", 
	SyntheticDiamonds = "Synthetic Diamonds", 
	SyntheticGems = "Synthetic Gems", 
	SyntheticTequila = "Synthetic Tequila", 
	TPGPilotTrainingModule = "TPG Pilot Training Module", 
	TexturedVegetableProtein = "Textured Vegetable Protein", 
	ThermalImagers = "Thermal Imagers", 
	ThermalInsulatorTiles = "Thermal Insulator Tiles", 
	ThrustRegulators = "Thrust Regulators", 
	TunguskaMiningModule = "Tunguska Mining Module", 
	TurboCharger = "Turbo Charger", 
	UnassembledCargoCrates = "Unassembled Cargo Crates", 
	ValentRoboticComponents = "Valent Robotic Components", 
	VerasiSpecialtyFoods = "Verasi Specialty Foods", 
	VersaiKoffee = "Verasi Koffee", 
	VismetalCockpit = "Vismetal Cockpit", 
	WasteTreatmentChemicals = "Waste Treatment Chemicals", 
	XangXiAdvancedRobotics = "Xang Xi Advanced Robotics", 
	XangXiWasteContainer = "Xang Xi Waste Container", 
	OrunProcessor = "Orun Processor", 
	ArtemisProcessor = "Artemis Processor", 
	DentekProcessor = "Dentek Processor", 
	GuardianProcessor = "Guardian Processor", 
	QueenProcessor = "Queen Processor", 
	QueenDefense = "Queen Defense Matrix", 
	LeviathanDecision = "Leviathan Decision Network", 
	LeviathanProduction = "Leviathan Production Network", 
	LeviathanEvolution = "Leviathan Genetics Network", 
	LeviathanDefense = "Leviathan Defense Matrix", 
	Blaster03MkIV = "Valent Neutron Accelerator", 
	Blaster03MkV = "Corvus Widowmaker", 
	StunLauncher01 = "Xang Xi Self-Propelled Concussion Launcher", 
	AxiaCannon01 = "Axia Inversion-Charged Cannon", 
	MineLauncher03 = "BioCom Miniature Teller-Ulam Mine", 
}
medit.db.itemtype_r = {
	["Advanced Logistics System"] = "AdvancedLogisticsSystem", 
	["Aeolus Pilot Training Unit"] = "AeolusPilotTrainingUnit", 
	["Agricultural Research Supplies"] = "AgriculturalResearchSupplies", 
	["Airlock Maintenance Supplies"] = "AirlockMaintenanceSupplies", 
	["Amplification Module"] = "AmplificationModule", 
	["Basic Research Supplies"] = "BasicResearchSupplies", 
	["Basic Robotic Equipment"] = "BasicRoboticEquipment", 
	["Bearing Grease"] = "BearingGrease", 
	["Betheshee Spices"] = "BethesheeSpices", 
	["BioCom Implants"] = "BioComImplants", 
	["Biomedical Nanites"] = "BiomedicalNanites", 
	["Biotechnology Research Supplies"] = "BiotechnologyResearchSupplies", 
	["Blank DataPads"] = "BlankDataPads", 
	["Chemical Spill Kit"] = "ChemicalSpillKit", 
	["Combat Simulators"] = "CombatSimulators", 
	["Commercial Textiles"] = "CommercialTextiles", 
	["Cooking Supplies"] = "CookingSupplies", 
	["Coolant"] = "Coolant", 
	["Corvus Holo Disks"] = "CorvusHoloDisks", 
	["Corvus Textiles"] = "CorvusTextiles", 
	["Cybernetics Grade AA"] = "CyberneticsGradeAA", 
	["Cybernetics Grade BB"] = "CyberneticsGradeBB", 
	["Cybernetics Grade EE"] = "CyberneticsGradeEE", 
	["Data Link Connectors"] = "DataLinkConnectors", 
	["Dau Spices"] = "DauSpices", 
	["Dau Wine"] = "DauWine", 
	["Deneb Rum"] = "DenebRum", 
	["Diagnostic Imagers"] = "DiagnosticImagers", 
	["Divinia Spices"] = "DiviniaSpices", 
	["Doppler Array"] = "DopplerArray", 
	["Dried Meat"] = "DriedMeat", 
	["EC-Class Ship Repair Manual"] = "ECClassShipRepairManual", 
	["Emergency Repair Kit"] = "EmergencyRepairKit", 
	["Energy Conversion Module"] = "EnergyConversionModule", 
	["Engine Mounts"] = "EngineMounts", 
	["Escape Hatch System"] = "EscapeHatchSystem", 
	["Exhaust Manifold"] = "ExhaustManifold", 
	["External Equipment Mounts"] = "ExternalEquipmentMounts", 
	["External Thermal Couplers"] = "ExternalThermalCouplers", 
	["Extravehicular Suits"] = "ExtravehicularSuits", 
	["Fine China"] = "FineChina", 
	["Fine Furniture"] = "FineFurniture", 
	["Fire-suppression system"] = "Firesuppressionsystem", 
	["Fitness Equipment"] = "FitnessEquipment", 
	["Flight Assist Control Module"] = "FlightAssistControlModule", 
	["Frequency Modulators"] = "FrequencyModulators", 
	["Fresh Flowers"] = "FreshFlowers", 
	["Fuel Flow Regulator"] = "FuelFlowRegulator", 
	["Fuel Storage Container"] = "FuelStorageContainer", 
	["Guided Missile Casings"] = "GuidedMissileCasings", 
	["Gyroscopes"] = "Gyroscopes", 
	["Holo Disks"] = "HoloDisks", 
	["Hull Panels"] = "HullPanels", 
	["Hydraulic Tappets"] = "HydraulicTappets", 
	["Hydrogen Ion Collector"] = "HydrogenIonCollector", 
	["Cooling Systems"] = "IndustrialCooling", 
	["Ion Core"] = "IndustrialIonCore", 
	["Oxygen Recycling System"] = "IndustrialOxygenRecycler", 
	["Phase Array"] = "IndustrialPhaseArray", 
	["Plasma Core"] = "IndustrialPlasmaCore", 
	["Power Regulators"] = "IndustrialPowerRegulators", 
	["Stabilizing Systems"] = "IndustrialStabilizers", 
	["Basic Targeting Systems"] = "IndustrialTargeting", 
	["Advanced Targeting Systems"] = "IndustrialTargeting2", 
	["Manufacturing Tools"] = "IndustrialTools", 
	["ERS Tracking Systems"] = "IndustrialTracking", 
	["Industrial Research Supplies"] = "IndustrialresearchSupplies", 
	["Ineubis Automated Defense Unit"] = "IneubisAutomatedDefenseUnit", 
	["Ineubis Personal Defense Systems"] = "IneubisPersonalDefenseSystems", 
	["Instrumentation Panel"] = "InstrumentationPanel", 
	["Itani Education Disk Level M"] = "ItaniEducationDiskLevelM", 
	["Itani Education Disk Level N"] = "ItaniEducationDiskLevelN", 
	["Itani Education Disk Level O"] = "ItaniEducationDiskLevelO", 
	["Janitorial Supplies"] = "JanitorialSupplies", 
	["LCD"] = "LCD", 
	["Life Support System"] = "LifeSupportSystem", 
	["Magnetometer"] = "Magnetometer", 
	["Meditation Crystals"] = "MeditationCrystals", 
	["Metana Sweets"] = "MentanaSweets", 
	["Military Research Supplies"] = "MilitaryResearchSupplies", 
	["Mineral Assay Equipment"] = "MineralAssayEquipment", 
	["Nanite Modulators"] = "NaniteModulators", 
	["Nanite Replicator"] = "NaniteReplicator", 
	["Navigation Unit"] = "NavigationUnit", 
	["Neural Nodule"] = "NeuralNodule", 
	["Optics"] = "Optics", 
	["Premium Aquean Ore"] = "Ore2Aquean", 
	["Premium Carbonic Ore"] = "Ore2Carbonic", 
	["Premium Ferric Ore"] = "Ore2Ferric", 
	["Premium Ishik Ore"] = "Ore2Ishik", 
	["Premium Silicate Ore"] = "Ore2Silicate", 
	["Premium VanAzek Ore"] = "Ore2VanAzek", 
	["Premium Xithricite Ore"] = "Ore2Xithricite", 
	["Apicene Ore"] = "OreApicene", 
	["Aquean Ore"] = "OreAquean", 
	["Carbonic Ore"] = "OreCarbonic", 
	["Denic Ore"] = "OreDenic", 
	["Ferric Ore"] = "OreFerric", 
	["Heliocene Ore"] = "OreHeliocene", 
	["Ishik Ore"] = "OreIshik", 
	["Purified Xithricite Ore"] = "OreItani", 
	["Lanthanic Ore"] = "OreLanthanic", 
	["Pentric Ore"] = "OrePentric", 
	["Pyronic Ore"] = "OrePyronic", 
	["Purified Xithricite Ore"] = "OreSerco", 
	["Silicate Ore"] = "OreSilicate", 
	["Purified Xithricite Ore"] = "OreUIT", 
	["VanAzek Ore"] = "OreVanAzek", 
	["Xithricite Ore"] = "OreXithricite", 
	["Orion Drill Bits"] = "OrionDrillBits", 
	["Orion Extractor Component"] = "OrionExtractorComponent", 
	["Scrap Metal"] = "OtherScrap", 
	["Outer Hull Plate "] = "OuterHullPlate", 
	["Pelatus Spices"] = "PelatusSpices", 
	["Pharmaceuticals"] = "Pharmaceuticals", 
	["Pherona Spices"] = "PhernoaSpices", 
	["Pilot Safety Harness"] = "PilotSafetyHarness", 
	["Plasma Torches"] = "PlasmaTorches", 
	["Pressure Relief Valves"] = "PressureReliefValves", 
	["Personal Defense Systems"] = "ProductDefense", 
	["Consumer Electronics"] = "ProductElectronics", 
	["Luxury Goods"] = "ProductLuxury", 
	["Medical Supplies"] = "ProductMedical", 
	["MicroTech Replicator"] = "ProductReplicator", 
	["Consumer Robotics"] = "ProductRobotics", 
	["Civilian Textiles"] = "ProductTextiles", 
	["Propellant Actuators"] = "PropellantActuators", 
	["Protective Outerwear"] = "ProtectiveOuterwear", 
	["Quantitative Analysis Equipment"] = "QuantitativeAnalysisEquipment", 
	["Radiation Containment Kit"] = "RadiationContainmentKit", 
	["Rare Book"] = "RareBooks", 
	["Recycled Plastic"] = "RecycledPlastic", 
	["NanoPigments"] = "Refined2NanoPigments", 
	["Organic Solvents"] = "Refined2OrganoSolvents", 
	["Plasteel"] = "Refined2Plasteel", 
	["Simple Plastics"] = "Refined2Plastics", 
	["Silksteel"] = "Refined2Silksteel", 
	["SynthWood"] = "Refined2SynthWood", 
	["Vismetal"] = "Refined2Vismetal", 
	["Corrosive Chemicals"] = "RefinedChemCorrosive", 
	["Inert Chemicals"] = "RefinedChemInert", 
	["Volatile Chemicals"] = "RefinedChemVolatile", 
	["Dyes"] = "RefinedDyes", 
	["Food"] = "RefinedFood", 
	["Synthetic Hydrocarbons"] = "RefinedHydrocarbons", 
	["NanoFeed"] = "RefinedNanoFeed", 
	["Precious Metals"] = "RefinedPreciousMetals", 
	["Steel"] = "RefinedSteel", 
	["Purified Water"] = "RefinedWater", 
	["XiRite Alloy"] = "RefinedXiRite", 
	["Refugee Support Kit"] = "RefugeeSupportKit", 
	["Replacement Hydraulic Fluid"] = "ReplacementHydraulicFluid", 
	["Samoflange"] = "Samoflange", 
	["Scanner Circuit Boards"] = "ScannerCircuitBoards", 
	["Sedina Chocolates"] = "SedinaChocolates", 
	["Serco Ale"] = "SercoAle", 
	["Serco Cybernetic Implants"] = "SercoCyberneticImplants", 
	["Serco Training Level V"] = "SercoTrainingLevelV", 
	["Serco Training Level VI"] = "SercoTrainingLevelVI", 
	["Serco Training Level VII"] = "SercoTrainingLevelVII", 
	["Ship Paint"] = "ShipPaint", 
	["Solid Explosives"] = "SolidExplosives", 
	["Solid Fuel Packs"] = "SolidFuelPacks", 
	["Station Conduit"] = "StationConduit", 
	["Storage Container"] = "Storage", 
	["Superconductors"] = "Superconductors", 
	["Surveillance Equipment"] = "SurveillanceEquipment", 
	["Synthetic Diamonds"] = "SyntheticDiamonds", 
	["Synthetic Gems"] = "SyntheticGems", 
	["Synthetic Tequila"] = "SyntheticTequila", 
	["TPG Pilot Training Module"] = "TPGPilotTrainingModule", 
	["Textured Vegetable Protein"] = "TexturedVegetableProtein", 
	["Thermal Imagers"] = "ThermalImagers", 
	["Thermal Insulator Tiles"] = "ThermalInsulatorTiles", 
	["Thrust Regulators"] = "ThrustRegulators", 
	["Tunguska Mining Module"] = "TunguskaMiningModule", 
	["Turbo Charger"] = "TurboCharger", 
	["Unassembled Cargo Crates"] = "UnassembledCargoCrates", 
	["Valent Robotic Components"] = "ValentRoboticComponents", 
	["Verasi Specialty Foods"] = "VerasiSpecialtyFoods", 
	["Verasi Koffee"] = "VersaiKoffee", 
	["Vismetal Cockpit"] = "VismetalCockpit", 
	["Waste Treatment Chemicals"] = "WasteTreatmentChemicals", 
	["Xang Xi Advanced Robotics"] = "XangXiAdvancedRobotics", 
	["Xang Xi Waste Container"] = "XangXiWasteContainer", 
	["Orun Processor"] = "OrunProcessor", 
	["Artemis Processor"] = "ArtemisProcessor", 
	["Dentek Processor"] = "DentekProcessor", 
	["Guardian Processor"] = "GuardianProcessor", 
	["Queen Processor"] = "QueenProcessor", 
	["Queen Defense Matrix"] = "QueenDefense", 
	["Leviathan Decision Network"] = "LeviathanDecision", 
	["Leviathan Production Network"] = "LeviathanProduction", 
	["Leviathan Genetics Network"] = "LeviathanEvolution", 
	["Leviathan Defense Matrix"] = "LeviathanDefense", 
	["Valent Neutron Accelerator"] = "Blaster03MkIV", 
	["Corvus Widowmaker"] = "Blaster03MkV", 
	["Xang Xi Self-Propelled Concussion Launcher"] = "StunLauncher01", 
	["Axia Inversion-Charged Cannon"] = "AxiaCannon01", 
	["BioCom Miniature Teller-Ulam Mine"] = "MineLauncher03", 
}

medit.db.tradegoods = {
	any = "Anything", 
	banana = "Bananas", 
	oil = "Oil", 
    dye = "Dyes", 
    spices = "Spices", 
    wheat = "Wheat", 
    corn = "Corn", 
    enough = "Ok, enough of that", 
}

medit.db.ore = {
	any = "Any ore", 
	OreAquean = "(Basic) - Aquean Ore", 
	OreCarbonic = "(Basic) - Carbonic Ore", 
	OreFerric = "(Basic) - Ferric Ore", 
	OreIshik = "(Basic) - Ishik Ore", 
	Ore2Aquean = "(Basic) - Premium Aquean Ore", 
	Ore2Carbonic = "(Basic) - Premium Carbonic Ore", 
	Ore2Ferric = "(Basic) - Premium Ferric Ore", 
	Ore2Ishik = "(Basic) - Premium Ishik Ore", 
	Ore2Silicate = "(Basic) - Premium Silicate Ore", 
	Ore2VanAzek = "(Basic) - Premium VanAzek Ore", 
	Ore2Xithricite = "(Basic) - Premium Xithricite Ore", 
	OreSilicate = "(Basic) - Silicate Ore", 
	OreVanAzek = "(Basic) - VanAzek Ore", 
	OreXithricite = "(Basic) - Xithricite Ore", 
	OreApicene = "(Rare) - Apicene Ore", 
	OreDenic = "(Rare) - Denic Ore", 
	OreHeliocene = "(Rare) - Heliocene Ore", 
	OreLanthanic = "(Rare) - Lanthanic Ore", 
	OrePentric = "(Rare) - Pentric Ore", 
	OrePyronic = "(Rare) - Pyronic Ore", 
}
medit.db.ore_r = {
	["Any ore"] = "any", 
	["(Basic) - Aquean Ore"] = "OreAquean", 
	["(Basic) - Carbonic Ore"] = "OreCarbonic", 
	["(Basic) - Ferric Ore"] = "OreFerric", 
	["(Basic) - Ishik Ore"] = "OreIshik", 
	["(Basic) - Premium Aquean Ore"] = "Ore2Aquean", 
	["(Basic) - Premium Carbonic Ore"] = "Ore2Carbonic", 
	["(Basic) - Premium Ferric Ore"] = "Ore2Ferric", 
	["(Basic) - Premium Ishik Ore"] = "Ore2Ishik", 
	["(Basic) - Premium Silicate Ore"] = "Ore2Silicate", 
	["(Basic) - Premium VanAzek Ore"] = "Ore2VanAzek", 
	["(Basic) - Premium Xithricite Ore"] = "Ore2Xithricite", 
	["(Basic) - Silicate Ore"] = "OreSilicate", 
	["(Basic) - VanAzek Ore"] = "OreVanAzek", 
	["(Basic) - Xithricite Ore"] = "OreXithricite", 
	["(Rare) - Apicene Ore"] = "OreApicene", 
	["(Rare) - Denic Ore"] = "OreDenic", 
	["(Rare) - Heliocene Ore"] = "OreHeliocene", 
	["(Rare) - Lanthanic Ore"] = "OreLanthanic", 
	["(Rare) - Pentric Ore"] = "OrePentric", 
	["(Rare) - Pyronic Ore"] = "OrePyronic",
}