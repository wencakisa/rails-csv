Rails.application.routes.draw do
  post 'sums'      => 'sums#create'
  post 'filters'   => 'filters#create'
  post 'intervals' => 'intervals#create'
end
