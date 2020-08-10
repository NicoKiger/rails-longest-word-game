require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = Array.new(9) { ('A'..'Z').to_a.sample }
  end

  def score
    @word = params[:word]

    response = open("https://wagon-dictionary.herokuapp.com/#{@word}")
    json = JSON.parse(response.read)
    @result = json['found']

    @letters = params[:letters]
    @word.chars.all? do |letter|
      @word.count(letter) <= @letters.to_s.count(letter)
    end
  end
end
