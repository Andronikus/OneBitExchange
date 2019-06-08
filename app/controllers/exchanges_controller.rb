class ExchangesController < ApplicationController
  def index
  end

  def convert
    value = ExchangeService.new(params[:source_currency], params[:target_currency],params[:amount].to_f).perform
    
    render json: {"value": value.round(4)}
  end
end