class HomesController < ApplicationController

  def index
  end
def top
	 @plans = Plan.all
end

def about
end
end
