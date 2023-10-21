function! vimo#Monologue()
  if !s:checkVimoAvailability()
    return
  endif

  let user_input = input("Enter your monologue: ")
  let cmd = "vimo -m ".shellescape(user_input)
  call system(cmd)
  echo "Sent to vimo!"
endfunction

function! s:checkVimoAvailability()
  let result = system('which vimo')
  if v:shell_error
    echo "vimo not found!"
    return 0
  else
    return 1
  endif
endfunction
