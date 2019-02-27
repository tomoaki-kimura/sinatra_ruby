require 'sinatra'

@@datas = { "月曜日" => ["こくご", "こくご", "おんがく", "こくご", "さんすう"],
            "火曜日" => ["おんがく", "たいいく", "さんすう", "さんすう", "たいいく"],
            "水曜日" => ["ずこう", "さんすう", "こくご", "たいいく", "こくご"],
            "木曜日" => ["せいかつか", "せいかつか", "ずこう", "こくご", "どうとく"],
            "金曜日" => ["こくご", "こくご", "がっかつ", "せいかつか", "こくご"] }

get '/' do
  @weeks = @@datas.keys
  erb :index
end

get '/show' do
  @week = params["week"]
  @datas = @@datas[@week]
  erb :show
end

get '/edit' do
  @week = params["week"]
  @count = params["count"].to_i - 1
  @class = @@datas[@week][@count]
  @classes = @@datas.values.flatten.uniq
  erb :edit
end

post '/update' do
  @week = params["week"]
  @count = params["count"].to_i
  @class = params["class"]
  @@datas[@week][@count] = @class

  @datas = @@datas[@week]
  erb :show
end
