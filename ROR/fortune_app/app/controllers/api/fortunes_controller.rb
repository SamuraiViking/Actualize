class Api::FortunesController < ApplicationController
  def the_fortune
    fortunes = ['you will have a good day','you will have a bad day','you will have a horrible day']
    @fortunes = fortunes.sample
    render 'my_fortune.json.jb'
  end

  def lottery_numbers
    @winning_numbers = []
    6.times { @winning_numbers << rand(1..60) }
    render 'my_lottery.json.jb'
  end

  def visit_count
    render 'count.json.jb'
  end
end
