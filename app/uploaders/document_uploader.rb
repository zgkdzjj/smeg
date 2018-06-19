class DocumentUploader < BaseUploader

  # process :store_dimensions

  def extension_white_list
    %w(jpg jpeg gif png pdf)
  end

  private

  # def store_dimensions
  #   if file && model
  #     model.width, model.height = `identify -format "%wx%h" #{file.path}`.split(/x/)
  #   end
  # end

end
