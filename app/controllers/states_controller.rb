class StatesController < ApplicationController

  load_and_authorize_resource

  def index
    load_states
  end

  def show
    load_state
  end

  def new
    build_state
  end

  def create
    build_state
    save_state or render 'new'
  end

  def edit
    load_state
    build_state
  end

  def update
    load_state
    build_state
    save_state or render 'edit'
  end

  def destroy
    load_state
    @state.destroy
    redirect_to states_path
  end

  private

  def load_states
    @states ||= state_scope.to_a
  end

  def load_state
    @state ||= state_scope.find(params[:id])
  end

  def build_state
    @state ||= state_scope.build
    @state.attributes = state_params
  end

  def save_state
    if @state.save
      redirect_to @state
    end
  end

  def state_params
    state_params = params[:state]
    state_params ? state_params.permit(:description) : {}
  end

  def state_scope
    State.all
  end

end