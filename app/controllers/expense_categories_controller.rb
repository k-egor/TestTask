class ExpenseCategoriesController < ApplicationController
  before_action :set_expense_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /expense_categories
  # GET /expense_categories.json
  def index
    @expense_categories = ExpenseCategory.where(user_id: current_user.id)
    #ExpenseCategory.all
  end

  # GET /expense_categories/1
  # GET /expense_categories/1.json
  def show
    
  end

  # GET /expense_categories/new
  def new
    @expense_category = ExpenseCategory.new
    @expense_category.user_id = current_user.id
  end

  # GET /expense_categories/1/edit
  def edit
  end

  # POST /expense_categories
  # POST /expense_categories.json
  def create
    @expense_category = ExpenseCategory.new(expense_category_params)

    respond_to do |format|
      if @expense_category.save
        format.html { redirect_to @expense_category, notice: 'Expense category was successfully created.' }
        format.json { render :show, status: :created, location: @expense_category }
      else
        format.html { render :new }
        format.json { render json: @expense_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expense_categories/1
  # PATCH/PUT /expense_categories/1.json
  def update
    respond_to do |format|
      if @expense_category.update(expense_category_params)
        format.html { redirect_to @expense_category, notice: 'Expense category was successfully updated.' }
        format.json { render :show, status: :ok, location: @expense_category }
      else
        format.html { render :edit }
        format.json { render json: @expense_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expense_categories/1
  # DELETE /expense_categories/1.json
  def destroy
    @expense_category.destroy
    respond_to do |format|
      format.html { redirect_to expense_categories_url, notice: 'Expense category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense_category
      @expense_category = ExpenseCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expense_category_params
      params.require(:expense_category).permit(:user_id, :name)
    end
end
