#!/bin/zsh
paste <(seq 0 3 100 | sed '1d;s/^/\n\nFizz/') <(seq 0 5 100 | sed '1d;s/^/\n\n\n\nBuzz/') <(seq 100) | sed 's/\s//g;/z/s/[0-9]//g'
