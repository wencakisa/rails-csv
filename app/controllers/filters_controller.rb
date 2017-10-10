require 'csv'

class FiltersController < ApplicationController
  def create
    result = 0
    CSV.foreach(params[:file].path) do |row|
      result += row[1].to_f if row[2].to_i.odd?
    end

    render plain: '%.2f' % result.ceil(2)
  end
end
