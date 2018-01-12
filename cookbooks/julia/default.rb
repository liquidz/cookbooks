include_recipe '../def'

local = '/usr/local'

curl 'julia' do
  path '/tmp/julia.tar.gz'
  url 'https://julialang-s3.julialang.org/bin/linux/x64/0.6/julia-0.6.2-linux-x86_64.tar.gz'
end

execute 'tar julia' do
  cwd local
  command <<-EOT
    mkdir julia
    tar xvf /tmp/julia.tar.gz -C julia --strip-components 1
  EOT
  not_if "test -e #{local}/julia"
end
