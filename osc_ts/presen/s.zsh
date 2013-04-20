#!/bin/zsh

function demo1 {
	xvkbd -delay 100 -text "gedit " 2>/dev/null
	sh -c 'xvkbd -delay 500 -text "t.awk \n" 2>/dev/null &'
}

zle -N demo1
bindkey "^t" demo1
