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
	print(...)
      end, {Enum.KeyCode.RightAlt}, {IsToggle = true, NoClickOff = true})
    end
  },
}
