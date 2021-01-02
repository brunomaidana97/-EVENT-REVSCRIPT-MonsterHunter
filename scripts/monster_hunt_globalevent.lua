local monsterHuntInit = GlobalEvent("MonsterHunt")
function monsterHuntInit.onThink(interval)
	if MONSTER_HUNT.days[os.date("%A")] then
		local hrs = tostring(os.date("%X")):sub(1, 5)
		if isInArray(MONSTER_HUNT.days[os.date("%A")], hrs) then
			MONSTER_HUNT:initEvent()
		end
	end
	return true
end
monsterHuntInit:interval(60000) -- não modificar
monsterHuntInit:register()

local monsterHuntEnd = GlobalEvent("MonsterHuntEnd")
function monsterHuntEnd.onTime(interval)
	MONSTER_HUNT:endEvent()
	return true
end
monsterHuntEnd:time("11:30:00") -- horario de termino do evento
monsterHuntEnd:register()
