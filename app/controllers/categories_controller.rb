class CategoriesController < ApplicationController
  def index
    @categories = 
      if params[:query].nil?
        Category.find(:all)
      else
        pattern = '%' + params[:query]+ '%'
        Category.find(:all, :conditions => ['name LIKE ? or slug LIKE ?', pattern, pattern ])
      end
    respond_to do |format|
      format.json { 
        result = { :query => params[:query] }
        result[:suggestions] = @categories.map{ |c| c.name }
        render :json => result
      }
    end
  end
end
