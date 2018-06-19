module API
  module Formatter

    def self.call data, env
      # Return data as it is for swagger
      return data.to_json if env["REQUEST_URI"].include? "/api/swagger_doc"

      {}.tap do |response|
        response[:data] = data
        if data.respond_to? :options
          response[:meta] = data.options[:meta] || {}
        end
      end.to_json
    end
  end
end
