class SessionsController < Devise::SessionsController
  def create
    @user = User.find_for_twitter_oauth(auth_hash)
    self.current_user = @user
    redirect_to '/'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
