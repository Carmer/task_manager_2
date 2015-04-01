require 'bundler'
Bundler.require

#set pathname for the root of the app
require 'pathname'
APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

#require controllers
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }

#require the models
Dir[APP_ROOT.join('app', 'models', '*.rb')].each { |file| require file }

#configure TaskManagerApp setting

class TaskManagerApp < Sinatra::Base
  set :method_override, true
  set :root, APP_ROOT.to_path
  set :views, File.join(TaskManagerApp.root, "app", "views")
  set :public_folder, File.join(TaskManagerApp.root, "app", "public")
end
