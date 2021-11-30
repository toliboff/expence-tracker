class EntitiesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def new
    @entity = Entity.new
    @user = current_user
    @groups = Group.where(user: @user)
  end

  def create

    @entity = Entity.new(entity_params)
    # @entity = Entity.new(entity_params[:name], entity_params[:amount])
    @entity.author = current_user

    if @entity.save
      redirect_to user_groups_path(current_user), notice:'Entity added succesfully'
    else
      render :new, notice: "Ooops, something went wrong"
    end

  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount, group_ids:[])
    
  end
end
