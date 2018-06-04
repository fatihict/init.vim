{:user {:dependencies [[cljfmt "0.5.7"]]
        :plugins [[refactor-nrepl "2.4.0-SNAPSHOT"]
                  [cider/cider-nrepl "0.17.0"]]
        :repl-options {:init (require 'cljfmt.core)
                       :timeout 300000}}}
