highlight DiffAdd ctermfg=black
highlight DiffDelete ctermfg=black
highlight DiffChange ctermfg=black
highlight DiffText ctermfg=black

let s:tmux = &term =~ "tmux" || !empty($TMUX)
let s:prefix = s:tmux ? "\ePtmux;\e" : ""
let s:suffix = s:tmux ? "\e\\" : ""

if s:tmux
  let &t_BE = "\e[?2004h"
  let &t_BD = "\e[?2004l"
  exec "set t_PS=\e[200~"
  exec "set t_PE=\e[201~"
  let &t_RB = s:prefix . "\e]11;?" . nr2char(7) . s:suffix
endif

com -range=% OSC52 silent call writefile([s:prefix . "\e]52;c;" . substitute(system("base64", getline(<line1>,<line2>)), "\n", "", "g") . "\x07". s:suffix], "/dev/tty", "b")
