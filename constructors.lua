--Mission editor UI constructors. For constructing the UI.
--Not construing it.

function medit.con.MakeFactionDrop(action)
	local facdrop = iup.list { dropdown = "YES", readonly = "YES" }
	ufuncs.PushListItem(facdrop, "-faction-")
	for k, v in pairs(medit.db.faction) do
		ufuncs.PushListItem(facdrop, v)
	end
	facdrop:action_cb = action
	return facdrop
end

function medit.con.MakeMajorFactionDrop(action)
	local facdrop = iup.list { dropdown = "YES", readonly = "YES" }
	ufuncs.PushListItem(facdrop, "-faction-")
	for k, v in pairs(medit.db.majorfaction) do
		ufuncs.PushListItem(facdrop, v)
	end
	facdrop:action_cb = action
	return facdrop
end

function medit.con.MakeSystemDrop(action)
	local sysdrop = iup.list { dropdown = "YES", readonly = "YES" }
	ufuncs.PushListItem(sysdrop, "-system-")
	for k, v in pairs(medit.db.system) do
		ufuncs.PushListItem(sysdrop, v)
	end
	sysdrop:action_cb = action
	return sysdrop
end

function medit.con.MakeStationClassDrop(action)
	local statdrop = iup.list { dropdown = "YES", readonly = "YES" }
	ufuncs.PushListItem(sysdrop, "-stationclass-")
	for k, v in pairs(medit.db.stationclass) do
		ufuncs.PushListItem(statdrop, v)
	end
	statdrop:action_cb = action
	return statdrop
end

function medit.con.MakeNPCTypeDrop(action)
	local npcdrop = iup.list { dropdown = "YES", readonly = "YES" }
	ufuncs.PushListItem(npcdrop, "-npctype-")
	for k, v in pairs(medit.db.npctype) do
		ufuncs.PushListItem(npcdrop, v)
	end
	npcdrop:action_cb = action
	return npcdrop
end

function medit.con.MakeSpawnTypeDrop(action)
	local spawn = iup.list { dropdown = "YES", readonly = "YES" }
	ufuncs.PushListItem(spawn, "-spawntype-")
	for k, v in pairs(medit.db.spawntype) do
		ufuncs.PushListItem(spawn, v)
	end
	spawn:action_cb = action
	return spawn
end

function medit.con.MakeItemTypeDrop(action)
	local itemt = iup.list { dropdown = "YES", readonly = "YES" }
	ufuncs.PushListItem(itemt, "-itemtype-")
	for k, v in pairs(medit.db.itemtype) do
		ufuncs.PushListItem(itemt, v)
	end
	itemt:action_cb = action
	return itemt
end

function medit.con.MakeOreDrop(action)
	local ore = iup.list { dropdown = "YES", readonly = "YES" }
	ufuncs.PushListItem(ore, "-ore-")
	for k, v in pairs(medit.db.ore) do
		ufuncs.PushListItem(ore, v)
	end
	ore:action_cb = action
	return ore
end

function medit.con.MakeSmallWeaponDrop(action)
	local small = iup.list { dropdown = "YES", readonly = "YES" }
	ufuncs.PushListItem(small, "-smallweapon-")
	for k, v in pairs(medit.db.smallweapon) do
		ufuncs.PushListItem(small, v)
	end
	small:action_cb = action
	return small
end

function medit.con.MakeLargeWeaponDrop(action)
	local large = iup.list { dropdown = "YES", readonly = "YES" }
	ufuncs.PushListItem(large, "-largeweapon-")
	for k, v in pairs(medit.db.largeweapon) do
		ufuncs.PushListItem(large, v)
	end
	large:action_cb = action
	return large
end

function medit.con.MakeFactionThreshDrop(action)
	local facthresh = iup.list { dropdown = "YES", readonly = "YES" }
	ufuncs.PushListItem(facthresh, "-factionthresh-")
	for k, v in pairs(medit.db.factionthresh) do
		ufuncs.PushListItem(facthresh, v)
	end
	facthresh:action_cb = action
	return facthresh
end

function medit.con.MakeSectorTypeDrop(action)
	local sectype = iup.list { dropdown = "YES", readonly = "YES" }
	ufuncs.PushListItem(sectype, "-sectortype-")
	for k, v in pairs(medit.db.sectype) do
		ufuncs.PushListItem(sectype, v)
	end
	sectype:action_cb = action
	return sectype
end

function medit.db.MakeCharacterDrop(action)
	local char = iup.list { dropdown = "YES", readonly = "YES" }
	ufuncs.PushListItem(char, "-character-")
	for k, v in pairs(medit.db.character) do
		ufuncs.PushListItem(char, v)
	end
	char:action_cb = action
	return char
end
