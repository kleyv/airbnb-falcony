class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @project = Project.all.sample
  end
end
