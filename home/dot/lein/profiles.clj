{:user {:plugins [[cider/cider-nrepl "0.47.1"]
                  [lein-ancient "1.0.0-RC3"]
                  [lein-pprint "1.3.2"]
                  [com.jakemccrary/lein-test-refresh "0.22.0"]]
        :test-refresh {:quiet true
                       :changes-only true}}
 :repl {:pedantic? :warn}
 :raw {:plugins ^:replace []}}
