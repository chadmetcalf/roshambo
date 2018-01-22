module Api
  class ChallengerApiController < ActionController::Base
    include Knock::Authenticable

    before_action :authenticate_challenger
    before_action :skip_session

    # JWT: Knock defines it's own current_challenger method unless one is already
    # defined. As controller class is cached between requests, this method
    # stays and interferes with a browser-originated requests which rely on
    # Devise's implementation of current_challenger. As we define the method here,
    # Knock does not reimplement it anymore but we have to do its thing
    # manually.
    def current_challenger
      if token
        @_current_challenger ||= begin
          Knock::AuthToken.new(token: token).entity_for(Challenger)
        rescue
          nil
        end
      else
        super
      end
    end

    private

    def authenticate_challenger
      return unless token
      unauthorized_entity('challenger') unless current_challenger
    end

    # JWT: No need to try and load session as there is none in an API request
    def skip_session
      request.session_options[:skip] = true if token
    end
  end
end
