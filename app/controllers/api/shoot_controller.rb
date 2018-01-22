module Api
  class ShootController < ChallengerApiController
    def create
      @server_choice = ["paper", "rock", "scissors"].sample
      @game = Game.find_or_initialize_by(id: params[:game_id])
      if @game.result
        return head(:conflict)
      end
      @game.update(result: game_result)

      render json: @game.result
    end

    def game_result
      { server_choice: @server_choice,
        your_choice: shoot_params[:choice],
        result: Game.result(server_choice: @server_choice, your_choice: shoot_params[:choice]) }
    end

    def shoot_params
      params.require(:shoot).permit(:game_id, :challenger_id, :choice)
    end
  end
end
