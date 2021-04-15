require 'jwt'

class AuthenticationTokenService
  HMAC_SECRET = ENV['HASH_SECRET']
  ALGORITHM_TYPE = ENV['ALGORITHM_TYPE']
  def self.call(user_id)
    payload = { user_id: user_id }
    JWT.encode payload, HMAC_SECRET, ALGORITHM_TYPE
  end

  def self.decode(token)
    p token.inspect
    decoded_token =
      JWT.decode token, HMAC_SECRET, true, { algorithm: ALGORITHM_TYPE }

    # p decoded_token
    # byebug
    decoded_token[0]['user_id']
  end
end
