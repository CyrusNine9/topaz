-----------------------------------
--
--
--
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:recalculateAbilitiesTable();
	local bonus = effect:getPower();
	
	target:addMod(MOD_BLACK_MAGIC_COST, -bonus);
	target:addMod(MOD_BLACK_MAGIC_CAST, -bonus);
	target:addMod(MOD_BLACK_MAGIC_RECAST, -bonus);

	if not (target:hasStatusEffect(EFFECT_TABULA_RASA)) then
		target:addMod(MOD_BLACK_MAGIC_COST, -10);
		target:addMod(MOD_BLACK_MAGIC_CAST, -10);
		target:addMod(MOD_BLACK_MAGIC_RECAST, -10);
		target:addMod(MOD_WHITE_MAGIC_COST, 20);
		target:addMod(MOD_WHITE_MAGIC_CAST, 20);
		target:addMod(MOD_WHITE_MAGIC_RECAST, 20);
	end
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
	target:recalculateAbilitiesTable();
	local bonus = effect:getPower();
	
	target:delMod(MOD_BLACK_MAGIC_COST, -bonus);
	target:delMod(MOD_BLACK_MAGIC_CAST, -bonus);
	target:delMod(MOD_BLACK_MAGIC_RECAST, -bonus);

	if not (target:hasStatusEffect(EFFECT_TABULA_RASA)) then
		target:delMod(MOD_BLACK_MAGIC_COST, -10);
		target:delMod(MOD_BLACK_MAGIC_CAST, -10);
		target:delMod(MOD_BLACK_MAGIC_RECAST, -10);
		target:delMod(MOD_WHITE_MAGIC_COST, 20);
		target:delMod(MOD_WHITE_MAGIC_CAST, 20);
		target:delMod(MOD_WHITE_MAGIC_RECAST, 20);
	end
end;