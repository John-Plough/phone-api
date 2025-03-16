class PhonesController < ApplicationController
  def index
    @phones = Phone.all
    render :index
  end

  def create
    @phone = Phone.create(
      name: params[:name],
      year: params[:year]
    )
    render :show
  end

  def show
    @phone = Phone.find_by(id: params[:id])
    render :show
  end

  def update
    @phone = Phone.find_by(id: params[:id])
    @phone.update(
      name: params[:name] || @phone.name,
      year: params[:year] || @phone.year
    )
    render :show
  end

  def destroy
    @phone = Phone.find_by(id: params[:id])
    @phone.destroy
    render json: { message: "Phone record destroyed" }
  end
end
