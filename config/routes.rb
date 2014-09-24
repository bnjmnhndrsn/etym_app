EtymApp::Application.routes.draw do
  resources :etymologies, only: [:show, :index]
end
