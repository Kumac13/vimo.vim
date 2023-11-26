if exists('g:loaded_sfvim')
  finish
endif
let g:loaded_sfvim = 1

command! VimoMonologue call vimo#Monologue()
