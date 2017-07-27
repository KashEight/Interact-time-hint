local selected_original = BaseInteractionExt.selected

function BaseInteractionExt:selected(player)
	selected_original(self, player)
	managers.hud:show_interact({
		text = managers.localization:text("hoge", self:_btn_interact()),
		icon = self._tweak_data.icon,
		force = true
	})
	return true
end