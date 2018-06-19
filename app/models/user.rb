class User < ApplicationRecord
  include ActsAsRole

  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable #, :registerable,

  def name
    [firstname, surname].reject(&:blank?).join(' ')
  end

end
