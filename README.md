# vim-infer-debugger
A VIM plugin to insert a breakpoint debugger based on your current file extension

`vim-infer-debugger` works by taking a set of defined file extensions and their
corresponding debuggers, and then selecting the correct debugger based on the file
you're in. It comes with a set of defaults (currently centered around Ruby/Rails and Elixir/Phoenix development):

```
  let g:debugger_array = [['\.rb', 'require "pry"; binding.pry'],
                         \['\.ex$', 'require IEx; IEx.pry'],
                         \['\.exs', 'require IEx; IEx.pry'],
                         \['\.erb', '<% require "pry"; binding.pry %>'],
                         \['\.eex', '<%= require IEx; IEx.pry %>'],
                         \['\.coffee$', 'debugger'],
                         \['\.json\.jbuilder', 'require "pry"; binding.pry'],
                         \['\.js$', 'debugger;'],
                         \['\.jsx$', 'debugger;']]
```
In order to define your own debuggers, just overwrite `g:debugger_array` in your `.vimrc`
Please note that when defining the regex for the file extension, it is best to wrap it
in single quotes. Also note that by setting `g:debugger_array` in your `.vimrc`, you overwrite
the entire array. So if you want to only change one of the default entries, you will have to supply
the rest of them as well.

`vim-infer-debugger` defines two key bindings by default:

```
nmap <Leader>P :call Debugging("O")<cr>
nmap <Leader>p :call Debugging("o")<cr>
```

Following VIM convention that capital letters insert above your cursor, and lowercase
insert below, the debugging statement will be pasted above or below your cursor accordingly.

If you have any debugging statements that you think should be the default for a certain file extension,
feel free to open a pull request or issue!
