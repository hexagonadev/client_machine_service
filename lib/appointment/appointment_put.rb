class AppointmentPut

  def update(id, options)
    payload = options
    appointment_update = RestClient.put("localhost:3000/appointments/#{id}", payload.to_json, {content_type: :json, accept: :json})
    puts appointment_update
  end
end