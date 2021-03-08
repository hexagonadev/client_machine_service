class VehiclePost

  def create(user_id, options)
    payload = options
    #payload = { brand: brand, model: model, engine_size: engine_size, year: year, color: color, vin: vin, kind: kind }
    create_vehicle = RestClient.post("localhost:3000/users/#{user_id}/vehicles", payload.to_json,{content_type: :json, accept: :json})
    puts create_vehicle
  end

  # def self.post(url, payload, headers={}, &block)
  #   Request.execute(:method => :post, :url => url, :payload => payload, :headers => headers, &block)
  # end

end