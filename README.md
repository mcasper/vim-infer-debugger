vim-infer-debugger
==================

A VIM plugin to insert or remove a breakpoint debugger based on your current
file extension.

`vim-infer-debugger` works by taking a set of defined file extensions and their
corresponding debuggers, and then selects the correct debugger based on the
file you're in. It comes with a set of defaults:

```VIM
  let g:debugger_array = [['\.rb',             'require "pry"; binding.pry'],
                         \['\.rake',           'require "pry"; binding.pry'],
                         \['\.ex$',            'require IEx; IEx.pry'],
                         \['\.exs',            'require IEx; IEx.pry'],
                         \['\.erb',            '<% require "pry"; binding.pry %>'],
                         \['\.haml',           '- require "pry"; binding.pry'],
                         \['\.eex',            '<% require IEx; IEx.pry %>'],
                         \['\.coffee$',        'debugger'],
                         \['\.json\.jbuilder', 'require "pry"; binding.pry'],
                         \['\.js$',            'debugger;'],
                         \['\.jsx$',           'debugger;'],
                         \['\.rs$',            'println!("{:?}", )'],
                         \['\.py$',            'import pdb; pdb.set_trace()']]
```

In order to define your own debuggers, just overwrite `g:debugger_array` in
your `.vimrc` Please note that when defining the regex for the file extension,
it is best to wrap it in single quotes. Also note that by setting
`g:debugger_array` in your `.vimrc`, you overwrite the entire array. So if you
want to only change one of the default entries, you will have to supply the
rest of them as well.

## Configuration

`vim-infer-debugger` exposes the following functions for your use.

```VIM
AddDebugger("O")
AddDebugger("o")
RemoveAllDebuggers()
```

It is recommended that you map them in your `.vimrc`, for example:

```VIM
nmap <Leader>P :call AddDebugger("O")<cr>
nmap <Leader>p :call AddDebugger("o")<cr>
nmap <Leader>d :call RemoveAllDebuggers()<cr>
```

## Installation

I recommend using [vim-plug](https://github.com/junegunn/vim-plug) to install,
just add `Plug 'mcasper/vim-infer-debugger'` to your `.vimrc`, run
`PlugInstall`, and you're on your way.

If you have any debugging statements that you think should be the default for a
certain file extension, feel free to open a pull request or issue!
