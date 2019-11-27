(def src-dir "/usr/local/src/tig")
(def prefix "/usr/local")
(def build-command ["./autogen.sh"
                    "LDLIBS=-lncursesw CFLAGS=-I/usr/include/ncursesw ./configure"
                    "make"
                    "make install"])

(package ["git"
          "build-essential"
          "libncursesw5-dev"])

(git {:path src-dir
      :url "https://github.com/jonas/tig"})

(execute {:cwd src-dir
          :command build-command
          :pre-not "test -e /usr/local/bin/tig"})

(template {:path (str src-dir "/rebuild.sh")
           :source "rebuild.sh.tmpl"
           :variables {:build-command (str/join "\n" build-command)}
           :mode "755"})
