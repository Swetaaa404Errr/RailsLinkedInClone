# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end
  skip_before_action :verify_authenticity_token, only: [:linkedin_callback]


  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id

      if logged_in? && admin?
        redirect_to dash_path

      else
        redirect_to dashboard_path
      end
    else
      flash[:alert] = 'Invalid email or password'
      flash.discard
      render :new

    end
  end

  def linkedin
    auth = request.env['omniauth.auth']
    user = User.from_omniauth(auth)

    session[:user_id] = user.id
    redirect_to dashboard_path
  end

  def linkedin_callback
    response = HTTParty.post('https://www.linkedin.com/oauth/v2/accessToken', {
                               body: {
                                 grant_type: 'authorization_code',
                                 code: params[:code],
                                 redirect_uri: 'http://127.0.0.1:3000/auth/linkedin/callback',
                                 client_id: '86voukkn7q471o',
                                 client_secret: 'qhQmZRz2YXDN8lRj'
                               }
                             })

    access_token = response['access_token']

    # Do something with the access token, such as store it in the session or database
    # and redirect the user to a new page.
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out successfully'
  end
end
