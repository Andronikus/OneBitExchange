class ExchangesController < ApplicationController
  
   @@value = 0

  def index
  end

  def convert
    if params[:isToGetNewExchange].to_s == "true"
       @@value = ExchangeService.new(params[:source_currency], params[:target_currency]).perform
    end
    
    render json: {"value": (@@value*params[:amount].to_f).round(4)}
  end
end