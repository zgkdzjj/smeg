class ApplicationController < ActionController::Base
  include Pundit
  include JsonResponseConcern

  protect_from_forgery with: :exception

  before_action :init_gon
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_paper_trail_whodunnit

  def permitted_params
    @permitted_params ||= PermittedParams.new(params, current_user)
  end
  helper_method :permitted_params

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password, :password_confirmation, :remember_me])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :remember_me])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :first_name, :last_name, :email, :password, :password_confirmation, :current_password])
  end

  rescue_from Pundit::NotAuthorizedError do |exception|
    policy_name = exception.policy.class.to_s.underscore

    respond_to do |format|
      format.html do
        if exception.policy.nil?
          flash[:alert] = "#{exception}"
        else
          flash[:alert] = I18n.t "pundit.#{policy_name.gsub('/', '.')}.#{exception.query}",
            default: 'You are not authorised to perform this action'
        end

        redirect_to(root_path)
      end
      format.json { render json: {
        flash: {
          warning: I18n.t("pundit.#{policy_name.gsub('/', '.')}.#{exception.query}", default: 'You are not authorised to perform this action')
        },
        error: exception,
        message: 'You are not authorised to perform this action'
      }, status: :forbidden }
    end
  end

private

  def init_gon
    gon.push env: Rails.env, env_vars: { raven_dsn: raven_dsn, version: Smeg::VERSION }
    # gon.push user: current_user if user_signed_in?
  end

  def raven_dsn
    ENV["RAVEN_PUBLIC_DSN"] if Rails.env.production? || Rails.env.staging?
  end
end
