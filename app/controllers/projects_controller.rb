class ProjectsController < ApplicationController
  before_filter :login_required, :only => [:edit, :new, :update, :create]
  def index
    @project = Project.new
    @projects = Project.all
  end
  
  def show
    @project = Project.find(params[:id])
  end
  
  def new
    @project = Project.new
    @categories = Category.all
  end
  
  def edit
    @project = Project.find(params[:id])
  end
  
  def update
    @project = Project.find(params[:id])
    values = params[:project]
    values[:user_id] = current_user.id
    
    @project.update_attributes(values)
    
    @categories = Category.all
    
    render :action => 'show'
  end
  
  def create
    @project = Project.new
    values = params[:project]
    values[:user_id] = current_user.id
    
    @project.update_attributes!(values)
    
    render :action => 'show'
  end
end
