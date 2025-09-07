local wezterm = require 'wezterm'
local config = {}

-- Configuration pour créer automatiquement la disposition au démarrage
config.default_workspace = "main"

-- Fonction pour créer la disposition par défaut
config.setup = function()
	wezterm.on('gui-startup', function(cmd)
		local mux = wezterm.mux
		local tabs = mux.all_windows()[1]:tabs() 
		local pane = tabs[1]:active_pane()
		local right_pane = pane:split{
			direction = 'Right', 
			size = 0.1,
		}
		local bottom_pane = right_pane:split{
			direction = 'Bottom',
			size = 0.6,
		}
		pane:send_text('clear\n')
		right_pane:send_text('clear ; neofetch\n')
		bottom_pane:send_text('btop\n')
		pane:activate()
	end)
end

return config
