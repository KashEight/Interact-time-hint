local selected_original = BaseInteractionExt.selected

function BaseInteractionExt:selected(player)
	selected_original(self, player)
	local interact_timer = 0
	if self:_timer_value() then
		interact_timer = self:_get_timer()
	end
	local _string_macros = {}
	self:_add_string_macros(_string_macros)
	local basic_text = managers.localization:text(self._tweak_data.text_id, _string_macros)
	managers.hud:show_interact({
		text = basic_text .. " (" .. interact_timer .. " s)",
		icon = self._tweak_data.icon
	})
	return true
end