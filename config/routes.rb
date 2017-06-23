Rails.application.routes.draw do
  root	to:	'articles#index'
  resources	:articles do
    get 'del' => 'articles#del'

    resources :comments
  end
  resources	:tags
  get 'index' => 'tags#index'

  resources	:authors
  post 'check' => 'authors#check'

  resources	:users
  resources	:author_sessions,	only:	[	:new,	:create,	:destroy	]
  get	'login'		=>	'author_sessions#new'
  get	'logout'	=>	'author_sessions#destroy'

end
