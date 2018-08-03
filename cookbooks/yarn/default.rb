pubkey_url = 'https://dl.yarnpkg.com/debian/pubkey.gpg'
src_list   = '/etc/apt/sources.list.d/yarn.list'

execute 'add yarn public key' do
  command "curl -sS #{pubkey_url} | sudo apt-key add -"
  not_if 'apt-key list | grep "Yarn Packaging"'
end

execute 'add source list' do
  command "echo \"deb https://dl.yarnpkg.com/debian/ stable main\" | sudo tee #{src_list}"
  not_if "test -e #{src_list}"
end

execute 'install yarn' do
  command <<-EOT
    apt update
    apt install -y yarn
  EOT
  not_if 'which yarn'
end
