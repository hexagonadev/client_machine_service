
class User

  def self.index
    response = RestClient.get("localhost:3000/users", { accept: 'application/json' })
    users = JSON.parse(response.body)
    puts users.inspect
  end

  def self.show(id)
    response = RestClient.get("localhost:3000/users/#{id}", { accept: 'application/json' })
    users = JSON.parse(response.body)
    puts users.inspect

  end

  def self.create(params)
    payload = params
    response = RestClient.post('localhost:3000/users', payload.to_json, {content_type: :json, accept: :json})
    users = JSON.parse(response.body)
    puts users.inspect
  end

  def self.delete(id)
    response = RestClient.delete("localhost:3000/users/#{id}", { accept: 'application/json' })
    user = JSON.parse(response.body)
    puts user.inspect
  end

end