function! Debugging(direction)
  let file_path = expand('%')
  let file = split(file_path, "/")[-1]
  let rb   = file =~ "\.rb"
  let ex   = file =~ "\.ex"
  let erb  = file =~ "\.erb"
  let eex  = file =~ "\.eex"
  let json = file =~ "\.json\.jbuilder"
  let js   = file =~ "\.js"

  let @g = a:direction

  if rb
    normal! @grequire "pry"; binding.pry
  elseif ex
    normal! @grequire IEx; IEx.pry
  elseif erb
    normal! @g<% require "pry"; binding.pry %>
  elseif eex
    normal! @g<%= require IEx; IEx.pry %>
  elseif json
    normal! @grequire "pry"; binding.pry
  elseif js
    normal! @gdebugger;
  else
    normal! @gCouldn't figure out the debugger type, add support for this file extension
  endif
endfunction

nmap <Leader>P :call Debugging("O")<cr>
nmap <Leader>p :call Debugging("o")<cr>
