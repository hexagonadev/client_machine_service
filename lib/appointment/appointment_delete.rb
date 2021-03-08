class AppointmentDelete

  def destroy(id)
    appointment = RestClient::Request.execute(method: :delete, url: "localhost:3000/appointments/#{id}", headers: { accept: 'application/json' })
    puts appointment
  end

end