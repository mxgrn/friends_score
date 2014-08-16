class GameLevelsController < ApplicationController
  before_action :set_game_level, only: [:show, :edit, :update, :destroy]

  # GET /game_levels
  # GET /game_levels.json
  def index
    @game_levels = GameLevel.all
  end

  # GET /game_levels/1
  # GET /game_levels/1.json
  def show
  end

  # GET /game_levels/new
  def new
    @game_level = GameLevel.new
  end

  # GET /game_levels/1/edit
  def edit
  end

  # POST /game_levels
  # POST /game_levels.json
  def create
    @game_level = GameLevel.new(game_level_params)

    respond_to do |format|
      if @game_level.save
        format.html { redirect_to @game_level, notice: 'Game level was successfully created.' }
        format.json { render :show, status: :created, location: @game_level }
      else
        format.html { render :new }
        format.json { render json: @game_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_levels/1
  # PATCH/PUT /game_levels/1.json
  def update
    respond_to do |format|
      if @game_level.update(game_level_params)
        format.html { redirect_to @game_level, notice: 'Game level was successfully updated.' }
        format.json { render :show, status: :ok, location: @game_level }
      else
        format.html { render :edit }
        format.json { render json: @game_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_levels/1
  # DELETE /game_levels/1.json
  def destroy
    @game_level.destroy
    respond_to do |format|
      format.html { redirect_to game_levels_url, notice: 'Game level was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_level
      @game_level = GameLevel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_level_params
      params.require(:game_level).permit(:title, :game_id)
    end
end
