require 'grape-swagger'

module API
  class Base < Grape::API
    include Grape::Kaminari
    require 'grape_logging'
    # logger.formatter = GrapeLogging::Formatters::Default.new
    # use GrapeLogging::Middleware::RequestLogger, { logger: logger }
    prefix 'api'

    rescue_from :all, :backtrace => true

    error_formatter :json, API::ErrorFormatter
    formatter :json, API::Formatter

    helpers do
      # API-wide helper to declare params
      def permitted_params
        declared(params, { include_missing: false })
      end
    end

    before do
      header['Access-Control-Allow-Origin'] = '*'
      header['Access-Control-Request-Method'] = '*'
    end

    # Rescue from errors
    rescue_from ActiveRecord::RecordNotFound do |e|
      error_response(message: [e.message], status: 404)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      error_response(message: [e.message], status: 422)
    end

    rescue_from Pundit::NotAuthorizedError do |exception|
      policy_name = exception.policy.class.to_s.underscore
      if exception.policy.nil?
        error_response(message: [e.message], status: 403)
      else
        msg = I18n.t "pundit.#{policy_name.gsub('/', '.')}.#{exception.query}", default: "You are not authorised to perform this action"
        error_response(message: [msg], status: 403)
      end
    end

    rescue_from :all do |e|
      p "ERROR:: (#{e.class.name}) - #{e.message}"
      error_response({ message: ["(#{e.class.name}) - #{e.message}"],
        backtrace: e.backtrace})
    end

    helpers do
      include Pundit

      def maybe_authenticate
        authenticate_user! if headers["Authorization"]
      end

      def authenticate_user!
        error!(["401 Unauthorized"], 401) unless authenticated
      end

      def authenticated
        headers["Authorization"] && @user = User.find_by_authentication_token(headers["Authorization"])
      end

      def current_user
        @user
      end
    end

  mount API::V1::Base
  add_swagger_documentation api_version: 'v1',
                          hide_documentation_path: true,
                          info: { title: 'Smeg On API docs' }
  end
end
