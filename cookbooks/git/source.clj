#!/usr/bin/env dad --no-color --dry-run

(def version "2.24.1")
(def prefix "/usr/local")
(def src-dir (str prefix "/src"))
(def git-dir-name (str "git-" version))

(package ["make"
          "libssl-dev"
          "libghc-zlib-dev"
          "libcurl4-gnutls-dev"
          "libexpat1-dev"
          "gettext"
          "unzip"])

(package "git" {:action :uninstall})

(download {:path (str src-dir "/git.zip")
           :url (str"https://github.com/git/git/archive/v" version ".zip")})

(execute {:cwd src-dir
          :command "unzip git.zip"
          :pre-not (str "test -d " git-dir-name)})

(execute {:cwd (str src-dir "/" git-dir-name)
          :command [(str "make prefix=" prefix " all")
                    (str "make prefix=" prefix " install")]
          :pre-not (str "test -e " prefix "/bin/git")})
