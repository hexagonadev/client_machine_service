class AppointmentGet

  def index(1)
    response = RestClient.get("localhost:3000/users/#{id}/appoinments", { accept: 'application/json' })
    appoinments = JSON.parse(response.body)
    puts appoinments.inspect
    appoinments['appoinments'].each do |appointment|
      puts appointment['appointment_date']
      puts appointment['description']
      puts "-------------------"
    end
  end

  def show(id)
    appointment = RestClient.get("localhost:3000/appoinments/#{id}", { accept: 'application/json' })
    puts appointment
  end
end