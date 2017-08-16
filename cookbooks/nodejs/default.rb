execute 'setup 8.x' do
  command 'curl -sL https://deb.nodesource.com/setup_8.x | bash -'
end

package 'nodejs'
