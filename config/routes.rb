Rails.application.routes.draw do
  scope '/:user_id', as: 'user' do
    controller :todos do
      get    'todos',          action: :index,            as: 'todos'
      get    'todos/new',      action: :new,              as: 'new_todo'
      post   'todos',          action: :create,           as: 'todos_create'
      delete 'todos',          action: :destroy_multiple, as: 'todos_destroy_multiple'

      get    'todos/:id',      action: :show,             as: 'todo'
      get    'todos/:id/edit', action: :edit,             as: 'todo_edit'
      patch  'todos/:id',      action: :update,           as: 'todo_update'
      delete 'todos/:id',      action: :destroy,          as: 'todo_destroy'
    end
  end

  controller :static_pages do
    get 'about',   action: :about
    get 'home',    action: :home
  end

  controller :sessions do
    get 'sign_in', action: :sign_in
    get 'sign_out', action: :sign_out

    post 'sign_in', action: :create
    delete 'sign_out', action: :destroy
  end

  root "static_pages#home"
end
