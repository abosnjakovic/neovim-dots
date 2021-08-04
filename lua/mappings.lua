lvim.leader = "space"

lvim.builtin.which_key.setup.plugins.presets.motions = true
lvim.builtin.which_key.setup.plugins.presets.operators = true
lvim.builtin.which_key.setup.plugins.presets.text_objects = true

lvim.builtin.which_key.mappings["q"] = { ":qa!<cr>", "Quit!"}
lvim.builtin.which_key.mappings["r"] = { ":so %<cr>", "Reload"}
lvim.builtin.which_key.mappings["<space>"] = { ":Telescope commands<cr>", "Commands"}
lvim.builtin.which_key.mappings.s.s = { '<cmd>lua require"telescope".extensions.project.project{ display_type = "full" }<CR>', 'Project'}

vim.api.nvim_command([[
set shell=/opt/homebrew/bin/fish
function! TmuxMove(direction)
        let wnr = winnr()
        silent! execute 'wincmd ' . a:direction
        " If the winnr is still the same after we moved, it is the last pane
        if wnr == winnr()
                call system('tmux select-pane -' . tr(a:direction, 'phjkl', 'lLDUR'))
        end
endfunction

nnoremap <silent> <C-Left> :call TmuxMove('h')<cr>
nnoremap <silent> <C-Down> :call TmuxMove('j')<cr>
nnoremap <silent> <C-Up> :call TmuxMove('k')<cr>
nnoremap <silent> <C-Right> :call TmuxMove('l')<cr>

nnoremap <silent> <C-h> :call TmuxMove('h')<cr>
nnoremap <silent> <C-j> :call TmuxMove('j')<cr>
nnoremap <silent> <C-k> :call TmuxMove('k')<cr>
nnoremap <silent> <C-l> :call TmuxMove('l')<cr>

nnoremap Y y$

nnoremap n nzzzv
nnoremap N nzzzv
nnoremap J mzJA`z
nnoremap <C-j> :cnext<CR>zzzv

inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv


let g:toggleterm_terminal_mapping = '<C-t>'

nmap s <Plug>(easymotion-overwin-f2)

nmap  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)map s <Plug>(easymotion-overwin-f2)
]])


