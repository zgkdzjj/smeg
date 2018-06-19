class Feature < ApplicationRecord
  include PgSearch

  pg_search_scope :search_features,
                  against: [:name, :short_description],
                  using: { tsearch: { prefix: true, any_word: false } }

  validates :name, presence: true, uniqueness: { case_sensitive: false }

end