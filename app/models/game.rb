class Game < ApplicationRecord
  include SimpleStates

  belongs_to :challenger, optional: true

  event :ro, if: :ro_able?, to: :ro
  event :sham,  if: :sham_able?, to: :sham
  event :bo, if: :bo_able?, to: :bo
  event :shoot, if: :shoot_able?, to: :shot, before: :build_result

  def result_string
    if challenger_choice == 'scissors' && server_choice == 'paper'
      'you_won!'
    elsif challenger_choice == 'rock' && server_choice == 'scissors'
      'you_won!'
    elsif challenger_choice == 'paper' && server_choice == 'rock'
      'you_won!'
    elsif challenger_choice == server_choice
      'draw!'
    else
      'you lost!'
    end
  end

  def challenger_choice
    @_challenger_choice ||= result.fetch(:challenger_choice)
  end

  def challenger_choice=(choice)
    self.result.merge!(challenger_choice: choice)
    @_challenger_choice = choice
  end

  def server_choice
    @_server_choice ||= result.fetch(:server_choice, %w(rock paper scissors).sample)
  end

  def build_result
    self.result = {
      challenger_choice: challenger_choice,
      server_choice: server_choice,
      result_string: result_string
    }
  end

  def self.initial_state
    :ready
  end

  def ro_able?
    state? :ready
  end

  def sham_able?
    state? :ro
  end

  def bo_able?
    state? :sham
  end

  def shoot_able?
    state? :bo
  end

  def complete?
    state == :shot
  end
end
