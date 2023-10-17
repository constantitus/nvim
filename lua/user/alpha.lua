return {
    "goolord/alpha-nvim",
    opts = function(_, opts)
        local dashboard = require("alpha.themes.dashboard")
        dashboard.section.header.val = {
            [[                                                                          ]],
            [[                                                                          ]],
            [[                                                                          ]],
            [[                                                                          ]],
            [[                                                                          ]],
            [[                                                                          ]],
            [[                                                                          ]],
            [[                                                                          ]],
            [[                                                                          ]],
            [[           :                       ..,,..    ...,,..                      ]],
            [[          ,%,                .. ,#########::#########:,                   ]],
            [[          :#%%,           ,,:',####%%%%%%##:`::%%%%####,                  ]],
            [[         ,##%%%%,      ,##%% ,##%%%:::::''%' `::::%%####,                 ]],
            [[         %###%%;;,   ,###%%:,##%%:::''    '  . .`:::%%###,                ]],
            [[        :####%%;;:: ,##%:' ,#%::''   .,,,..    . .`::%%%##,               ]],
            [[        %####%;;::,##%:' ,##%''  ,%%########%     . `:::%%##,             ]],
            [[        ######:::,##%:',####:  ,##%%:''     `%%,     .`::%%##,            ]],
            [[        :#####%:'##%:',#####' ,###%' ,%%%%,%%,'%,     . ::%%###,,..       ]],
            [[         #####%:,#%:'#######  %%:'%  %'  `%% %% %%,.     '::%%#######,    ]],
            [[         `####%,#%:',####### ::' %   ' ,%%%%%%, ::%%.    . '::%%######    ]],
            [[          `###'##%: ######## ,.   %%  %%,   ':: `:%%%  :  . .:::%%###'    ]],
            [[          ,,::,###  %%%%%### ::  % %% '%%%,.::: .:%%%   #.  . ::%%%#'     ]],
            [[    ,,,:::%%##:;#   `%%%%%## :% ,%, %   ':%%:'  #%%%' ,.:##.  ::%#'       ]],
            [[    ::%%#####% %%:::  :::%%% `%%,'%%     ..,,%####' :%# `::##, ''         ]],
            [[    ###%%::'###%::: .   `:::, `::,,%%%######%%'',::%##' ,:::%##           ]],
            [[    ''''   ,####%:::. .  `::%,     '':%%::' .,::%%%#'   :::%%%##,         ]],
            [[          :#%%'##%:::.  . . "%::,,.. ..,,,,::%%%###'  ,:%%%%####'         ]],
            [[         ,###%%'###%:::: . . `::::::::::%%%#####'   ,::%####:'            ]],
            [[         %###%%;'###%::::.   .`::%%%%%%%#####:'  ,,::%%##:'               ]],
            [[         ####%;:;'####%:::::.   `:%######::'  ,,:::%%###                  ]],
            [[         %####;:;'######%%::::.           ,::::%%%####'                   ]],
            [[         `####%;:'`#########%%:::....,,:::%%%#######'                     ]],
            [[            ;#####;;'..;;:::#########::%%#########:"'                     ]],
            [[                           ~~~~``````''''~~~                              ]]
        }

        local function button(sc, txt, keybind, keybind_opts)
            local opts = {
                position = "center",
                cursor = 0,
                width = 50,
            }
            if keybind then
                keybind_opts = vim.F.if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
                opts.keymap = { "n", sc, keybind, keybind_opts }
            end

            local function on_press()
                local key = vim.api.nvim_replace_termcodes(keybind or sc .. "<Ignore>", true, false, true)
                vim.api.nvim_feedkeys(key, "t", false)
            end

            return {
                type = "button",
                val = txt,
                on_press = on_press,
                opts = opts,
            }
        end

        dashboard.section.header.opts.hl = "Keyword"
        dashboard.section.buttons.val = {
            button("e", "", "<cmd>ene <CR>"),
        }
        dashboard.section.footer.opts.hl = "Constant"

        dashboard.opts.layout = {
            dashboard.section.header,
            { type = "padding", val = 2 },
            dashboard.section.footer,
            { type = "padding", val = 1 },
            dashboard.section.buttons,
        }
        return dashboard
    end,
    config = function(_, opts)
        require("alpha").setup(opts.config)
        vim.api.nvim_create_autocmd('User', {
            pattern = 'LazyVimStarted',
            callback = function()
                local stats = require("lazy").stats()
                local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                opts.section.footer.val = {
                    "Loaded "
                    .. stats.count
                    .. " plugins in "
                    .. ms
                    .. "ms"
                }
                pcall(vim.cmd.AlphaRedraw)
            end,
        })
    end,
    lazy = false,
}
