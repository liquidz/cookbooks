%w( python3-dev python3-pip ).each do |pkg_name|
  package pkg_name
end

execute 'upgrade pip3' do
  command '/usr/bin/pip3 install --upgrade pip'
end

