local show_interact_original = HUDInteraction.show_interact

function HUDInteraction:show_interact(data)
    self:remove_interact(self._hud_panel:child(self._child_name_text))
	self._hud_panel:child(self._child_name_text):set_text("hoge")
    return show_interact_original(self, data)
end