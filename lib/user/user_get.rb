class UserGet

  def index
    response = RestClient.get('localhost:3000/users', { accept: 'application/json' })
    users = JSON.parse(response.body)
    puts users.inspect
    users['users'].each do |user|
      puts user ['id']
      puts user['name']
      puts user['last_name']
      puts user['email']
      puts "-------------------"
    end
  end

  # {"users" => [user2, user2]}

  # [user1, , user2]

  def show(id)
    user = RestClient.get("localhost:3000/users/#{id}", { accept: 'application/json' })
    puts user
  end
end