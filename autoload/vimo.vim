function! vimo#Monologue()
  if !s:checkVimoAvailability()
    return
  endif

  let user_input = input(printf("Enter your monologue: "), "",)
  if user_input != ''
    let cmd = "vimo -m ".shellescape(user_input)
    call system(cmd)
    echo "\nSent to vimo!"
  else
    return
  endif
endfunction

function! s:checkVimoAvailability()
  if executable('vimo')
    return 1
  else
    return 0
  endif
endfunction
