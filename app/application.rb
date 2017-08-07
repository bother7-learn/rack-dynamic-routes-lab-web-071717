class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      response = req.path.split("/items/").last
      x = Item.all.find do |item|
        item.name == response
        end
      if x != nil
        resp.write "#{x.price}"
      else
        resp.status = 400
        resp.write "Item not found"
      end
    else
      resp.status = 404
      resp.write "Route not found"
    end
    resp.finish
  end

end
