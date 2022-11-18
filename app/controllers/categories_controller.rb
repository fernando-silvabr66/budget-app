class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  # GET /categories or /categories.json
  def index
    @categories = Category.all
  end

  # GET /categories/1 or /categories/1.json
  def show; end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit; end

  # POST /categories or /categories.json
  def create
    @category = Category.new(category_params)
    @category.user_id = current_user.id
    respond_to do |f|
      if @category.save
        form.html { redirect_to category_url(@category), notice: 'Category was successfully created.' }
        form.json { render :show, status: :created, location: @category }
      else
        form.html { render :new, status: :unprocessable_entity }
        form.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    respond_to do |f|
      if @category.update(category_params)
        form.html { redirect_to category_url(@category), notice: 'Category was successfully updated.' }
        form.json { render :show, status: :ok, location: @category }
      else
        form.html { render :edit, status: :unprocessable_entity }
        form.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @category.destroy

    respond_to do |f|
      form.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      form.json { head :no_content }
    end
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
