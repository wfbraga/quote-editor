# frozen_string_literal: true

# app/controller/quotes_controller
class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :edit, :update, :destroy]

  def index
    @quotes = Quote.ordered
  end

  def show; end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(quotes_params)

    if @quote.save
      respond_to do |format|
        format.html { redirect_to quotes_path, notice: "Quote was successfully created." }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @quote.update(quotes_params)
      redirect_to quotes_path, notice: 'Quotes was successfully updates.'
    else
      render :edit, status: :umprocessable_entity
    end
  end

  def destroy
    @quote.destroy
    respond_to do |format|
      format.html { redirect_to quotes_path, notice: 'Quote was successfully deleted.' }
      format.turbo_stream
    end
  end

  private

  def set_quote
    @quote = Quote.find(params[:id])
  end

  def quotes_params
    params.require(:quote).permit(:name)
  end
end
