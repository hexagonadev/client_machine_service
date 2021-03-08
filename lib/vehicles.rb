class Vehicle

  def self.index(user_id)
    response = RestClient.get("localhost:3000/users/#{user_id}/vehicles", { accept: 'application/json' })
    vehicles = JSON.parse(response.body)
    puts vehicles.inspect
  end

  def self.show(id)
    response = RestClient.get("localhost:3000/vehicles/#{id}", { accept: 'application/json' })
    vehicle = JSON.parse(response.body)
    puts vehicle.inspect

  end

  def self.create(user_id, params)
    payload = params
    response = RestClient.post("localhost:3000/users/#{user_id}/vehicles", payload.to_json, {content_type: :json, accept: :json})
    vehicle = JSON.parse(response.body)
    puts vehicle.inspect
  end

  def self.update(id, params)
    payload = params
    response = RestClient.put("localhost:3000/vehicles/#{id}", payload.to_json, {content_type: :json, accept: :json})
    vehicle = JSON.parse(response.body)
    puts vehicle.inspect
  end

  def self.delete(id)
    response = RestClient.delete("localhost:3000/vehicles/#{id}", { accept: 'application/json' })
    vehicle = JSON.parse(response.body)
    puts vehicle.inspect
  end
end