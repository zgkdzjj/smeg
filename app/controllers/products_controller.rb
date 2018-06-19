class ProductsController < BaseController

  before_action :load_product, only: [:show, :edit, :update, :destroy, :history]
  before_action :set_paper_trail_whodunnit

  has_scope :search_products

  def index
    @products = apply_scopes(Product).page(params[:page]).per(10).order(type: :asc)
  end

  def show
    respond_to do |format|
      format.html
      format.pdf do
        fetch_pdf
      end
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(permitted_params.product)
  end

  def edit
  end

  def update
    if @product.update(permitted_params.product)
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end

  def history
    respond_to do |format|
      format.json {
        render json: json_success_response("/products/modal_product_history",
                      { product: @product },
                      ), status: :ok
      }
    end
  end

private

  def load_product
    @product = Product.friendly.find params[:id]
  end

  def fetch_pdf
    case params.fetch('pdf', '')
      when 'silent-salesmen'
        pdf = ::ProductPdf::SummarySheet.new(@product)
        filename = 'silent-salesment.pdf'
      else
        pdf = ::ProductPdf::SpecSheet.new(@product)
        filename = 'product_spec.pdf'
    end

    send_data pdf.render, filename:  "product_spec.pdf", type: "application/pdf", disposition: 'attachment'
  end

end
