class ExpensesController < ApplicationController
  before_action :set_category, only: %i[new create edit update destroy]
  before_action :set_expense, only: %i[show edit update destroy]
  
  def index
    @expenses = Expense.all
  end

  def show
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.category_id = @category.id
    @expense.user_id = current_user.id

    respond_to do |f|
      if @expense.save
        f.html { redirect_to @category, notice: 'Expense was successfully created.' }
        f.json { render :show, status: :created, location: @expense }
      else
        f.html { render :new, status: :unprocessable_entity }
        f.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |f|
      if @expense.update(expense_params)
        f.html { redirect_to @category, notice: 'Expense was successfully updated.' }
        f.json { render :show, status: :ok, location: @expense }
      else
        f.html { render :edit, status: :unprocessable_entity }
        f.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
  end

  def destroy
    @expense.destroy

    respond_to do |f|
      f.html { redirect_to expenses_url, notice: 'Expense was successfully destroyed.' }
      f.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_expense
    @expense = Expense.find(params[:id])
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

  # Only allow a list of trusted parameters through.
  def expense_params
    params.require(:expense).permit(:name, :amount).merge(user_id: current_user.id)
  end

end
