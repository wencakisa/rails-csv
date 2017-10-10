require 'csv'

class FiltersController < ApplicationController
  def create
    result = CSV.read(params[:file].path).select { |i| i[2].to_i.odd? }.map { |i| i[1].to_f }.reduce(&:+)

    render plain: '%.2f' % result
  end
end
