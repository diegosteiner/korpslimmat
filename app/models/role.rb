module Role
  ROLES = %i(user admin)

  extend ActiveSupport::Concern

  included do
    def roles=(roles)
      self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
    end

    def roles
      ROLES.reject do |r|
        ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
      end
    end

    def has_role role
      roles.include?(role.to_sym)
    end
  end
end