class GroupsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @user = current_user
    @groups = Group.order(:created_at).where(user: @user)
    @total = 0
    @groups.each do |group|
      @total += group.entities.sum(:amount)
    end
  end

  def show
    @user = current_user
    @groups = Group.order(:created_at).where(user: @user)
  end

  def new
    @user = current_user
    @group = Group.new
  end

  def create
    @group = Group.new group_params
    @group.user = current_user
    
    if @group.save
      redirect_to user_groups_path(current_user)
    else
      render :new
    end
  end

  private

  def group_params
      params.require(:group).permit(:name, :icon)
  end
end
