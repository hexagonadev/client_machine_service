class UserPut

  def update(name, last_name, email)
      payload = { name: name, last_name: last_name, email: email }
      create_user = RestClient.put('localhost:3000/users', payload.to_json, {content_type: :json, accept: :json})
      puts create_user
  end

end