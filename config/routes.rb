Rails.application.routes.draw do
  post 'sums'  => 'sums#create'
  post 'count' => 'count#create'
end
