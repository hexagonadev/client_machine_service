class VehiclePut

    def update(id, options)
      payload = options
      vehicle_update = RestClient.put("localhost:3000/vehicles/#{id}", payload.to_json, {content_type: :json, accept: :json})
      puts vehicle_update
  end

end