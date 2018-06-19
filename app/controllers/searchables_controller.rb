class SearchablesController < ApplicationController

  def features
    if params[:search].present?
      @features = Feature.search_features(params[:search])
    else
      @features = Feature.search_features
    end

    respond_to do |format|
      format.json { render json: { features: @features.map { |x| { id: x.id, text: "#{x.name}" } } } }
    end
  end

end