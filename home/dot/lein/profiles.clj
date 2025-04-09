{:user {:plugins [[lein-ancient "1.0.0-RC3"]
                  [lein-pprint "1.3.2"]
                  [com.jakemccrary/lein-test-refresh "0.26.0"]]}
 :repl {:plugins [[cider/cider-nrepl "0.54.0"]]
        :pedantic? :warn}
 :test {:dependencies [[pjstadig/humane-test-output "0.11.0"]]
        :injections [(require 'pjstadig.humane-test-output)
                     (pjstadig.humane-test-output/activate!)]
        :test-refresh {:quiet true
                       :changes-only true}}
 :raw {:plugins ^:replace []}}
