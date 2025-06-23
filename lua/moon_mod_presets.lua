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
    Name = "Example Mod",
    Mod = function(Moon, API)
      API:CreateActionButton("Nothing", function()
	print("Hey! This is a Moon Mod test!")
      end, {})
    end
  },
}
