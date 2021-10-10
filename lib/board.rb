#!/bin/env ruby
# rubocop: disable Metrics/CyclomaticComplexity
# rubocop: disable Metrics/PerceivedComplexity, Metrics/AbcSize
require_relative '../lib/player'
class Board
  attr_reader :game_board, :numbers_taken

  def initialize
    @game_board = [
      %w[01 02 03 04 05],
      %w[06 07 08 09 10],
      %w[11 12 13 14 15],
      %w[16 17 18 19 20],
      %w[21 22 23 24 25],
      %w[26 27 28 29 30],
      %w[31 32 33 34 35],
      %w[35 37 38 39 40],
      %w[41 42 43 44 45],
      %w[46 47 48 49]
    ]
    @numbers_taken = []
  end

  def mark_board(player)
    @game_board[0][player.next_move - 1] = player.token if player.next_move.between?(1, 5)
    @game_board[1][player.next_move - 6] = player.token if player.next_move.between?(6, 10)
    @game_board[2][player.next_move - 11] = player.token if player.next_move.between?(11, 15)
    @game_board[3][player.next_move - 16] = player.token if player.next_move.between?(16, 20)
    @game_board[4][player.next_move - 21] = player.token if player.next_move.between?(21, 25)
    @game_board[5][player.next_move - 26] = player.token if player.next_move.between?(26, 30)
    @game_board[6][player.next_move - 31] = player.token if player.next_move.between?(31, 35)
    @game_board[7][player.next_move - 36] = player.token if player.next_move.between?(36, 40)
    @game_board[8][player.next_move - 41] = player.token if player.next_move.between?(41, 45)
    @game_board[9][player.next_move - 46] = player.token if player.next_move.between?(46, 49)
    @numbers_taken << player.next_move
  end

  def marked?(player)
    @numbers_taken.include?(player.next_move)
  end
end
# rubocop: enable Metrics/CyclomaticComplexity
# rubocop: enable Metrics/PerceivedComplexity, Metrics/AbcSize
