module ApplicationHelper

  ## fingerprinted_asset
  #
  # webpack handles the front end resources and for production it bundles them
  # and adds a fingerprint to the application.js/application.css files and writes
  # the current fingerprint to /config/initializers/fingerprint.rb
  def fingerprinted_asset(name)
    environment_with_precompiled_assets? ? "#{name}-#{ASSET_FINGERPRINT}" : name
  end

  private

  def environment_with_precompiled_assets?
    Rails.env.production? || Rails.env.staging?
  end

end
