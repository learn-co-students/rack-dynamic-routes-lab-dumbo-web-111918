class Application

  @@items = [Item.new("lox", 10), Item.new("coke", 5)]

  def call(env)
  	resp = Rack::Response.new #creates a Rack Response obj
  	req = Rack::Request.new(env) # notice Request not response here.
  	#parses the user request contained in env

    #if req.path != "/items"
    # 	resp.write "You requested the items"
    # else
    #   resp.write 	"Route not found"
       # resp.status = 404
     #end
     if req.path.match(/items/)
    	item_to_find = req.path.split("/items/").last
    	  if item = @@items.find do |item|
          item.name == item_to_find
         end
        resp.write item.price
        else
          resp.status = 400
          resp.write "Item not found"
        end
     else
     	 resp.status = 404
       resp.write 	"Route not found"
      end
     resp.finish
  end
end
