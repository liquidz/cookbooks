include_recipe 'default'

%w( rustfmt racer ).each do |pkg_name|
  execute "cargo install #{pkg_name}" do
    command "cargo install #{pkg_name}"
    not_if "test -e ~/.cargo/bin/#{pkg_name}"
  end
end
