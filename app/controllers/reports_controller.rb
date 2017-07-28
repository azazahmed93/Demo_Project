class ReportsController < ApplicationController

  def index
    @reports = Report.all.order(created_at: :desc)
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    if @report.save?
      format.html { redirect_to @movie, notice: 'Review was reported.' }
      format.json { render :show, status: :created, location: @movie }
    else
      format.html { render :new }
      format.json { render json: @report.errors, status: :unprocessable_entity }
    end
  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy
    redirect_to @movie
  end

  private

  def report_params
    params.require(:report).permit(:count)
  end

end
