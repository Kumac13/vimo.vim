function! vimo#Monologue()
  if !s:checkVimoAvailability()
    return
  endif

  let user_input = input(printf("Enter your monologue: "), "",)
  if user_input != ''
    let cmd = "vimobox local monologue -m ".shellescape(user_input)
    call system(cmd)
    echo "\nSent to vimo!"
  else
    return
  endif
endfunction

function! vimo#List()
  if !s:checkVimoAvailability()
    return
  endif

  let cmd = "vimobox local list"
  let result = json_decode(system(cmd))

  call s:open_list(result)
endfunction

function! s:checkVimoAvailability()
  if executable('vimobox')
    return 1
  else
    return 0
  endif
endfunction

let s:buffer_name = 'monologue list//'

function! util#open_list(list) abort
  " if buffer exists
  if bufexists(s:buffer_name)
    " if buffer display in window
    let winid = bufwinid(s:buffer_name)
    if winid isnot# -1
      call win_gotoid(winid)
      call util#on_bufread_list(a:list)
    else
      execute 'sbuffer' s:buffer_name
      call util#on_bufread_list(a:list)
    endif
  else
    execute 'new' s:buffer_name
    call util#on_bufread_list(a:list)
  endif
endfunction

function! util#on_bufread_list(list) abort
  set buftype=nofile

  nnoremap <silent> <buffer>
        \  <Plug>(session-close)
        \  :<C-u>bdelete!<CR>
  nmap <buffer> q <Plug>(session-close)
  nnoremap <silent> <buffer>
        \  <Plug>(buffer-open)
        \  :<C-u>call force#apex#debug#get_log()<CR>
  nmap <buffer> <CR> <Plug>(buffer-open)

  let lists = a:list
  if empty(lists)
    call setline(1, '--- no list exist ---')
    return
  endif

  "" delete buffer contents
  %delete _
  call setline(1, lists)
endfunction



