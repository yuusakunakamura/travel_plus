class SearchController < ApplicationController
  def search
    @model = params["search"]["model"]
    @content = params["search"]["content"]
    @method = params["search"]["method"]
    @records = search_for(@model, @content, @method)
  end

  private
  def search_for(model, content, method)
    if model == 'plan'
      if method == 'perfect'
        Plan.where(title: content)
      elsif method == 'forward'
        Plan.where('title LIKE ?', content+'%')
      elsif method == 'backward'
        Plan.where('title LIKE ?', '%'+content)
      else 
        Plan.where('title LIKE ?', '%'+content+'%')
      end
    end
  end
end
