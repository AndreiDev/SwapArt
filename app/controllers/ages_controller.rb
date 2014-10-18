class AgesController < ApplicationController

  load_and_authorize_resource

  def index
    load_ages
  end

  def show
    load_age
  end

  def new
    build_age
  end

  def create
    build_age
    save_age or render 'new'
  end

  def edit
    load_age
    build_age
  end

  def update
    load_age
    build_age
    save_age or render 'edit'
  end

  def destroy
    load_age
    @age.destroy
    redirect_to ages_path
  end

  private

    def load_ages
      @ages ||= age_scope.to_a
    end

    def load_age
      @age ||= age_scope.find(params[:id])
    end

    def build_age
      @age ||= age_scope.build
      @age.attributes = age_params
    end

    def save_age
      if @age.save
        redirect_to @age
      end
    end

    def age_params
      age_params = params[:age]
      age_params ? age_params.permit(:description) : {}
    end

    def age_scope
      Age.all
    end

end
