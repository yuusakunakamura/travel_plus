# frozen_string_literal: true

class HomesController < ApplicationController
  def index; end

  def top
    @users = User.all
  end

  def about; end
end
