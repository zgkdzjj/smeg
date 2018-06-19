class FeaturesController < ApplicationController

  before_action :load_feature, only: [:show, :edit, :update, :destroy]

  has_scope :search_features
  # has_scope :by_feature_type

  def index
    @features = apply_scopes(Feature).page(params[:page]).per(10)
  end

  def show
    respond_to do |format|
      format.html
    end
  end

  def new
    @feature = Feature.new
  end

  def create
    @feature = Feature.new(permitted_params.feature)

    if @feature.save(permitted_params.feature)
      redirect_to features_path
    else
      render :new, notice: "Failed to created new feature - #{@feature.errors.full_messages.join(', ')}"
    end
  end

  def edit
  end

  def update
    if @feature.update(permitted_params.feature)
      redirect_to features_path
    else
      render :edit, notice: "Failed to update feature - #{@feature.errors.full_messages.join(', ')}"
    end
  end

  def destroy
    @feature.destroy
    redirect_to features_path
  end

private

  def load_feature
    @feature = Feature.find(params[:id])
  end

end