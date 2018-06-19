module API
  module Entities
    class ProductAttachment < Grape::Entity
      expose :id,   documentation: { type: 'Integer', desc: 'Id' }
      expose :attachment

    end
  end
end
