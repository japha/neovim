local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fs', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ")})
end)

local telescope_custom_actions = {}

function telescope_custom_actions._multiopen(prompt_bufnr, open_cmd)
    local picker = action_state.get_current_picker(prompt_bufnr)
    local num_selections = #picker:get_multi_selection()

    if num_selections > 1 then
        local picker = action_state.get_current_picker(prompt_bufnr)
        for _, entry in ipairs(picker:get_multi_selection()) do
            vim.cmd(string.format("%s %s", ":" .. open_cmd .. "!", entry.value))
        end
        vim.cmd('stopinsert')
    else
        actions.file_edit(prompt_bufnr)
    end
end

function telescope_custom_actions.multi_selection_open_vsplit(prompt_bufnr)
    telescope_custom_actions._multiopen(prompt_bufnr, "vsplit")
end

function telescope_custom_actions.multi_selection_open_split(prompt_bufnr)
    telescope_custom_actions._multiopen(prompt_bufnr, "split")
end

function telescope_custom_actions.multi_selection_open_tab(prompt_bufnr)
    telescope_custom_actions._multiopen(prompt_bufnr, "tabe")
end

function telescope_custom_actions.multi_selection_open(prompt_bufnr)
    telescope_custom_actions._multiopen(prompt_bufnr, "edit")
end

require('telescope').setup({
    defaults = {
        mappings = {
            i = {
                ['<esc>'] = actions.close,
                ['<C-j>'] = actions.move_selection_next,
                ['<C-k>'] = actions.move_selection_previous,
                ['<tab>'] = actions.toggle_selection + actions.move_selection_next,
                ['<s-tab>'] = actions.toggle_selection + actions.move_selection_previous,
                ['<cr>'] = telescope_custom_actions.multi_selection_open_tab,
            },
            n = {
                ['<esc>'] = actions.close,
                ['<tab>'] = actions.toggle_selection + actions.move_selection_next,
                ['<s-tab>'] = actions.toggle_selection + actions.move_selection_previous,
                ['<cr>'] = telescope_custom_actions.multi_selection_open_tab
            }
        }
    }
})

