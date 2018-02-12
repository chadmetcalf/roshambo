module Api
  class GameStateController < GamesController
    before_action :set_game, only: [:create]
    before_action :validate_state, only: [:create]

    # POST /games.json
    def create
      @game.challenger ||= current_challenger
      if params.key?(:choice)
        @game.challenger_choice = params.fetch(:choice)
      end

      if @game.send state_method
        render json: @game, status: :ok
      else
        render json: games_errors, status: :unprocessable_entity
      end
    end

    private

    def validate_state
      # return if Game.state? params.fetch(:game_state, '').to_sym
      # render_unprocessable_game_status
    end

    def state_method
      (params.fetch(:game_state,'') + '!').to_sym
    end

    def game_params
      params.require(:game_state)
      params.require(:choice) if params[:game_state] == 'shoot'
    end

    def games_errors
      {
        error: "Game cannot transition from '#{@game.state}' to '#{params[:game_state]}'"
      }
    end
  end
end
