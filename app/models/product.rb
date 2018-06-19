class Product < ApplicationRecord
  include PgSearch
  include Trailable

  extend FriendlyId
  friendly_id :model_number, use: :slugged

  mount_uploader :cover_image, ImageUploader

  has_paper_trail

  has_many :product_features, dependent: :destroy
  has_many :features, through: :product_features

  has_many :product_attachments, dependent: :destroy
  has_many :image_attachments, through: :product_attachments, source: :attachment, class_name: "ImageAttachment", dependent: :destroy
  has_many :schematic_attachments, through: :product_attachments, source: :attachment, class_name: "SchematicAttachment", dependent: :destroy
  has_many :file_attachments, through: :product_attachments, source: :attachment, class_name: "FileAttachment", dependent: :destroy

  accepts_nested_attributes_for :features, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :image_attachments, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :schematic_attachments, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :file_attachments, reject_if: :all_blank, allow_destroy: true

  pg_search_scope :search_products,
                  :against => [:model_number, :type, :description],
                  :using => { :tsearch => { :prefix => true } }

  validates :model_number, presence: true, uniqueness: { case_sensitive: false }
  validates :type, presence: true

  before_validation :assign_type

  def history
    own_papertrail_history = papertrail_history || []
  end

private

  def assign_type
    self.type = self.class.to_s if self.type.blank?
  end

end
