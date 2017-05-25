# My Neovim configuration for Clojure(Script) development
Steal anything you like and send me a message `@fatihict` on the [Clojurians Slack](http://clojurians.net/) if I can improve upon something :D

## To fix
- [X] Ctags shouldn't see metadata as a function name
- [X] Check-in ~/.lein/profiles
- [X] Check-in ~/.ctags
- [X] Improve this README with a table of functions I need to use/remember
- [X] Check-in clojure snippets
- [ ] Highlight variables under cursor without `*` search
- [ ] Fix issue with Ag being scope on current dir

## To remember

### Clojure stuff
| Remember            | Description                                                    |
|---------------------|----------------------------------------------------------------|
| Piggieback          | `:Piggieback (figwheel-sidecar.repl-api/repl-env)`             |
| `<Leader>e`         | Eval range                                                     |
| `:%Eval`            | Eval whole file                                                |
| `:Require`          | Require a namespace with :reload                               |
| `:Require!`         | :reload-all on current buffer or given argument                |
| `cp`                | Evaluate given motion (`cpp` for innermost form under cursor)  |
| `cm` and `c1m`      | clojure.walk/macroexpand-all and macroexpand-1 on form         |
| Open stacktrace     | `:lopen`                                                       |
| `K`                 | Doc under cursor                                               |
| `[d`                | Source under cursor                                            |
| `[<C-d>`            | Jump to defintion also works with jars                         |
| `gf`                | Go to file with namespaces                                     |
| `:Last`             | Open result of last eval. Cycle with `:lprevious` and `:Lnext` |
| `c!{motion}`        | Eval and replace                                               |
| `:Piggieback!`      | Terminate the most recently created piggieback session         |
| `>f` `<f`           | Move forms                                                     |
| `>e` `<e`           | Move element                                                   |
| `>)` `<)` `>(` `<(` | Move parens                                                    |
| `<I` `>I`           | Insert at begin/end of form                                    |
| `ysaf`              | Surround form with parens                                      |
| `dsf`               | Delete surrounding of form                                     |
| `cse(` or `cse)`    | Surround element in parens                                     |
| `cse[` or `cse]`    | Surround element in brackets                                   |
| `cse{` or `cse}`    | Surround element in braces                                     |

### Global
| Remember     | Description |
|--------------|-------------|
| `C-y`        | Scroll up   |
| `M-y`        | Scroll down |
| `C-e`        | `:History`  |
| `<Leader>/`  | `:History/` |
| `<Leader>:`  | `:History:` |
| `<Leader>bt` | `:BTags`    |
| `<Leader>bb` | `:Buffers`  |
| `<Leader>tb` | `:Tagbar`   |
| `<Leader>p`  | `:Tags`     |
| `<Leader>l`  | `:Blines`   |
