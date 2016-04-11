class App < Sinatra::Base
  helpers do
    def current_user
      DB.relation(:users).find_by_id(session[:user_id]).as(:entity).one
    end

    def name(id)
      DB.relation(:characters).find_by_id(id).one[:name]
    end
  end

  get '/' do
    @votes = DB.relation(:votes).as(:entity).all_counts.to_a
    @characters = DB.relation(:characters).as(:entity).to_a

    erb :index
  end

  post '/' do
    unless current_user.nil?
      DB.commands[:votes][:create].call(user_id: current_user.id,
                                        character_id: params[:character_id])
    end

    redirect to('/')
  end

  get '/logout' do
    session[:user_id] = nil
    redirect to('/')
  end

  get '/auth/:name/callback' do
    auth = request.env['omniauth.auth']

    data = {
      uid: auth.uid,
      name: auth.info.name
    }

    response = DB.commands[:users][:upsert].call(data)
    session[:user_id] = response[:id]

    redirect to('/')
  end
end
