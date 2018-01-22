class Game < ApplicationRecord
  belongs_to :challenger, optional: true

  def self.result(server_choice:, your_choice:)
    if your_choice == 'scissors' && server_choice == 'paper'
      'you_won!'
    elsif your_choice == 'rock' && server_choice == 'scissors'
      'you_won!'
    elsif your_choice == 'paper' && server_choice == 'rock'
      'you_won!'
    elsif your_choice == server_choice
      'draw!'
    else
      'you lost!'
    end
  end
end
