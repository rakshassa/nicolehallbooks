class User < ApplicationRecord
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)

      user.is_admin = (auth.uid == '112147459352028128295' && auth.provider == 'google_oauth2')
      user.save!
    end
  end

  def self.validate(name, secret)
    return false if name.blank?
    return false if secret.blank?

    User.where(name: name, secret: secret)
  end
end
