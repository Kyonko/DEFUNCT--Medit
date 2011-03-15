--Mission Editor plugin.
declare("medit", {})
medit.VERSION = "1.3.0"
ufuncs.require "db"
ufuncs.require "constructors"
ufuncs.require "ui"
local function UpdateStatLabel(label, stat)
	label.title = stat
	iup.Refresh(iup.GetDialog(label))
end

function medit.GetMish(num, parent, statlabel)
	if(not ufuncs.web.loginCookie) then
		UpdateStatLabel(statlabel, "Please login first.")
		return
	end
	statlabel.title = "Fetching mission..."
	local function ImportMission(lsock, err)
		if(err) then 
			UpdateStatLabel(statlabel, "Unable to load.")
			return 
		end
		medit.Reset()
		UpdateStatLabel(statlabel, "Loading mission...")
		--Read the http response from rbuff
		local page = lsock:BufferRead()
		--Strip out everything that isn't the mission
		page = string.gsub(page, ".-({.*})", "%1")
		page = string.gsub(page, ".-\"m\":(%{.*%})%}", "%1")
		page = string.gsub(page, "\r\n.-\r\n", "")
		page = string.gsub(page, "\r\n", "")
		--Convert the mission from JSON to lua
		medit.mish = json.decode(page)
		--Render the mission
		medit.Render(medit.mish)
		
	end
	lsocks.http.urlopen("http://www.vendetta-online.com/x/missioned/load?id="..num, "GET", nil, ImportMission, ufuncs.web.loginCookie)
end

function medit.SaveMish(num, mish, statlabel)
	if(not ufuncs.web.loginCookie) then
		UpdateStatLabel(statlabel, "Please login first.")
		return
	end
	statlabel.title = "Saving mission..."
	local function ExportMission(lsock, err)
		if(err) then 
			UpdateStatLabel(statlabel, "Unable to save.")
			return 
		end
		local page = lsock:BufferRead()
		--Strip the HTTP out of the response from the server.
		page = string.gsub(page, ".-(%{.*%})", "%1")
		page = string.gsub(page, "\r\n.-\r\n", "")
		page = string.gsub(page, "\r\n", "")
		local resp = json.decode(page)
		UpdateStatLabel(statlabel, resp.result)
	end
	mish.id = num
	local mash = json.encode(mish)
	lsocks.http.urlopen("http://www.vendetta-online.com/x/missioned/save", "POST", {m = mash}, ExportMission, ufuncs.web.loginCookie)
end

--This is the function that controls the mission's internal tables and states
function medit.host()
end



