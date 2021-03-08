class AppointmentPost

  def create(user_id, options)
    payload = options
    create_appoinment = RestClient.post("localhost:3000/users/#{user_id}/appointments", payload.to_json,{content_type: :json, accept: :json})
    puts create_appoinment

  end
end