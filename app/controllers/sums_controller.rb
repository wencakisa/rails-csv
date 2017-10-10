require 'csv'

class SumsController < ApplicationController
  def create
    result = 0
    CSV.foreach(params[:file].path) do |row|
      result += row.first.to_f
    end

    render plain: '%.2f' % result.ceil(2)
  end
end
