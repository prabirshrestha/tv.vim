# tv.vim

Ultra Fast Fuzzy finder for Vim8 and NeoVim for [Television](https://github.com/alexpasmantier/television).

`Television` is a blazingly fast general purpose fuzzy finder TUI.

It is inspired by the neovim [telescope](https://github.com/nvim-telescope/telescope.nvim) plugin and is designed to be fast, efficient, simple to use and easily extensible. It is built on top of [tokio](https://github.com/tokio-rs/tokio), [ratatui](https://github.com/ratatui/ratatui) and the *nucleo* matcher used by the [helix](https://github.com/helix-editor/helix) editor.

But very very experimental and some of the apis might not work yet and may change!

![tv.vim](https://github.com/user-attachments/assets/c2a1dc2a-55d0-4b7b-9ac9-f04a5ac0cb33)

## Usage

```
:Tv
```

Or type `,f`

## APIs

### type: cmd

```vim
nnoremap <C-p> :execute system('git rev-parse --is-inside-work-tree') =~ 'true'
      \ ? tv#run({ 'type': 'cmd', 'cmd': 'git ls-files' })
      \ : 'Tv'<CR>
```

### type: list

```vim
command! TvColors call tv#run({
    \ 'type': 'list',
    \ 'list': uniq(map(split(globpath(&rtp, "colors/*.vim"), "\n"), "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')")),
    \ 'accept': {result->execute('colorscheme ' . result['items'][0])},
    \ })
```

## Requirements

* vim8 or neovim

## Installation

Install television binary from https://github.com/alexpasmantier/television/releases or use homebrew for Mac.

```
$ brew install television
```

*  [Pathogen](https://github.com/tpope/vim-pathogen)
    * `git clone https://github.com/prabirshrestha/tv.vim.git ~/.vim/bundle/tv.vim`
*  [vim-plug](https://github.com/junegunn/vim-plug)
    * `Plug 'prabirshrestha/tv.vim'`
*  [Vim packages](http://vimhelp.appspot.com/repeat.txt.html#packages)
    * `git clone https://github.com/prabirshrestha/tv.vim.git ~/.vim/pack/plugins/start/tv.vim`

## License

MIT

## Author

Prabir Shrestha

## Credits

This is heavily inspired by [vim-fz](https://github.com/mattn/vim-fz)
