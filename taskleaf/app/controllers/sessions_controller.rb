class SessionsController < ApplicationController
  skip_before_action :login_required

  def new
  end

  def create
    user = User.find_by(email: session_param[:email])

    if user&.authenticate(session_param[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: 'ログインしました。'
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_url, notice: 'ログアウトしました。'
  end

  private

  def session_param
    params.require(:session).permit(:email, :password)
  end
end
