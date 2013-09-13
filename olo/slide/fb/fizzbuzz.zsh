#!/bin/zsh
paste <(seq 0 3 100 | tail -n +2 | sed 's/^/\n\nFizz/') \
      <(seq 0 5 100 | tail -n +2 | sed 's/^/\n\n\n\nBuzz/') \
      <(seq 100) \
| tr -d '\t' | sed '/z/s/[0-9]//g'
