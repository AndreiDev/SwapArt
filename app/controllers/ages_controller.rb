class AgesController < ApplicationController
  before_action :set_age, only: [:show, :edit, :update, :destroy]

  # GET /ages
  # GET /ages.json
  def index
    @ages = Age.all
  end

  # GET /ages/1
  # GET /ages/1.json
  def show
  end

  # GET /ages/new
  def new
    @age = Age.new
  end

  # GET /ages/1/edit
  def edit
  end

  # POST /ages
  # POST /ages.json
  def create
    @age = Age.new(age_params)

    respond_to do |format|
      if @age.save
        format.html { redirect_to @age, notice: 'Age was successfully created.' }
        format.json { render :show, status: :created, location: @age }
      else
        format.html { render :new }
        format.json { render json: @age.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ages/1
  # PATCH/PUT /ages/1.json
  def update
    respond_to do |format|
      if @age.update(age_params)
        format.html { redirect_to @age, notice: 'Age was successfully updated.' }
        format.json { render :show, status: :ok, location: @age }
      else
        format.html { render :edit }
        format.json { render json: @age.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ages/1
  # DELETE /ages/1.json
  def destroy
    @age.destroy
    respond_to do |format|
      format.html { redirect_to ages_url, notice: 'Age was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_age
      @age = Age.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def age_params
      params.require(:age).permit(:description)
    end
end
