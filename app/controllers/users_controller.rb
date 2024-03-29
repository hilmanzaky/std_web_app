class UsersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource :only => :index

  def index
#    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
