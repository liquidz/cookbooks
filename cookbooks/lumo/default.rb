include_recipe '../yarn/default'

execute 'install lumo-cljs' do
  command 'yarn global add lumo-cljs'
  not_if 'which lumo'
end
