require 'csv'
require 'linear-regression/linear'

class LinRegressionsController < ApplicationController
  def create
    y_values = CSV.read(params[:file].path).map(&:first).map(&:to_f)
    x_values = (1..y_values.size).to_a
    reg = Regression::Linear.new x_values, y_values

    render plain: '%.6f,%.6f' % [reg.slope, reg.intercept]
  end
end
