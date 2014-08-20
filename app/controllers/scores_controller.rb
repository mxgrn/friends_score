class ScoresController < ApplicationController
  before_action :set_user
  before_action :set_score, only: [:show, :edit, :update, :destroy]

  # GET /scores
  # GET /scores.json
  def index
    @scores = @user.scores
  end

  # GET /scores/1
  # GET /scores/1.json
  def show
  end

  # GET /scores/new
  def new
    @score = @user.scores.new
  end

  # GET /scores/1/edit
  def edit
  end

  # POST /scores
  # POST /scores.json
  def create
    @score = @user.scores.new(score_params)

    respond_to do |format|
      if @score.save
        mail_new_record if @score.new_best?
        format.html { redirect_to user_scores_path(@user), notice: 'Score was successfully created.' }
        format.json { render :show, status: :created, location: @score }
      else
        format.html { render :new }
        format.json { render json: @score.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scores/1
  # PATCH/PUT /scores/1.json
  def update
    respond_to do |format|
      if @score.update(score_params)
        format.html { redirect_to user_scores_path(@user), notice: 'Score was successfully updated.' }
        format.json { render :show, status: :ok, location: @score }
      else
        format.html { render :edit }
        format.json { render json: @score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scores/1
  # DELETE /scores/1.json
  def destroy
    @score.destroy
    respond_to do |format|
      format.html { redirect_to user_scores_path(@user), notice: 'Score was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def mail_new_record
      Notifications.new_record(@score).deliver
    end

    def set_user
      if params[:user_id].nil?
        @user = current_user
        return
      end

      @user = if current_user.role == :admin
        User.find(params[:user_id])
      else
        current_user
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_score
      @score = Score.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def score_params
      params.require(:score).permit(:value, :game_level_id, :user_id, :ascending)
    end
end
