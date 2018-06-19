module API
  module Entities
    class Product < Grape::Entity
      expose :id,   documentation: { type: 'Integer', desc: 'Id' }
      expose :model_number, documentation: { type: 'String', desc: 'Model Number' }
      expose :type, documentation: { type: 'Text', desc: 'Product Type' }
      expose :description, documentation: { type: 'Text', desc: 'Description' }
      expose :aesthetic, documentation: { type: 'Text', desc: 'Aesthetic' }
      expose :dimensions, documentation: { type: 'Text', desc: 'Dimensions' }
      expose :finish, documentation: { type: 'Text', desc: 'Finish' }
      expose :supplied_accessories, documentation: { type: 'Text', desc: 'Supplied Accessories' }
      expose :optional_accessories, documentation: { type: 'Text', desc: 'Optional Accessories' }
      expose :safety, documentation: { type: 'Text', desc: 'Safety' }
      expose :power, documentation: { type: 'Text', desc: 'Power' }
      expose :warranty, documentation: { type: 'Text', desc: 'Warranty' }
      expose :status, documentation: { type: 'boolean', desc: 'Status' }
      expose :feature_1, documentation: { type: 'text', desc: 'Feature 1' }
      expose :feature_2, documentation: { type: 'text', desc: 'Feature 2' }
      expose :feature_3, documentation: { type: 'text', desc: 'Feature 3' }
      expose :feature_4, documentation: { type: 'text', desc: 'Feature 4' }
      expose :feature_5, documentation: { type: 'text', desc: 'Feature 5' }

      expose :data

      expose :product_attachments, with: Entities::ProductAttachment
      # expose :logo

      # private

      # def logo
      #   object.logo_url(:small)
      # end
    end
  end
end
