module Options
  class Roles < Base

    class UserRoles < Roles

      def initialize(option)
        @option = option
      end

      @options = %w(admin user)

      def to_s
        I18n.t @option, scope: [:options, :roles, :user_roles]
      end
    end
  end
end
