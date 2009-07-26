class CreditsController < ApplicationController
  before_filter :login_required, :only => [:create]
  def create
    c = Credit.new
    values = params[:credit]
    values[:user_id] = @current_user.id
    c.update_attributes(values)
    render :text => "Credits added, plz to be hitting back"
  end
end
