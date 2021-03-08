class UserPut

  def update(id, options)
      payload = options
      update_user = RestClient.put("localhost:3000/users/#{id}", payload.to_json, {content_type: :json, accept: :json})
      puts update_user
  end

end