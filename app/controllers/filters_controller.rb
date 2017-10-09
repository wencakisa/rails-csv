require 'csv'


class FiltersController < ApplicationController
  def create
    file = params[:file]

    lines = CSV.read file.path
    odd_lines = lines.select { |item| item[2].to_i.odd? }
    result = odd_lines.collect { |item| item[1] }.map(&:to_f).reduce(&:+)

    render plain: '%.2f' % result
  end
end
