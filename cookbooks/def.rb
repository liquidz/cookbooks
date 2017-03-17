# curl 'foo' do
#   path '/tmp'
#   url  'http://example.com'
# end
define :curl, path: nil, url: nil do
  execute "curl #{params[:name]}" do
    command <<-EOT
       curl -sfLo #{params[:path]} #{params[:url]}
    EOT
    not_if "test -e #{params[:path]}"
  end
end
