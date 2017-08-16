include_recipe '../cmake/root.rb'

packages  = %w(webkitgtk3-devel libzip-devel libcurl-devel)
clone_dir = '/tmp/planck'

packages.each do |name|
  package name
end

git clone_dir do
  repository 'https://github.com/mfikes/planck'
end

execute 'build planck' do
  cwd clone_dir
  command <<-EOT
    ./script/build
  EOT
end
