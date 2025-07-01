return {
    "mfussenegger/nvim-dap",
    lazy = true,
    -- Copied from LazyVim/lua/lazyvim/plugins/extras/dap/core.lua and
    -- modified.
    keys = {
        {
            "<leader>db",
            function() require("dap").toggle_breakpoint() end,
            desc = "Toggle Breakpoint"
        },

        {
            "<leader>dc",
            function() require("dap").continue() end,
            desc = "Continue"
        },

        {
            "<leader>dC",
            function() require("dap").run_to_cursor() end,
            desc = "Run to Cursor"
        },

        {
            "<leader>dT",
            function() require("dap").terminate() end,
            desc = "Terminate"
        },
        -- View
        {
            "<leader>ds",
            function()
                local widgets = require("dap.ui.widgets")
                widgets.centered_float(widgets.scopes, { border = "rounded" })
            end,
            desc = "DAP Scopes",
        },
        {
            "<A-r>",
            function() require("dap").repl.toggle(nil, "tab split") end,
            desc = "Toggle DAP REPL",
        },
        {
            "<A-s>",
            function() require("dap.ui.widgets").hover(nil, { border = "rounded" }) end,
            desc = "DAP Hover",
        },
    },

    config = function()
        local debugger_path = os.getenv("HOME") .. "/.vim/js-debug/src/dapDebugServer"

        require("dap").adapters["pwa-node"] = {
            type = "server",
            host = "localhost",
            port = "${port}",
            executable = {
                command = "node",
                args = { debugger_path, "${port}" },
            }
        }

        local js_based_languages = { "typescript", "javascript", "typescriptreact" }
        for _, language in ipairs(js_based_languages) do
            require("dap").configurations[language] = {
                {
                    type = "pwa-node",
                    request = "launch",
                    name = "Launch file",
                    program = "${file}",
                    cwd = "${workspaceFolder}",
                },
                {
                    type = "pwa-node",
                    request = "attach",
                    name = "Attach",
                    address = "localhost",
                    port = 9229,
                    restart = true,
                    cwd = "${workspaceFolder}",
                },
                {
                    type = "pwa-chrome",
                    request = "launch",
                    name = "Start Chrome with \"localhost\"",
                    url = "http://localhost:3000",
                    webRoot = "${workspaceFolder}",
                    userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir"
                }
            }
        end
    end
}
