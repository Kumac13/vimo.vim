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
  let result = system('vimo')
  if v:shell_error
    echo "vimo not found!"
    return 0
  else
    return 1
  endif
endfunction
