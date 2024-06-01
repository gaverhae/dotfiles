{:user {:plugins [[lein-marginalia "0.7.1"]
                  [clj-stacktrace "0.2.5"]
                  [lein-clojars "0.9.1"]
                  [lein-pprint "1.1.1"]
                  [lein-kibit "0.0.8"]
                  [lein-guzheng "0.4.5"]
                  [repetition-hunter "0.3.1"]
                  [lein-autoexpect "0.2.5"]
                  [lein-catnip "0.5.1"]
                  [lein-ancient "0.5.4"]
                  [lein2-eclipse "2.0.0"]
                  [cider/cider-nrepl "0.6.0"]
                  ]
        :dependencies [[spyscope "0.1.4"]]
        :injections [(require 'spyscope.core)]}
 :no-assert {:global-vars {*assert* false}}
 }
