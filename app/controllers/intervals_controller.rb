require 'csv'

class IntervalsController < ApplicationController
  def create
    sums = Array.new
    CSV.foreach(params[:file].path).each_cons(30) do |chunk|
      sums.push chunk.map(&:first).map(&:to_f).reduce(&:+)
    end

    render plain: '%.2f' % sums.max.ceil(2)
  end
end
