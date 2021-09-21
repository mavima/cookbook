class DosesController < ApplicationController

  before_action :set_dose, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Dose.all
  end

  def show
  end

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_strong_params)
    @dose.save
  end

  def edit
    # @dose.amount.round(0) if @dose.amount % 1 == 0
  end

  def update
    @recipe = @dose.recipe
    if @dose.update(dose_strong_params)
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  def destroy
    @recipe = @dose.recipe
    @dose.destroy
    redirect_to recipes_path
  end

  private

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def dose_strong_params
    params.require(:dose).permit(:amount, :recipe_id :ingredient, :unit)

  end
end
