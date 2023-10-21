function! VimoCheckVimoAvailability()
  let result = system('which vimo')
  if v:shell_error
    echo "vimo not found!"
    return 0
  else
    return 1
  endif
endfunction

function! vimo#VimoMonologue()
  if !CheckVimoAvailability()
    return
  endif

  let user_input = input("Enter your monologue: ")
  let cmd = "vimo -m ".shellescape(user_input)
  call system(cmd)
  echo "Sent to vimo!"
endfunction
