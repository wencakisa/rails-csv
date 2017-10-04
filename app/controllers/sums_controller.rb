require 'csv'


class SumsController < ApplicationController
  def create
    csv_file = params[:csv_file]
    row_num = params[:row_num].to_i

    lines = CSV.read(csv_file.path)
    result = lines.collect { |row| row[row_num - 1] }.map(&:to_f).reduce(&:+)

    render plain: result
  end
end
