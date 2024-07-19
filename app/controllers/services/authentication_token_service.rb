class AuthenticationTokenService
  def self.call
    payload = { user_id: user.id }
    exp = 24.hours.from_now
    payload[:exp] = exp.to_i
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end

  def self.decode(token)
    decoded = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
    HashWithIndifferentAccess.new decoded
  end

  def self.user_from_token(token)
    decoded = decode(token)
    User.find(decoded[:user_id])
  end
end