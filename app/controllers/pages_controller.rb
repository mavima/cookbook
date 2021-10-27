class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:home, :about, :instructions, :privacy_policy]

  # before_action :authenticate_user!, only: [:new, :edit]

  def home
  end

  def about
  end

end
