include_recipe 'default'

home = ENV['HOME']
rust_version = '1.13.0'

%w( rustfmt racer cargo-script ).each do |pkg_name|
  execute "cargo install #{pkg_name}" do
    command "cargo install #{pkg_name}"
    not_if "test -e ~/.cargo/bin/#{pkg_name}"
  end
end

name = "rustc-#{rust_version}"
archive = "#{name}-src.tar.gz"
src_url = "https://static.rust-lang.org/dist/#{archive}"
execute 'download rust src' do
  cwd "#{home}/src"
  command <<-EOC
    wget #{src_url} && tar xvf #{archive}
  EOC
  not_if "#{home}/src/#{name}"
end
