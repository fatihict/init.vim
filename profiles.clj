{:user {:dependencies [[cljfmt "0.5.7"]]
        :plugins [[cider/cider-nrepl "0.17.0"]
                  [refactor-nrepl "2.4.0-SNAPSHOT"]]
        :repl-options {:init (require 'cljfmt.core)
                       :timeout 300000}}}
