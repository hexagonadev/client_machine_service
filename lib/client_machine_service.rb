require "client_machine_service/version"
require "json"
require "rest-client"
require_relative "user/user_get"
require_relative "user/user_post"
require_relative "user/user_put"
require_relative "user/user_delete"
require_relative "vehicle/vehicle_get"
require_relative "vehicle/vehicle_post"
require_relative "vehicle/vehicle_put"
require_relative "vehicle/vehicle_delete"
require_relative "appointment/appointment_get"
require_relative "appointment/appointment_post"
require_relative "appointment/appointment_put"
require_relative "appointment/appointment_delete"

module ClientMachineService
  class Error < StandardError; end

  def self.start
    # response = RestClient.get('localhost:3000/users', { accept: 'application/json' })
    # users = JSON.parse(response.body)
    # puts users.inspect
    # users.each do |user|
    #   puts user['id']
    #   puts user['name']
    #   puts user['last_name']
    #   puts user['email']
    #   puts "-------------------"
    # end
  end
   #puts UserPost.new.create('mireillepe', 'perez', 'l@hftfddsu.com')
   #puts UserGet.new.index
   #puts UserGet.new.show(1)
   #puts UserDelete.new.destroy(1)
   #puts UserPut.new.update(1, {name: 'petra', last_name: 'perez', emal: 'mire@gmail.com'})
   #puts VehiclePost.new.create(1, { brand: 'toyota', model: 'corolla', engine_size: '1.6', year: '2008', color: 'negro', vin: 'tyr62l', kind: 'carro' })
   #puts VehicleGet.new.show(4)
   puts VehicleGet.new.index(2)
   #puts VehicleDelete.new.destroy(6)
   #puts VehiclePut.new.update(7, {brand: 'chevrolet', engine_size: '1.8'})
   #puts AppointmentGet.new.index(1)
   #puts AppointmentGet.new.show(1)
   #puts AppointmentPost.new.create(1, { vehicle_id: '8', description: 'cambio de frenos', appointment_date: '01/04/21'})
   #puts AppointmentPut.new.update(1, { description: "aceite de motor"})
   #puts AppointmentDelete.new.destroy(1)
end
