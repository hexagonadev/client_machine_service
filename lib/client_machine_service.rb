require "client_machine_service/version"
require "json"
require "rest-client"

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
end
