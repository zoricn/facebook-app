class PeopleController < ApplicationController
  before_filter :find_person

  def edit
    respond_to do |format|
    	format.html { render :layout => false }
      format.js { render :layout => false }
    end
  end

  def update
    if @person.update_attributes(params[:person])
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.js
      end
    end
  end

  private

  def find_person
    @person = current_person
  end
end
