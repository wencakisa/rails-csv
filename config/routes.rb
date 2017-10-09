Rails.application.routes.draw do
  post 'sums'            => 'sums#create'
  post 'filters'         => 'filters#create'
  post 'intervals'       => 'intervals#create'
  post 'lin_regressions' => 'lin_regressions#create'
end
