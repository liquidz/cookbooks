include_recipe '../def'

target = "#{ENV['HOME']}/bin/lein"

directory "#{ENV['HOME']}/bin"
curl 'download leiningen' do
  path target
  url  'https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein'
end

file target do
  mode '0755'
end

