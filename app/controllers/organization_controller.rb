class OrganizationController < ApplicationController
  def index
    user = User.find_by(email: current_user.email)
    @organization = Organization.find(user.organization_id)
  end
end
