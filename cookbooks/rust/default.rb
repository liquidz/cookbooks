execute 'install rust' do
  command <<-EOT
    curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain nightly
  EOT
  not_if 'test -e ~/.cargo/bin/rustc'
end
