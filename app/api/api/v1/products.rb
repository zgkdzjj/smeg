module API::V1
  class Products < API::V1::Base

    resource :products do
      before do
        # authenticate_user!
      end

      desc 'Get a list of products', entity: API::Entities::Product
      get '/' do
        products = Product.all
      end

      route_param :model_number do
        before do
          # @product = Product.find_by model_number: params[:model_number]
          @product = Product.where('lower(model_number) = ?', params[:model_number].downcase).first
        end

        desc 'Get a single product', entity: API::Entities::Product
        get do
          present @product, with: API::Entities::Product
        end

      end
    end

  end
end
