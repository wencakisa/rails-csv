require 'csv'

class SumsController < ApplicationController
  def create
    result = CSV.read(params[:file].path).map(&:first).map(&:to_f).reduce(&:+)

    render plain: '%.2f' % result
  end
end
