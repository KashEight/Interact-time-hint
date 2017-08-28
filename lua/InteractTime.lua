function BaseInteractionExt:selected(player)
	local _text_id = self._tweak_data.text_id
	-- local equipment_id = self._equipment_tweak_data.text_id
	local _string_macros = {}
	self:_add_string_macros(_string_macros)
	if _text_id then
		if self.tweak_data ~= TripMineBase:get_name_id() then
			local basic_text = managers.localization:text(_text_id, _string_macros)
			managers.hud:show_interact({
				text = basic_text .. " (" .. self:check_interact_time() .. " s)",
				icon = self._tweak_data.icon
			})
		elseif self.tweak_data == TripMineBase:get_name_id() then
			local basic_text = managers.localization:text(TripMineBase:interaction_text_id(), _string_macros)
			managers.hud:show_interact({
				text = basic_text .. " (0.0 s)",
				icon = self._tweak_data.icon
			})
		end
	else
		selected_original(self, player) 
	end
	return true
end

function BaseInteractionExt:check_interact_time()
	local interact_timer = 0
	if self:_timer_value() then
		interact_timer = self:_get_timer()
	end
	if interact_timer < 10 then
		if string.len(interact_timer) > 3 then
			interact_timer = string.sub(math.round(interact_timer * 10) / 10, 1, 3)
		elseif string.len(interact_timer) == 1 then
			interact_timer = interact_timer .. ".0"
		end
	else
		if string.len(interact_timer) > 4 then
			interact_timer = string.sub(math.round(interact_timer * 10) / 10, 1, 4)
		elseif string.len(interact_timer) == 2 then
			interact_timer = interact_timer .. ".0"
		end
	end
	return interact_timer
end