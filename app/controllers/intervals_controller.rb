require 'csv'

class IntervalsController < ApplicationController
  def create
    sums = Array.new
    CSV.read(params[:file].path).each_cons(30) do |chunk|
      sums.push chunk.collect(&:first).map(&:to_f).reduce(&:+)
    end

    render plain: '%.2f' % sums.max
  end
end
