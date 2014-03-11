class StaticPagesController < ApplicationController
  def home
  end

  def shelter_form
  end

  def breed_form
    @breed_name = params[:breed_param]
  end
end
