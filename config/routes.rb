Rails.application.routes.draw do
  root to: 'home#welcome' #root define a rota '/' da  aplicação
  resources :tasks
end
