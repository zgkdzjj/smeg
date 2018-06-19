GrapeSwaggerRails.options.url      = "api/swagger_doc"
GrapeSwaggerRails.options.app_name = 'SMEG API'
GrapeSwaggerRails.options.app_url  = '/'
GrapeSwaggerRails.options.headers['Accept'] = 'application/vnd.smeg-v1+json'
GrapeSwaggerRails.options.api_key_name = 'Authorization'
GrapeSwaggerRails.options.api_key_type = 'header'
GrapeSwaggerRails.options.api_key_default_value = User.find_by(email: 'admin@sentia.com.au').try(:authentication_token) rescue nil #Can't run initial migrations unless rescue here

# GrapeSwaggerRails.options.before_filter do |request|
#   unless current_user.try(:admin?)
#     redirect_to Rails.application.routes.url_helpers.root_path
#   end
# end
