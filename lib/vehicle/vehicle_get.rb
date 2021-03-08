class VehicleGet

  def index(user_id)
    response = RestClient.get("localhost:3000/users/#{user_id}/vehicles", { accept: 'application/json' })
    vehicles = JSON.parse(response.body)
    puts vehicles.inspect
    vehicles['vehicles'].each do |vehicle|
      puts vehicle ['user_id']
      puts vehicle['id']
      puts vehicle ['brand']
      puts vehicle['model']
      puts vehicle['engine_size']
      puts vehicle['year']
      puts vehicle['color']
      puts vehicle['vin']
      puts vehicle['kind']
      puts "-------------------"
    end
  end

  def show(id)
    vehicle = RestClient.get("localhost:3000/vehicles/#{id}", { accept: 'application/json' })
    puts vehicle
  end
end