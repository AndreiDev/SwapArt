class SwapsController < ApplicationController

  load_and_authorize_resource

  before_filter :set_current_user

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
    respond_to do |format|
      format.html {
        save_swap or render 'new'
      }
      format.js {
        @swap.save
      }
    end
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
    @swaps = @swaps.to_a.becomes(Swap::AsUser) if @swaps && @swaps.class.name == 'ActiveRecord::Relation'
    @swaps ||= swap_scope.to_a
  end

  def load_swap
    @swap = @swap.becomes(Swap::AsUser) if @swap
    @swap ||= swap_scope.find(params[:id])
  end

  def build_swap
    @swap = @swap.becomes(Swap::AsUser) if @swap
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
    swap_params ? swap_params.permit(:swapper_id, :swappee_id, :clicked_item_id, :user1_items, :user2_items) : {}
  end

  def swap_scope
    Swap::AsUser.all
  end
end
