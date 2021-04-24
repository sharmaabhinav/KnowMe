class Api::V1::FactsController < ApplicationController
  before_action :load_facts, only: [:index]


  def index
    render_200(@facts)
  end

  def show
    if @fact.present?
      render_200(@fact)
    else
      render_404("#{resource_name} was not found")
    end
  end

  def create
    if @fact.save
      render_200(@fact)
    else
      render_422(@fact.errors)
    end
  end
  
  def update
    if @fact.present?
      if @fact.update(fact_update_params)
        render_200(@fact)
      else
        render_422(@fact.errors)
      end
    else
      render_404("#{resource_name} was not found")
    end
  end
  

  def destroy
    if @fact.present?
      @fact.active = false
      @fact.save
    else
      render_404("#{resource_name} was not found")
    end
  end

  private

  def fact_create_params
    params.permit(:fact, :likes, :user_id)
  end

  def fact_update_params
    params.permit(:fact, :likes)
  end

  def load_facts
    @facts = @facts.active(params[:user_id])
  end
end
