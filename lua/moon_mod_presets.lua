local RunService = game:GetService("RunService")

return {
	{
		Name = "Print Mod",
		Mod = function(Moon, API)
			API:CreateActionButton("Print", function()
				print("Hey! This is a Moon Mod test!")
			end, {})
		end
	},
	{
		Name = "Autosave",
		Mod = function(Moon, API)
			local animatorWin = Moon.Windows.MoonAnimator
			local saveConnection, _t = nil, 0
			
			Moon.Toggles.CreateToggle("AutosaveToggle", {Default = true})
			Moon.Toggles.SetToggleChanged("AutosaveToggle", function(value)
				if saveConnection then
					saveConnection:Disconnect()
				end

				if value then
					saveConnection = RunService.PreRender:Connect(function()
						if tick() > _t and Moon.Windows.MoonAnimator.g_e.LayerSystem.CurrentFile then
							_t = tick() + 1
							animatorWin:SaveFile(true)
						end
					end)
				end				
			end)
			
			API:CreateActionButton("AutosaveToggle", function() Moon.Toggles.FlipToggleValue("AutosaveToggle") end, {"ALT_C"}, {IsToggle = true, NoClickOff = true})
		end
	},
}
