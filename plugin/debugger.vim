if !exists("g:debugger_array")
 let g:debugger_array = [['\.rb',             'require "pry"; binding.pry'],
                        \['\.rake',           'require "pry"; binding.pry'],
                        \['\.ex$',            'require IEx; IEx.pry'],
                        \['\.exs',            'require IEx; IEx.pry'],
                        \['\.erb',            '<% require "pry"; binding.pry %>'],
                        \['\.haml',           '- require "pry"; binding.pry'],
                        \['\.eex',            '<%= require IEx; IEx.pry %>'],
                        \['\.coffee$',        'debugger'],
                        \['\.json\.jbuilder', 'require "pry"; binding.pry'],
                        \['\.js$',            'debugger;'],
                        \['\.jsx$',           'debugger;'],
                        \['\.rs$',            'println!("{:?}", );'],
                        \['\.py$',            'import pdb; pdb.set_trace()']]
endif

function! AddDebugger(direction)
  let debugger_array = FindDebuggerArray()

  if debugger_array != []
    execute "normal!" a:direction.debugger_array[1]
  else
    echo NoDebuggerFoundError()
  endif
endfunction

function! RemoveAllDebuggers()
  let debugger_array = FindDebuggerArray()

  if debugger_array != []
    let command = join(["g/", debugger_array[1], "/d"], "")
    execute command
  else
    echo NoDebuggerFoundError()
  end
endfunction

function! FindDebuggerArray()
  let file_extension = split(expand("%"), "/")[-1]

  for array in g:debugger_array
    if file_extension =~ array[0]
      return array
    endif
  endfor

  return []
endfunction

function! NoDebuggerFoundError()
  return "Couldn't figure out the debugger type, please add an entry for this file extension."
endfunction
