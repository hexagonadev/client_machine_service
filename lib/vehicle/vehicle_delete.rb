class VehicleDelete

  def destroy(id)
    vehicle = RestClient::Request.execute(method: :delete, url: "localhost:3000/vehicles/#{id}",
           headers: { accept: 'application/json' })
    puts vehicle
  end
end