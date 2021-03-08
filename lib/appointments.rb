class Appointment

  def self.index(user_id)
    response = RestClient.get("localhost:3000/users/#{user_id}/appointments", { accept: 'application/json' })
    appointments = JSON.parse(response.body)
    puts appointments.inspect
  end

  def self.show(id)
    response = RestClient.get("localhost:3000/appointments/#{id}", { accept: 'application/json' })
    appointments = JSON.parse(response.body)
    puts appointments.inspect

  end

  def self.create(user_id, params)
    payload = params
    response = RestClient.post("localhost:3000/users/#{user_id}/appointments", payload.to_json, {content_type: :json, accept: :json})
    appointment = JSON.parse(response.body)
    puts appointment.inspect
  end

  def self.update(id, params)
    payload = params
    response = RestClient.put("localhost:3000/appointments/#{id}", payload.to_json, {content_type: :json, accept: :json})
    appointment = JSON.parse(response.body)
    puts appointment.inspect
  end

  def self.delete(id)
    response = RestClient.delete("localhost:3000/appointments/#{id}", { accept: 'application/json' })
    appointment = JSON.parse(response.body)
    puts appointment.inspect
  end
end
