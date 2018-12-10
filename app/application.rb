#require 'pry'
class Application
  @@items = [Item.new("Apples", 3.24), Item.new("Bananas",1.72)]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match (/items/)

      item_name = req.path.split("/items/").last

        if item =@@items.find do |item| item.name == item_name
          end
      resp.write item.price
    else

      resp.write "Item not found"
      resp.status = 400

    end

      #
      # search_item = req.paramas["q"]
      #
      #   if @@items.include?(search_item)
      #     @@items.select do |item|
          #  binding.pry

        else
          resp.write "Route not found"
          resp.status = 404
  end
  resp.finish
end
end
