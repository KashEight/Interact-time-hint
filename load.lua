if not Steam then
    return
end

function executeScript(script)
    local requiredScript = script:lower()
    local hook_files = {
        ["lib/managers/hud/hudinteraction"] = "InteractTime.lua"
    }
    if hook_files[requiredScript] then
        local fileName = ModPath .. "lua/" .. hook_files[requiredScript]
        if io.file_is_readable(fileName) then
            log("[Info] Interact time hint was successfully loaded!")
            dofile(fileName)
		else
			log("[Error] BLT could not open script '" .. fileName .. "'.")
		end
    else
        log("[Error] Unregistered script called: " .. requiredScript)
    end
end

if RequiredScript then
    executeScript(RequiredScript)
end