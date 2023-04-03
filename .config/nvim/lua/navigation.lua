local nav = {}

nav.quickfix_list_toggle = 0
nav.location_list_toggle = 0

function nav.toggle_quickfix_list(global)
    if global == 1 then
        if nav.quickfix_list_toggle == 1 then
            nav.quickfix_list_toggle = 0
            vim.cmd('cclose')
        else
            nav.quickfix_list_toggle = 1
            vim.cmd('copen')
        end
    else
        if nav.location_list_toggle == 1 then
            nav.location_list_toggle = 0
            vim.cmd('lclose')
        else
            nav.location_list_toggle = 1
            vim.cmd('lopen')
        end
    end
end

return nav

