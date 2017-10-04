require 'csv'


class CountController < ApplicationController
  def create
    csv_file = params[:csv_file]

    lines = CSV.read(csv_file.path)
    result = lines.select { |item| item[0].to_i.even? }.length

    render plain: result
  end
end
