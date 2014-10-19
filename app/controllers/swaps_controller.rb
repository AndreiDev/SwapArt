class SwapsController < ApplicationController

  load_and_authorize_resource

  def index
    load_swaps
  end

  def show
    load_swap
  end

  def new
    build_swap
  end

  def create
    build_swap
    save_swap or render 'new'
  end

  def edit
    load_swap
    build_swap
  end

  def update
    load_swap
    build_swap
    save_swap or render 'edit'
  end

  def destroy
    load_swap
    @swap.destroy
    redirect_to swaps_path
  end

  private

  def load_swaps
    @swaps ||= swap_scope.to_a
  end

  def load_swap
    @swap ||= swap_scope.find(params[:id])
  end

  def build_swap
    @swap ||= swap_scope.build
    @swap.attributes = swap_params
  end

  def save_swap
    if @swap.save
      redirect_to @swap
    end
  end

  def swap_params
    swap_params = params[:swap]
    swap_params ? swap_params.permit(:user1_id, :user2_id, :user1_items, :user2_items) : {}
  end

  def swap_scope
    Swap.all
  end
end
