require "client_machine_service/version"
require "json"
require "rest-client"
require_relative "users"
require_relative "vehicles"
require_relative "appointments"
require_relative "menu/display"

module ClientMachineService
  class Error < StandardError; end

  def self.start
    Display.start

    #response = RestClient.get('localhost:3000/users', { accept: 'application/json' })
    #users = JSON.parse(response.body)
    #puts users.inspect
    #users.each do |user|
    #  puts user['id']
    #  puts user['name']
    #  puts user['last_name']
    #  puts user['email']
    #  puts "-------------------"
    #end

    #users = User.index
    #users.first.delete


    #user = User.new
    #user.name = get.chop

    #User.index(search: {email: 'ca@ca.com'})
    #user.save
    #User.show(id: 3)
    #User.create(name: 'example2', last_name: 'hola2', email: '2daprueba@mail')
    #User.update(name: 'example2', last_name: 'hola2', email: '2daprueba@mail')
    #User.delete(3)

    #Vehicle.index(4)
    #Vehicle.show(8)
    #Vehicle.create(4, kind:'carroooo', brand: 'bueno', engine_size: 'pequeño', model: 'fino', year: '2021', color: 'gris', vin: 'ejemplo')
    #Vehicle.update(5, kind:'carrooo', brand: 'bueno', engine_size: 'pequeño', model: 'fino', year: '2021', color: 'gris', vin: 'update')
    #Vehicle.delete(5)

    #Appointment.index(2)
    #Appointment.show(2)
    #Appointment.create(4, vehicle_id: 8, description: 'mantenimiento', appointment_date: '08/03/2021')
    #Appointment.update(6, vehicle_id: 8, description: 'UPDATE', appointment_date: '08/03/2021')
    #Appointment.delete(6)
  end
end
