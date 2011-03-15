local function UpdateStatLabel(label, stat)
	label.title = stat
	iup.Refresh(iup.GetDialog(label))
end
local mishnum = iup.text { title = "Enter your mission number here." }
local getmish = iup.stationbutton { title = "Get Mission" }
local closeb = iup.stationbutton { title = "Close Editor" }
local saveb = iup.stationbutton { title = "Save Current Mission" }
medit.mission = iup.pdasubsublist { size = "500x500", expand = "BOTH", control="YES" }
local mishstat = iup.label { title = "Welcome to Medit."}

medit.medbox = iup.vbox {
}
--Block of copypasta for testing purposes.
medit.con.make_time(medit.con.timeCB, medit.mission)
medit.con.make_time(medit.con.timeCB, medit.mission)
medit.con.make_time(medit.con.timeCB, medit.mission)
medit.con.make_time(medit.con.timeCB, medit.mission)
medit.con.make_time(medit.con.timeCB, medit.mission)
medit.con.make_time(medit.con.timeCB, medit.mission)
medit.con.make_time(medit.con.timeCB, medit.mission)
medit.con.make_time(medit.con.timeCB, medit.mission)
medit.con.make_time(medit.con.timeCB, medit.mission)
medit.con.make_time(medit.con.timeCB, medit.mission)
medit.con.make_time(medit.con.timeCB, medit.mission)
medit.con.make_time(medit.con.timeCB, medit.mission)
medit.con.make_time(medit.con.timeCB, medit.mission)
medit.con.make_time(medit.con.timeCB, medit.mission)
medit.con.make_time(medit.con.timeCB, medit.mission)
medit.con.make_time(medit.con.timeCB, medit.mission)
medit.con.make_time(medit.con.timeCB, medit.mission)
medit.con.make_time(medit.con.timeCB, medit.mission)
medit.con.make_time(medit.con.timeCB, medit.mission)
medit.con.make_time(medit.con.timeCB, medit.mission)
medit.con.make_time(medit.con.timeCB, medit.mission)
medit.con.make_time(medit.con.timeCB, medit.mission)
medit.meddlg = iup.dialog {
	medit.medbox;
	BORDER="NO", 
	MENUBOX="NO", 
	RESIZE="NO",
	ACTIVE="NO",
	EXPAND="BOTH",
	SHRINK = "YES",
	BGCOLOR = "0 0 0 0 +"
}

iup.Append(medit.mission, medit.meddlg)

local editbox = iup.pdarootframe {
	iup.pdasubframebg {
		iup.vbox{
			iup.hbox{
				mishstat,
				iup.vbox {
					iup.hbox {
						iup.fill{},
						mishnum,
						getmish;
						alignment = "ARIGHT"
					}
				}
			},
			medit.mission,
			iup.hbox{	
				closeb,
				iup.fill{},
				saveb,
			}
		};
	}
}

local editdlg = iup.dialog {
	editbox;
	BORDER="NO", 
	topmost = "YES", 
	RESIZE="NO", 
	MAXBOX="NO", 
	MINBOX="NO", 
	MENUBOX="NO",
	MODAL="YES",
	DEFAULTESC = closeb
}


local user = iup.text {  value = "", EXPAND = "HORIZONTAL", }
local pass = iup.text {  value = "", password = "YES", expand = "HORIZONTAL",}
local loginbutton = iup.stationbutton { title = "Okay" }
local cancelbutton = iup.stationbutton { title = "Cancel" }
local status = iup.label { title = "", }

local usertext = iup.hbox {
	iup.label { title = "Username: " },
	user;
	Alignment = "ACENTER",
	size = "230x"
}
local passtext = iup.hbox {
	iup.label { title = "Password:  "},
	pass;
	Alignment = "ACENTER",
	size = "230x"
}
local logbox = iup.pdarootframe {
	iup.pdasubframebg {
		iup.vbox {
			iup.hbox {
				iup.fill {size = 300}
			},
			iup.label { title = "Login", font = 46},
			iup.fill{size = 10},
			usertext,
			passtext,
			status,
			iup.hbox {
				loginbutton,
				iup.fill{},
				cancelbutton;
			};
			alignment = "ACENTER",
		};
		margin = "5x5"
	}
}

local logdlg = iup.dialog {
	logbox;
	BORDER="NO", 
	topmost = "YES", 
	RESIZE="NO", 
	MAXBOX="NO", 
	MINBOX="NO", 
	MENUBOX="NO",
	MODAL="YES",
	DEFAULTENTER = loginbutton,
	DEFAULTESC = cancelbutton
}
	

local function CloseLogin()
	HUD.dlg.active = "NO"
	logdlg:hide()
	pass.value = ""
	status.title = ""
end

local function OpenEditor()
	HUD.dlg.active = "NO"
	editdlg:show()
end

local function OpenLogin()
	if(ufuncs.web.loginCookie and ufuncs.web.loginCookie.session) then
		OpenEditor()
	else
		HUD.dlg.active = "NO"
		logdlg:show()
	end
	medit.mission:repopulate()
end

function cancelbutton:action()
	HUD.dlg.active = "YES"
	CloseLogin()
end

function loginbutton:action()
	ufuncs.web.VOLogin(user.value, pass.value)
	UpdateStatLabel(status, "Logging into VO server...")
	medit.timer = Timer()
	local retry = 100
	medit.timer:SetTimeout(50, function()
								retry = retry - 1
								if(retry == -1) then
									UpdateStatLabel(status, "Could not connect.")
									return 
								end
								if(ufuncs.web.loginCookie and ufuncs.web.loginCookie.err) then
									if(ufuncs.web.loginCookie.err == 200) then
										UpdateStatLabel(status, "Invalid username/password")
									end
									return
								end
								if(not ufuncs.web.loginCookie or not ufuncs.web.loginCookie.session) then
									medit.timer:SetTimeout(50)
									return
								else
									CloseLogin()
									OpenEditor()
									print("\127FFFFFFLogged in successfully")
								end
							end)
end

function closeb:action()
	medit.mission[1] = nil
	mishnum = ""
	HUD.dlg.active = "YES"
	editdlg:hide()
end

function getmish:action()
	local num = tonumber(mishnum.value)
	if(not num or num == "") then
		UpdateStatLabel(mishstat, "Invalid mission number.")
	end
	medit.GetMish(num, medit.medbox, mishstat)
	if(medit.mish.result == "Can't find " .. num) then
		UpdateStatLabel(mishstat, medit.mish.result)
	end
end

--This function builds a mission from scratch and passes the result to the medit display
function medit.Render(mish)
end

--This function clears a mission.
function medit.Reset()
	print(mishnum.value)
end

RegisterUserCommand("medit", OpenLogin)
