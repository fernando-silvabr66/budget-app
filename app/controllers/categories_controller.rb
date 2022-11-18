class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  
  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user_id = current_user.id

    respond_to do |f|
      if @category.save
        f.html { redirect_to category_url(@category), notice: 'Category was successfully created.' }
        f.json { render :show, status: :created, location: @category }
      else
        f.html { render :new, status: :unprocessable_entity }
        f.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |f|
      if @category.update(category_params)
        f.html { redirect_to category_url(@category), notice: 'Category was successfully updated.' }
        f.json { render :show, status: :ok, location: @category }
      else
        f.html { render :edit, status: :unprocessable_entity }
        f.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
  end

  def destroy
    @category.destroy

    respond_to do |f|
      f.html { redirect_to categorys_url, notice: 'Category was successfully destroyed.' }
      f.json { head :no_content }
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name, :icon)
  end

end
