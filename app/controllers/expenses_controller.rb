class ExpensesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_expense, only: %i[show edit update destroy]

  # GET /expenses or /expenses.json
  def index
    # group = Group.find(params[:group_id])
    group = current_user.groups.find(params[:group_id])
    expense = @group.expenses
  end

  # GET /expenses/1 or /expenses/1.json
  def show; end

  # GET /expenses/new
  def new
    @groups = current_user.groups.all
    @expense = Expense.new
  end

  # GET /expenses/1/edit
  def edit; end

  # POST /expenses or /expenses.json
  def create
    expense = Expense.create(name: params[:expense][:name], amount: params[:expense][:amount], user: current_user)
    @expense = GroupExpense.new(expense:, group:)

    respond_to do |format|
      if @expense.save
        format.html { redirect_to expense_expense_url(params[:group_id]), notice: 'Expense was successfully created.' }
        format.json { render :show, status: :created, location: @expense }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expenses/1 or /expenses/1.json
  def update
    respond_to do |format|
      if @expense.update(expense_params)
        format.html { redirect_to expense_url(@expense), notice: 'Expense was successfully updated.' }
        format.json { render :show, status: :ok, location: @expense }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses/1 or /expenses/1.json
  def destroy
    @expense.destroy

    respond_to do |format|
      format.html { redirect_to expenses_url, notice: 'Expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_author
    @author = current_user
  end
  
  # Use callbacks to share common setup or constraints between actions.
  def group_params
    params.require(:expense).permit(:id)
  end

  # Only allow a list of trusted parameters through.
  def expense_params
    params.require(:expense).permit(:name, :amount, :decimal, :author_id)
  end
end
