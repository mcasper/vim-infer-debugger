if !exists("g:debugger_array")
  let g:debugger_array = [['\.rb', 'require "pry"; binding.pry'],
                         \['\.ex$', 'require IEx; IEx.pry'],
                         \['\.exs', 'require IEx; IEx.pry'],
                         \['\.erb', '<% require "pry"; binding.pry %>'],
                         \['\.eex', '<%= require IEx; IEx.pry %>'],
                         \['\.json\.jbuilder', 'require "pry"; binding.pry'],
                         \['\.js$', 'debugger;']]
endif

function! Debugging(direction)
  let file = split(expand("%"), "/")[-1]
  let uncalled = 1

  for array in g:debugger_array
    if file =~ array[0]
      execute "normal!" a:direction array[1]
      let uncalled = 0
    endif
  endfor

  if uncalled
    normal! o Couldn't figure out the debugger type, please add an entry for this file extension
  endif
endfunction

nmap <Leader>P :call Debugging("O")<cr>
nmap <Leader>p :call Debugging("o")<cr>
