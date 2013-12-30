class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def renren
    uid = env["omniauth.auth"]["uid"]
    user = User.find_by_uid(uid) || User.create!(:uid => uid, :username => env["omniauth.auth"]["info"]["name"],:password=>Devise.friendly_token[0,20],:email=>uid.to_s+"@tjjtds.me")
    sign_in_and_redirect user
  end
end
