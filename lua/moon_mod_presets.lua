return {
  {
    Name = "Print Mod",
    Files = {
	{"printButton", "Print"},
	{"extra", "Extra"}
	["extra"] = {
	    {"option1", "Option1"},
	    "~",
	    {"option2", "Option2"},
	}
    },
    Mod = function(Moon, API)
      API:CreateActionButton("Print", function()
	print("Hey! This is a Moon Mod test!")
      end, {})
      API:CreateActionButton({"extra", {"option1", "~", "option2"}}, function()
	print("Hey! This is a Moon Mod test!")
      end, {})
    end
  }
}
