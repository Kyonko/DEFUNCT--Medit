--Ingame MissionEditor. Version stfu.
--Written by Scuba Steve 9.0
declare("MEdor", {})
function MEdor.FetchMission(num, ihandle)
	if(not ufuncs.web.loginCookie) then
		print("\127FFFFFF*** Please login first.")
		return
	end
	local page = ""
	local function SaveMission(lsock)
		page = page .. table.concat(lsock.rbuff, "")
		page = string.gsub(page, ".-{\"m\":{(.*)}", "{\"id\":"..num..",%1")
		ihandle.value = MEdor.ParseMish(page)
		lsock.rbuff = {}
	return
	end
	lsocks.http.urlopen("http://www.vendetta-online.com/x/missioned/load?id="..num, "GET", nil, SaveMission, ufuncs.web.loginCookie)
end

local function StageOne(mish, spaces)
	if(not spaces) then spaces = "" end
	mish = string.gsub(mish, "{(.*)(},?)", function(str, en)
												str = "{\n" --[[.. spaces]] .. StageOne(str, spaces .. "\t") .. "\n" --[[.. spaces ]].. en
												return str
											end)
	return mish
end

--This function causes a C-stack overflow. Fix it when/if wordwrap is available
local function StageTwo(mish)
	mish = string.gsub(mish, "{(.*)(},?)", function(str, en)
												str = "{" .. string.gsub(str, "[^}][\"%]]?,", ",\t") .. en
												return StageTwo(str)
											end)
	return mish
end
											
function MEdor.ParseMish(mish, spaces)
	mish = string.gsub(mish, "\r\n.-\r\n", "")
	--mish = string.gsub(mish, "\\\"", "\"")
	mish = StageOne(mish)
	mish = string.gsub(mish, "([\"%]]?),([\"%[{])", "%1,\n%2")
	--mish = StageTwo(mish)
	mish = string.gsub(mish, "\":([%[\"])", "\" : %1")
	return mish
end

function MEdor.UnparseMish(mash)
	mash = string.gsub(mash, "[\n\t]", "")
	mash = string.gsub(mash, " : ", ":")
	return mash
end

--UI crap.
MEdor.ui = {}

MEdor.ui.user = iup.text {  value = "", EXPAND = "HORIZONTAL", }
MEdor.ui.pass = iup.text {  value = "", password = "YES", expand = "HORIZONTAL",}
MEdor.ui.loginbutton = iup.stationbutton { title = "Okay" }
MEdor.ui.cancelbutton = iup.stationbutton { title = "Cancel" }

MEdor.ui.usertext = iup.hbox {
	iup.label { title = "Username: " },
	MEdor.ui.user;
	Alignment = "ACENTER",
	expand = "HORIZONTAL", 
	size = "230x"
}
MEdor.ui.passtext = iup.hbox {
	iup.label { title = "Password:  "},
	MEdor.ui.pass;
	Alignment = "ACENTER",
	expand = "HORIZONTAL",
	size = "230x"
}
MEdor.ui.logbox = iup.pdarootframe {
	iup.pdasubframebg {
		iup.vbox {
			iup.label { title = "Login", font = 46},
			iup.fill{10},
			MEdor.ui.usertext,
			MEdor.ui.passtext,
			iup.hbox {
				MEdor.ui.loginbutton,
				MEdor.ui.cancelbutton;
				alignment = "ARIGHT"
			}
		};
		expand = "BOTH"
	}
}

MEdor.ui.logdlg = iup.dialog {
	MEdor.ui.logbox;
	BORDER="NO", 
	topmost = "YES", 
	RESIZE="NO", 
	MAXBOX="NO", 
	MINBOX="NO", 
	MENUBOX="NO",
	MODAL="YES",
}

function MEdor.ui.cancelbutton:action()
	MEdor.ui.logdlg:hide()
	MEdor.ui.pass.value = ""
end

function MEdor.ui.loginbutton:action()
	MEdor.ui.logdlg:hide()
	print("\127FFFFFF*** Mission Editor is logging in...please wait...")
	ufuncs.web.VOLogin(MEdor.ui.user.value, MEdor.ui.pass.value)
	MEdor.timer = Timer()
	local retry = 100
	MEdor.timer:SetTimeout(50, function()
								retry = retry - 1
								if(retry == -1) then print("\127FFFFFF*** Unable to login to VO webserver.") return end
								if(not ufuncs.web.loginCookie or not ufuncs.web.loginCookie.session) then
									MEdor.timer:SetTimeout(50)
									return
								else
									print("\127FFFFFF*** Mission Editor logged in successfully.")
									MEdor.ui.open()
								end
							end)
	
end

MEdor.ui.mishnum = iup.text { title = "Enter your mission number here." }
MEdor.ui.getmish = iup.stationbutton { title = "Get Mission" }
MEdor.ui.mishentry = iup.pdasubsubsubmultiline { size = "670x800", wordwrap = "NO" }
MEdor.ui.closeb = iup.stationbutton { title = "Close Editor" }
MEdor.ui.saveb = iup. stationbutton { title = "Save Current Mission" }

MEdor.ui.box = iup.pdarootframe {
	iup.pdasubframebg {
		iup.vbox{
			iup.hbox{
				iup.fill{},
				MEdor.ui.mishnum,
				MEdor.ui.getmish
			},
			iup.fill{10},
			MEdor.ui.mishentry,
			iup.hbox{	
				MEdor.ui.closeb,
				iup.fill{},
				MEdor.ui.saveb,
			}	
		}
	}
}


MEdor.ui.dlg = iup.dialog {
	MEdor.ui.box;
	BORDER="NO", 
	topmost = "YES", 
	RESIZE="NO", 
	MAXBOX="NO", 
	MINBOX="NO", 
	MENUBOX="NO",
	size = "700x900",
	MODAL="YES",
}

function MEdor.ui.open()
	MEdor.ui.dlg:show()
end

function MEdor.ui.closeb:action()
	MEdor.ui.dlg:hide()
	ufuncs.web.loginCookie = nil
end

function MEdor.ui.getmish:action()
	MEdor.ui.mishentry.value = ""
	MEdor.FetchMission(tonumber(MEdor.ui.mishnum.value), MEdor.ui.mishentry)
	print("\127FFFFFF*** Mission should appear in edit box once loaded.")
	return
end

function MEdor.ui.saveb:action()
	local SaveMissionRemote = function(...)
		console_print("\127FFFFFF*** Remote server returned:")
		ufuncs.printtable_r({...})
	end
	local mash = MEdor.UnparseMish(MEdor.ui.mishentry.value)
	lsocks.http.urlopen("http://www.vendetta-online.com/x/missioned/save"--[[?id="..MEdor.ui.mishnum.value]], "POST", {m = mash}, SaveMissionRemote, ufuncs.web.loginCookie)
	
	return
end
