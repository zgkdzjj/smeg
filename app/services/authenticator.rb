class Authenticator
  class << self

    # Generates a JWT token for a user
    #
    def generate_access_token user=nil
      payload = {
        user_id: user.id,
        name: user.name,
        created: Time.now,
      }
      JWT.encode payload, ENV["SECRET_KEY_BASE"], 'HS256'
    end

    # Authenticates that a JWT token is valid
    #
    def authenticate token
      begin
        JWT.decode token, ENV["SECRET_KEY_BASE"], true, { :algorithm => 'HS256' }
      rescue => e
        raise e
      end
    end

    # Provided a JWT token, will return a user
    #
    def user_for_authentication token
      user_id = authenticate(token).first.fetch("user_id", nil)
      return nil if user_id.nil?
      User.find(user_id)
    end

  end
end
