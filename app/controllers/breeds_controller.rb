class BreedsController < ApplicationController

  def index
  end

  def find
    @answers = Answer.all
  end
end
