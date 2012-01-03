LoginApp::Application.routes.draw do
  resources :votes

    resources :boards do
  	  resources :conversations
  end
  
  root :to => "boards#index", :as => 'homepage'

  resources :users, :user_sessions
  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout

  resources :comments

  get '/boards/:board_id/conversations/:id/reply' => "conversations#reply", :as => :reply_board_conversation
  post '/boards/:board_id/conversations/:id/reply' => "conversations#save_reply", :as => :reply_board_conversation
  #match '/conversations/board/:board_id/' => "conversations#new", :as => :create_post
  #match '/conversations/:id/reply' => "conversations#reply", :as => :post_reply

end
