class RegisteredApplicationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @registered_application = RegisteredApplication.all
  end

  def show
    @registered_application = RegisteredApplication.find(params[:id])
    @events = @registered_application.events.group_by(&:name)
  end

  def new
    @registered_application = RegisteredApplication.new
  end

  def create
    @registered_application = RegisteredApplication.new(registered_application_params)
    @registered_application.user = current_user

    if @registered_application.save
      flash[:notice] = "\"#{@registered_application.name}\" was successfully created."
      redirect_to @registered_application
    else
      flash.now[:alert] = "There was an error creating the registered application."
      render :new
    end
  end

  def edit
    @registered_application = RegisteredApplication.find(params[:id])
  end

  def update
    @registered_application = RegisteredApplication.find(params[:id])
    @registered_application.assign_attributes(registered_application_params)

    if @registered_application.save
      flash[:notice] = "Registered application was updated."
      redirect_to [@registered_application]
    else
      flash.now[:alert] = "There was an error updating the registered application. Please try again."
      render :edit
    end
  end

  def destroy
    @registered_application = RegisteredApplication.find(params[:id])

    if @registered_application.destroy
      flash[:notice] = "\"#{@registered_application.name}\" was successfully removed."
      redirect_to @registered_application
    else
      flash.now[:alert] = "There was an error removing the registered application."
      render :show
    end
  end

  private
  def registered_application_params
    params.require(:registered_application).permit( :name, :url)
  end
end
