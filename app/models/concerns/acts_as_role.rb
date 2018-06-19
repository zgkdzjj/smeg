module ActsAsRole
  extend ActiveSupport::Concern
  include ActionView::Helpers::TextHelper

  included do

    def self.roles
      "Options::Roles::#{to_s}Roles".constantize.all_as_sym
    end

    def roles
      "Options::Roles::#{self.class.to_s}Roles".constantize.all_as_sym
    end

    validates :role, presence: true, allow_nil: false
    validates :role, inclusion: { in: roles.map {|r| r.to_s}, allow_blank: false }

    roles.each do |role|
      # Add Scope
      scope "#{role.try(:to_s).try(:pluralize)}".to_sym, -> { where('role IN (?)', [role.to_s]) }

      # Add check method
      method_name = (role.to_s + '?').to_sym
      define_method(method_name) do
        self.role.try(:to_sym) == role.try(:to_sym)
      end
    end

  end
end
