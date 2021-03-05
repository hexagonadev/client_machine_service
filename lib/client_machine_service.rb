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
   #puts UserPost.new.create('m', 'perez', 'l@hugu.com')
   #puts UserGet.new.index
  #puts UserDelete.new.destroy(5)
  #puts UserPut.new.update(1,'petra', 'perez', 'mire@gmail.com')
  #puts VehiclePost.new.create(2, 'toyota', 'corolla', '1.6', '2008', 'negro', 'ylr62l', 'carro')
  #puts VehicleGet.new.show(1)
  #puts VehicleGet.new.index(2)
   #puts VehicleDelete.new.destroy(1)
   puts AppointmentGet.new.index(1)
end
