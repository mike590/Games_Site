require 'bundler'
Bundler.require

Dir.glob('./{helpers,models,controllers}/*.rb').each do |file|
  require file
  puts "Required " + file
end

map('/tictactoe'){ run TictactoeController}
map('/hangman'){ run HangmanController}
map('/users'){run UsersController}
map('/sessions'){ run SessionsController}
map('/'){ run ApplicationController}
