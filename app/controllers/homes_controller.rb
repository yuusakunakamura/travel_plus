class HomesController < ApplicationController
def top
	 @plans = Plan.all
end

def about
end

end
