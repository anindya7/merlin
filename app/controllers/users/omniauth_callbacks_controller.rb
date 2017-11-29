class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end

  def facebook
    @user = User.create_from_provider_data(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    elsif User.where(email: @user.email).where(provider: 'google_oauth2').any?
      flash[:alert] = "Your email address has already been used by your Google account. Please login via Google."
      redirect_to new_user_session_path
    elsif @user.provider.nil? || @user.uid.nil? || @user.email.nil?
      flash[:alert] = "There was a problem signing you in. Please register or try signing in later.."
      redirect_to new_user_session_path
    else
      flash[:alert] = "There was a problem signing you in. Please register or try signing in later.."
      redirect_to new_user_session_path
    end
  end

  # google callback
  def google_oauth2
    @user = User.create_from_provider_data(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
    elsif User.where(email: @user.email).where(provider: 'facebook').any?
      flash[:alert] = "Your email address has already been used by your Facebook account. Please login via Facebook."
      redirect_to new_user_session_path
    elsif @user.provider.nil? || @user.uid.nil? || @user.email.nil?
      flash[:alert] = "There was a problem signing you in. Please register or try signing in later.."
      redirect_to new_user_session_path
    else
      flash[:alert] = "There was a problem signing you in. Please register or try signing in later.."
      redirect_to new_user_session_path
    end 
  end

  def failure
    flash[:alert] = "There was a problem signing you in. Please register or try signing in later.."
    redirect_to new_user_session_path
  end
end
