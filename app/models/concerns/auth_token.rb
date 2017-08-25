module Concerns::AuthToken
  extend ActiveSupport::Concern
  included do
    def create_jwt
      secret_key = password_digest
      payload = {id: id,
              phone: phone}
      JWT.encode(payload, secret_key)
    end
  end
end