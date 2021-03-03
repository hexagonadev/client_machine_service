class UserGet
  def initialize
    @users = RestClient.get('localhost:3000/users', { accept: 'application/json' })
  end

  def index
    users = JSON.parse(@users)
    users.each do |user|
      puts user['id']
      puts user['name']
      puts user['last_name']
      puts user['email']
      puts "-------------------"
    end
  end

  def show(id)
    user = RestClient.get("localhost:3000/users/#{id}", { accept: 'application/json' })
    puts user
  end
end