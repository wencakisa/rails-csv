require 'csv'

class IntervalsController < ApplicationController
  def create
    sums = []
    CSV.foreach(params[:file].path).each_cons(30) do |chunk|
      sums << chunk.map(&:first).map(&:to_f).reduce(&:+)
    end

    render plain: '%.2f' % sums.max
  end
end
