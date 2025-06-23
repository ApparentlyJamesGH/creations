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
      API:CreateActionButton("AutosaveToggle", function(...)
	Moon.Toggles.CreateToggle("Autosave", {Default = true})
	Moon.Toggles.SetToggleChanged("Autosave", function(value)
		print(value)				
	end)
      end, {"RightAlt"}, {IsToggle = true, NoClickOff = true})
    end
  },
}
