# frozen_string_literal: true

module DeviseRequestMacros
  include Warden::Test::Helpers
  def login_user(user)
    scope = Devise::Mapping.find_scope!(user)
    login_as(user, scope: scope)
  end
end
