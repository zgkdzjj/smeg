module API::V1
  class Base < API::Base
    version 'v1', using: :header, vendor: 'smeg'

    format :json

    mount API::V1::Products

  end
end
