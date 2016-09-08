------------------------------------------------------------
------------------------------------------------------------
--------------------Skripty Rebela--------------------------
-----------------Chyby hlašte na GitHubu--------------------
-------------------Tam Najdete i navod----------------------
------------------www. GITHUB.  TODO  ----------------------
------------------------------------------------------------
------------------------------------------------------------






--
-- Todo: 	- Otestovat
--
--
--
----------------------------------------------------------------------------
-- Config

Save_key = "S"
End_key  = "E"
----------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Globals


----------------------------------------------------------------------------

main()


function main()
Uo.SysMsg("---------------")
UO.SysMsg("Zacatek Skriptu")
Uo.SysMsg("---------------")
local nYear,nMonth,nDay,nDayOfWeek 			= getdate()
local nHour, nMinute, nSecond, nMillisec 	= gettime()
local File_Name 							= "Route_"..nDay.."/"..nMonth.."_"..nHour..":"..nSeconds
local file 									= io.open(File_Name,"w+")
local pos_count 							= 0
local x,y,z,lx,ly,lz

while true do
	if getkey(Save_key) and getkey("CTRL") and then
		x = UO.CharPosX
		y = UO.CharPosY
		z = UO.CharPosZ
		if (lx~=x and ly~=y and lz~=z) then
			file:write("["..x..","..y","..z.."]") 
			lx = UO.CharPosX
			ly = UO.CharPosY
			lz = UO.CharPosZ
			pos_count = pos_count + 1
			UO.SysMsg("Saving Pos(.."pos_count"..): ["..x..","..y..","..z.."]") -- \n Vyhodit Novy radek? 
		end
	end
	if getkey(End_key) and getkey("CTRL") then
		break
	end
end 

file:close
Uo.SysMsg("-------------")
UO.SysMsg("Konec Skriptu")
Uo.SysMsg("-------------")
stop()

end



