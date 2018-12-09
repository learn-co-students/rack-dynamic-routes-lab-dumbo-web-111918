class Application

  def call(env)
    @@items =[Item.new("Figs",3.42),Item.new("Pears",0.99)]
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      # binding.pry
      if @@items.find{|i| i.name}.name == req.path.split("/items/").last
        specific_item = req.path.split("/items/").last #turn /songs/Sorry into Sorry
        item_place = @@items.find{|i| i.name == specific_item}

        resp.write item_place.name
        resp.write " "
        resp.write item_place.price
      else
        resp.write "Item not found"
        resp.status = 400
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end



end
