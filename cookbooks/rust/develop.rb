include_recipe 'default'

execute 'install rust source' do
  command <<-EOT
    rustup component add rust-src
  EOT
end

{
  'cargo-outdated' => 'cargo-outdated',
  'cargo-script'   => 'cargo-script',
  'cargo-update'   => 'cargo-install-update',
  'clippy'         => 'clippy',
  'racer'          => 'racer',
  'rustfmt'        => 'rustfmt',
}.each do |crate_name, bin_name|
  execute "install #{crate_name}" do
    command "cargo install #{crate_name}"
    not_if "test -e ~/.cargo/bin/#{bin_name}"
  end
end
