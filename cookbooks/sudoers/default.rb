#Defaults   secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
execute 'add env_keep' do
  command <<-EOT
    echo "Defaults\tenv_keep += \"PATH\"" >> /etc/sudoers
  EOT
  not_if 'grep env_keep /etc/sudoers'
end

execute 'comment secure_path' do
  command <<-EOT
    sed -i -e "s/^\\(Defaults\tsecure_path\\)/#\\1/g" /etc/sudoers
  EOT
  not_if 'grep "^#Defaults[[:space:]]secure_path" /etc/sudoers'
end
