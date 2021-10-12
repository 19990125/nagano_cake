class Public::CustomersController < ApplicationController

  def show
    @customer= Customer.find(params[:id])
  end

  def edit
    @customer= Customer.find(params[:id])
  end

  def update
    @customers = Customer.all
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to public_customer_path(@customer.id)
  end

  def unsubscribe
  end

  def withdraw
  end
end
