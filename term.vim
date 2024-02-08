if !exists("g:colors_name")
  highlight DiffAdd ctermfg=white
  highlight DiffDelete ctermfg=white
  highlight DiffChange ctermfg=white
  highlight DiffText ctermfg=white
endif

let s:tmux = &term =~ "tmux" || !empty($TMUX)
let s:prefix = s:tmux ? "\ePtmux;\e" : ""
let s:suffix = s:tmux ? "\e\\" : ""

if s:tmux
  let &t_BE = "\e[?2004h"
  let &t_BD = "\e[?2004l"
  let &t_PS = "\e[200~"
  let &t_PE = "\e[201~"
  let &t_RB = s:prefix . "\e]11;?" . nr2char(7) . s:suffix
  let &t_8f = "\e[38:2:%lu:%lu:%lum"
  let &t_8b = "\e[48:2:%lu:%lu:%lum"
endif

com -range=% OSC52 silent call writefile([s:prefix . "\e]52;c;" . substitute(system("base64", getline(<line1>,<line2>)), "\n", "", "g") . "\x07". s:suffix], "/dev/tty", "b")
