# tv.vim

Ultra Fast Fuzzy finder for Vim8 and NeoVim for [Television](https://github.com/alexpasmantier/television).

But very very experimental!

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
