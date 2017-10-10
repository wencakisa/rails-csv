require 'csv'
require 'linear-regression/linear'

class LinRegressionsController < ApplicationController
  def create
    x_values, y_values = [], []
    CSV.foreach(params[:file].path).with_index(1) do |row, index|
      x_values.push index
      y_values.push row.first.to_f
    end

    reg = Regression::Linear.new x_values, y_values

    render plain: '%.6f,%.6f' % [reg.slope, reg.intercept]
  end
end
