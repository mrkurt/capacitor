class PledgesController < ApplicationController
  before_filter :login_required, :only => [:edit, :new, :update, :create]
  def create
    values = params[:pledge]
    p = Pledge.new
    values[:user_id] = @current_user.id
    if p.update_attributes(values)
      render :text => "Amount pledged, plz to be hitting back"
    else
      render :text => "Pledge not valid (#{p.errors.join(', ')})"
    end
  end
end
