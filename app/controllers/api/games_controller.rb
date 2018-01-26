module Api
  class GamesController < ChallengerApiController
    before_action :set_game, only: [:show, :edit, :update, :destroy]

    # GET /games.json
    def index
      @games = policy_scope(Game)

      render json: @games, status: :ok
    end

    # GET /games/1.json
    def show
      render json: @game, status: :ok
    end

    # GET /games/new
    def new
      @game = Game.new
    end

    # GET /games/1/edit
    def edit
    end

    # POST /games.json
    def create
      @game = Game.new(game_params)

      if @game.save
        render json: @game, status: :created
      else
        render json: @game.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /games/1.json
    def update
      if @game.update(game_params)
        render json: @game, status: :ok
      else
        render json: @game.errors, status: :unprocessable_entity
      end
    end

    # DELETE /games/1.json
    def destroy
      @game.destroy
      head :no_content
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_game
        @game = policy_scope(Game).find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def game_params
        params.permit(:game).merge(challenger_id: current_challenger.id)
          .permit(:challenger_id, :result, :state)
      end
  end
end
