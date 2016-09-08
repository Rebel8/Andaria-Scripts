-----------------------------------------------------
-----------------------------------------------------
-----------------Skripty Rebela----------------------
--------------Chyby hlašte na GitHubu----------------
----------------Tam Najdete i navod------------------
---------------www. GITHUB.  TODO  ------------------
-----------------------------------------------------
-----------------------------------------------------






-- Kroužky, bandy (100), umyvadlo, GH, mec/dyka?
--
-- Todo: 	- Zakladni Struktura
--			- Check Trvale Promenne? - config? Vytvorit?
--
--
--	Features:	- find targ											
--				- catch targ										
--				- cesta kde hleda (Asi thyr)						
--				- kill targ											
--				- // nasrani? - provokace							
--				- vykuchat											
--				- loot												
--				- gain?												
--				- menu												
--				- heal bandama kdyz beha							
--				- heal GH											
--				- // Hid kdy beha									
--				- scan prostredi - Moc targetu (					
--				- Check zakladni veci (+ durky)						
--				- 
--
--
--
--		Napady: - Status (war, peace, heal, atd, Timing)
-- 				- config? Vytvorit?
--				- Aktualni Verze? - check web?
--
--
--
--		Podpurny Skripty:   - OpenFile > Get_Route > [x,y,z]
--							- Save_Route > [x,y,z]
--							- 
--							- 
--
----------------------------------------------------------------------------
dofile("FluentUO.lua")
-- Globals

LTargetNID = 0
-- TODO: Array? Table na vyber Monster? (spíš projít prostøedí všechno a zvažovat jestli útoèit nebo ne)
TargetNIDs = {Cislo,Cislo,Cislo} -- TODO



----------------------------------------------------------------------------
--Main
function main()
	while true do -- TODO
		while not Find_Monster() do
			-- Todo go Route
			Move_Heal()
			Move_To_Loc(index) -- v nem by mel bejt location check
			Check_Obstacle() -- aby se nezasekl
		end 
		if UO.HP < UO.MaxHp then
			-- zastavi se aby se dohealoval
			repeat
				Move_Heal()
			until UO.HP < UO.MaxHp
		end
		-- TODO kill
		while true do 
			Monster_Info()
			-- If Neni info
			if Monster_Alive then -- Boolean v Moster_Info() - jestli najde v haldì nIndex - scanItems
				if FindCorpse() then -- slouzi k nalezeni nìjakého tìla na zemi
					LootCorpse() -- nebo co s ni chci dìlat (asi to kuchani :D )
					break
				else
					-- odhaleni skryteho?
					UO.macro(a,b)
					wait(1000)
				end
			end
			-- TODO dokud je Monster - zabijet a follovat
			Pathfind(x,y,z) -- pokud je vzdalenost velka
			--Check war status ; target chci zabit
			Check_Killing_Status() -- NID - Attack kdyz neni, boj kdy neni
			-- status?
		end
	end
end



----------------------------------------------------------------------------


function Setup_Check() 
-- Check Dostatek amroru

-- Chech Armor
	--Dostatek znalosti zbrane?

	-- Vypsat Co je nedoopraveny

-- Check Sword/dyka/(luk)? 
	-- UseHand? nejdriv?
	if (FindItemC(params)) then
		-- nasel
	else	
		-- nenasel
	end
	
-- Check dostatek Bandu
	-- Fce TODO
	if (FindItemC(params)) then
		-- nasel
	else	
		-- nenasel
	end
-- Check Umavydlo	
	if (FindItemC(params)) then 
		-- nasel
	else	
		-- nenasel
	end
-- Check Lecivaky
	if (FindItemC(params)) then
		-- nasel
	else	
		-- nenasel
	end
	return

end

----------------------------------------------------------------------------


function Menu_init()
-- TODO
-- init menu


-- menu by melo vypadat - Nejdriv bych chtìl aby jsem se tam zhobrazil ja a verze.
	-- Ja jako fotka Calis?
	-- Navrh papir ->
	
end

-- @param ... Pass it!
-- @usage local items = BLA
-- @return SOMETHING
function Menu_StartStop()
if start then
 	local x,y = Route_table[1][1] , Route_table[1][2]
 	local dist = 0
 	local b_switch = false
 	repeat 
 		dist = math.sqrt(math.pow(UO.CharPosX - x) + math.pow(UO.CharPosY - y))
 		if not b_switch then
 			b_switch = true
 			UO.SysMsg("Musíš být alespon 50 polí od první lokace.")
 			UO.SysMsg("První lokace:["..x..","..y.."]")
 		end
 	until (dist > 50)
else
-- TODO stop -> status a prepsat Menu Button

end
end

function Menu_RouteChange()
	-- Todo: Nacist soubor a check na distance 
	-- MenuButton was pressed - change dir - Pres windows? cesta?
	-- Nebo pres menu > s comboboxem
	
	-- SPATNE!
	
	openFile(FileName)
	--Distance
end

----------------------------------------------------------------------------


function Move_To_Loc(index)
-- TODO: vezme ze souboru dalsi souradnice()
	local x,y,z = 0,0,0
	x = Route_table[index][1]
	y = Route_table[index][2]
	z = Route_table[index][3]
	
	UO.Move(x,y,z,2) -- Check UO.move
	
	-- check mista
	if (x < UO.CharPosX + 3 and x > UO.CharPosX - 3 and y < UO.CharPosY + 3 and y > UO.CharPosY - 3) then
		Route_table[Index] = Route_table[Index] + 1
	end
	-- reset pri #Route_table == Route_table[Index]	
end




function Check_Obstacle()
-- TODO: smer kterym jde - jestli je tam static - dystak pouzit Pathfind
	-- LOW PRIOR
	
end





function Find_Monster()
-- TODO ScanItems - pøes repku? nebo kind? Type

Monster_table = World().WithType(1111,1111).Items
-- Sort podle Distance
-- SortByDist()


-- Tady je Item Halda - tu musim projít
for v,k in pairs(TABLE) do -- spatne
	bla,bla,bla = getitem(v) -- spatne
	for vk,kk in pairs(TargetNIDs) do 
		if nTypeID == vk then return v end
	end
end

end


function WaitForTarget(num)
	-- WaitForTarget
	if num ~= nil then
		local systime = mysystime()
		repeat 
			wait(1500)
		until UO.TargCurs == true or systime > systime + num;
	else
		UO.Macro(22,0)
	end
end


function Move_Heal()
-- heal pri pohybu - bandy
	if b_heal_status == true then
		--fce na journal - konec statusu
		if myjournal(MSG_FINISHED_BANDAGE) then
			b_heal_status = false
		else 
			if b_heal_systime + 10 > mysystime() then b_heal_status = false end
			return
		end
	end
	if UO.Hp < UO.MaxHp then
		-- pouzit bandaz
		UO.Macro(0,1,".obvaz")
		WaitForTarget()
		UO.Macro(23,0)
		b_heal_status = true -- status_heal
		b_heal_systime = mysystime()
	end
end


function mysystime()
-- systime > timestampy
	local nHour, nMinute, nSecond, nMillisec = gettime ()
	return nHour * 3600 + nMinute * 3600 + nSecond
end




function openFile(FileName)
-- otevre file se souradnicema (udela z nich table-array)
--File_Name Dodelat

local file = openfile(FileName,"r")
local content = file:read("*all")
Route_table = {}
Route_table.__index = Route_table

Route_table["Index"] = 1
Route_table["Max_routes"] = 0

	-- Populate Table
	local i = 1
	local x,y,z = 0,0,0
	local lb,rb = 0,0
	local len = 0
        local ncontent

	while string.len(content) > 2 do -- TEST IT!
		-- Rozlusteni souboru se souradnicema
		-- find [
		-- find ]
		-- sub content 1 az Hranice ]
		-- sub temp
		-- find ,
		-- get x mezi 
		-- sub hranice x+1 az _end
		-- get y mezi 
		-- sub hranice y+1 az _end
		-- get z 
		
		lb,_ = string.find(content,'[[]')
		rb,_ = string.find(content,'[]]')
	        -- pridat ulozeni
                ncontent = string.sub(content,_+1)
                content = string.sub(content,lb+1,rb-1)
                rb,_ = string.find(content,'\,')
                x = tonumber(string.sub(content,1,rb-1))
                content = content.sub(content,rb+1)
                
                rb,_ = string.find(content,",")
		y = tonumber(string.sub(content,1,rb-1))
		
                content = string.sub(content,rb+1)
		z = tonumber(content)
		Route_table[i] = {x,y,z}
		content = ncontent
		i=i+1
	end
end




-------------------------------------------------------
-- First call
Setup_Check()
Menu_init()
main()
-------------------------------------------------------































