class AuthenticationTokenService


  JWT_SECRET = "my_secret"


  def self.call(user)
    puts "AuthenticationTokenService.call"
    payload = { user_id: user.id }
    exp = 24.hours.from_now
    payload[:exp] = exp.to_i
    JWT.encode payload, JWT_SECRET, 'HS256'
  end

  def self.decode(token)
    decoded = JWT.decode token, JWT_SECRET, true, { algorithm: 'HS256' }
    HashWithIndifferentAccess.new decoded[0]
  end

  def self.user_from_token(token)
    decoded = decode(token)
    User.find(decoded[:user_id])
  end
end