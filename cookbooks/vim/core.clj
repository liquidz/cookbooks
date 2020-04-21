(def packages
  ["build-essential" "git" "ncurses-dev" "python-dev" "python3-dev" "cmake" "libboost-all-dev"])

(def src-dir "/usr/local/src/vim")

(def configure
  "--prefix=/usr/local --with-features=huge --enable-multibyte --enable-pythoninterp --enable-python3interp --enable-fail-if-missing")

(package "vim" {:action :uninstall})
(map package packages)

(git {:url "https://github.com/vim/vim"
      :path src-dir})

(when (not (exists? (str src-dir "/src/auto/config.log")))
  (execute {:cwd src-dir
            :command (str "./configure " configure)}))

(when (not (exists? "/usr/local/bin/vim"))
  (execute {:cwd src-dir
            :command "make && make install"}))

(template (str src-dir "/rebuild.sh")
          {:source "rebuild.sh.tmpl"
           :variables {:configure configure}})
