#!/usr/bin/env ruby
require_relative '../lib/game.rb'
def create_players
    ticket =  Random.rand(0..1000000000000000)
     tokens = 'XX'
     puts %(Your Ticket Number:#{ticket})
     puts %(Player, please type your Ticket Number and your Name!)
       begin
         new_ticket = gets.chomp
         new_name = gets.chomp
         raise RuntimeError if Player.validate_name(new_name).eql?(false) || ticket.to_s != new_ticket
       rescue RuntimeError
         puts %(Invalid Ticket Number or Name,please, try again!)
         retry
       else
        new_player = Player.new(new_name, tokens, new_ticket)
       end
   new_player
 end
 
   def welcome(new_player)
     player = new_player
     puts %(Welcome #{player.name}! Your Ticket Number is:#{player.ticket} and your token is: #{player.token}) 
     player
   end
   
   def ask_move(player, board)
    puts %(#{player.name}, please select a number between 1 and 49. )
     begin
       new_move = gets.chomp.to_i
       raise RuntimeError unless new_move.between?(1, 49)
     rescue RuntimeError
       puts %(Wrong number, please choose one between 1 and 49.)
       retry
     else
       player.next_move = new_move
       if board.marked?(player)
         puts %(The number is already taken, choose a different number)
         ask_move(player, board)
       end
     end
   end
   
   def show_board(board)
     board.game_board.each do |row|
       row.each { |col| print %(|-#{col}-|) }
       puts %()
     end
   end
   
   def play(game)
       ask_move(game.players, game.board)
       game.board.mark_board(game.players)
       show_board(game.board)
       if game.board.numbers_taken.size == 6 && game.winner == game.board.numbers_taken
       puts %(Congratulations #{game.players.name} a player with Ticket Number:#{game.players.ticket}! 
       You won! Game is over! A new game starts in 10secs)
       sleep(10)
       game.board.numbers_taken.clear
     end
     if game.board.numbers_taken.size == 6 && game.winner != game.board.numbers_taken 
       puts %(Oh!#{game.players.name} a player with Ticket Number:#{game.players.ticket} lost the Game! 
       Your chosen numbers are:#{game.board.numbers_taken} 
       and our Lucky-numbers are:#{game.winner}. The Game is Over! A new game starts in 10secs)
       sleep(10)
      game.board.numbers_taken.clear
       end
     end
   
   Mark_Six_Game = Game.new(welcome(create_players))
   
 loop do
   play( Mark_Six_Game )
 end
 
 