require 'csv'
require 'linear-regression/linear'

class LinRegressionsController < ApplicationController
  def create
    file = params[:file]

    lines = CSV.read file.path

    y_values = lines.collect(&:first).map(&:to_f)
    x_values = (1..y_values.length).to_a

    linear_regression = Regression::Linear.new x_values, y_values
    slope = linear_regression.slope
    intercept = linear_regression.intercept

    slope_formatted = '%.6f' % slope
    intercept_formatted = '%.6f' % intercept

    render plain: "#{slope_formatted},#{intercept_formatted}"
  end
end
