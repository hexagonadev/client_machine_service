class UserPost
  # def initialize
  #   @user = RestClient.post('localhost:3000/users', { accept: 'application/json' })
  # end

  def create(name, last_name, email)
    payload = { name: name, last_name: last_name, email: email }
    create_user = RestClient.post('localhost:3000/users', payload.to_json, content_type: :json)
    puts create_user
  end
end