class SessionsController < Devise::SessionsController
  def new
    super
  end

  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource_name, resource)
    if !session[:return_to].blank?
      redirect_to session[:return_to]
      session[:return_to] = nil
    else
      after_sign_in_path_for(resource)
    end
  end

   def after_sign_in_path_for(resource)
    # check for the class of the object to determine what type it is
    redirect_to posts_path
  end
end
