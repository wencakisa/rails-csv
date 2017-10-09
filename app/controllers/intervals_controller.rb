require 'csv'


class IntervalsController < ApplicationController
  def create
    file = params[:file]

    lines = CSV.read(file.path)
    cons_data = lines.each_cons(30).to_a

    sums = Array.new
    cons_data.each do |chunk|
      chunk_sum = chunk.collect(&:first).map(&:to_f).reduce(&:+)
      sums.push chunk_sum
    end

    render plain: '%.2f' % sums.max
  end
end
