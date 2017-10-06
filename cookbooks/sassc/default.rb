%w(
  sassc
  libsass
  sass-spec
).each do |name|
  git "#{node[:home]}/src/github.com/sass/#{name}" do
    repository "https://github.com/sass/#{name}"
    user node[:user]
  end
end

execute 'build sassc' do
  cwd "#{node[:home]}/src/github.com/sass/sassc"
  command <<-EOT
    SASS_LIBSASS_PATH=#{node[:home]}/src/github.com/sass/libsass make
  EOT
  user node[:user]
  not_if "test -e bin/sassc"
end

execute 'install saccs' do
  cwd "#{node[:home]}/src/github.com/sass/sassc/bin"
  command 'cp sassc /usr/local/bin'
  not_if "test -e /usr/local/bin/sassc"
end
