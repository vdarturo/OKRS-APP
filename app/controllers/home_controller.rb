class HomeController < ApplicationController
  def index
    @organization = Organization.first
    @objectives = Objective.all
    @key_results = KeyResult.all
    @initiatives = Initiative.all
  end
end
