require 'csv'
require 'linear-regression/linear'

class LinRegressionsController < ApplicationController
  def create
    y_values = CSV.read(params[:file].path).collect(&:first).map(&:to_f)
    x_values = (1..y_values.length).to_a
    reg = Regression::Linear.new x_values, y_values

    render plain: '%.6f,%.6f' % [reg.slope, reg.intercept]
  end
end
