require 'sinatra'
require 'json'

set :static, true
set :bind, '0.0.0.0'
# set :public_folder, File.dirname(__FILE__) + '/public'

get "/" do
  erb :form
end

post '/save_image' do
  
  @filename = params[:file][:filename]
  file = params[:file][:tempfile]

  File.open("./public/#{@filename}", 'wb') do |f|
    f.write(file.read)
  end
  
  erb :show_image
end

get '/latest*' do |extension|
  puts request.accept.inspect
  latest_file = Dir.glob("public/*.jpg").max_by {|f| File.mtime(f)}
  modified_time = File.mtime(latest_file)
  latest_file = '/'+latest_file.split('/', 2)[1]
  if extension == '.json' 
   puts "serving JSON"
    content_type :json
    { image: latest_file, modified: modified_time }.to_json
  else
    puts "serving html"
    erb :latest
  end
end
