EtymApp::Application.routes.draw do
  resources :etymologies
  root  'etymologies#index'
end
