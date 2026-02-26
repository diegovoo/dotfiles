return {
    'goolord/alpha-nvim',
    config = function()
        local alpha = require'alpha' local dashboard = require'alpha.themes.dashboard'

        dashboard.section.header.val = {
            " ███╗   ██╗██╗   ██╗██╗███╗   ███╗",
            " ████╗  ██║██║   ██║██║████╗ ████║",
            " ██╔██╗ ██║██║   ██║██║██╔████╔██║",
            " ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║",
            " ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║",
            " ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
            "   🚀 Welcome to Neovim 🚀  ",
        }

        dashboard.section.buttons.val = {
            dashboard.button("e", "📄  New File", ":ene <BAR> startinsert <CR>"),
            dashboard.button("r", "🕒  Recent Files", ":Telescope oldfiles<CR>"),
            dashboard.button("f", "🔍  Find File", ":Telescope find_files<CR>"),

            dashboard.button("c", "⚙️  Nvim config", ":e ~/.config/nvim/<CR>"),
            dashboard.button("d", "📂  TFM", ":e ~/OneDrive/UPM/master/tfm/TFM/<CR>"),
            dashboard.button("u", "📁  ~/OneDrive/UPM/", ":e ~/OneDrive/UPM/<CR>"),

            dashboard.button("q", "🚪  Quit", ":qa<CR>"),
        }

        dashboard.section.footer.val = {
            "🔥 Code like a wizard, debug like a sorcerer! 🔥"
        }

        alpha.setup(dashboard.config)
    end
}

