require "tilt/erubis"
require "sinatra"
require "sinatra/reloader"
require 'yaml'

helpers do
  def count_interests
    counter = 0
    @users.each do |name, values|
      counter += @users[name][:interests].length
    end
    counter
  end
end

before do
  @users = YAML.load_file('users.yaml')
end

get "/" do
  redirect("/users")
end

get "/users" do
  erb(:names)
end

get "/users/:name" do
  @name = params[:name]
  redirect("/users") unless @users.keys.include?(@name.to_sym)
  @user_info = @users[@name.to_sym]
  @other_users = @users.keys - [@name.to_sym]
  erb(:user_info)
end