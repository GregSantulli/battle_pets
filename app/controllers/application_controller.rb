class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  protected

  #make this RPC for scalability
  def authenticate
    authenticate_token || render_unauthorized
  end

  def authenticate_token
    authenticate_with_http_token do |token, options|
      User.find_by(auth_token: token)
    end
  end

  def render_unauthorized
    self.headers['WWW-Authenticate'] = 'Token realm="Application"'
    render json: "404", status: 404
  end

end
