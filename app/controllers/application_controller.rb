class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end
  
<<<<<<< HEAD
<<<<<<< HEAD
=======
 
>>>>>>> 4893c8254f01a1e7ac64050428c63757f1574e8d
=======
 
>>>>>>> origin
end