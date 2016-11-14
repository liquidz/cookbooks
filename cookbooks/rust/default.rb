execute 'install rust' do
  command 'curl -sSf https://static.rust-lang.org/rustup.sh | sh'
  not_if 'test -e /usr/local/bin/rustc'
end
