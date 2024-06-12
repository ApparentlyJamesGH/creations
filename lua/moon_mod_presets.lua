return {
  {
    Name = "Example Mod",
    Mod = function(Moon, API)
      API:CreateActionButton("Print", function()
	print("Hey! This is a Moon Mod test!")
      end, {})
    end
  }
}
