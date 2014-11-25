class SessionsController < Devise::SessionsController
  def create
    @user = User.find_for_twitter_oauth(auth_hash)
    sign_in(@user)
    redirect_to '/'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
