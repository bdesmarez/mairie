class CityHallsController < ApplicationController
  before_action :set_city_hall, only: [:show, :edit, :update, :destroy]

  # GET /city_halls
  # GET /city_halls.json
  def index
    @city_halls = CityHall.all
  end

  # GET /city_halls/1
  # GET /city_halls/1.json
  def show
  end

  # GET /city_halls/new
  def new
    @city_hall = CityHall.new
  end

  # GET /city_halls/1/edit
  def edit
  end

  # POST /city_halls
  # POST /city_halls.json
  def create
    @city_hall = CityHall.new(city_hall_params)

    respond_to do |format|
      if @city_hall.save
        format.html { redirect_to @city_hall, notice: 'City hall was successfully created.' }
        format.json { render :show, status: :created, location: @city_hall }
      else
        format.html { render :new }
        format.json { render json: @city_hall.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /city_halls/1
  # PATCH/PUT /city_halls/1.json
  def update
    respond_to do |format|
      if @city_hall.update(city_hall_params)
        format.html { redirect_to @city_hall, notice: 'City hall was successfully updated.' }
        format.json { render :show, status: :ok, location: @city_hall }
      else
        format.html { render :edit }
        format.json { render json: @city_hall.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /city_halls/1
  # DELETE /city_halls/1.json
  def destroy
    @city_hall.destroy
    respond_to do |format|
      format.html { redirect_to city_halls_url, notice: 'City hall was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_city_hall
      @city_hall = CityHall.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def city_hall_params
      params.require(:city_hall).permit(:name, :city, :postalCode, :logo)
    end
end
