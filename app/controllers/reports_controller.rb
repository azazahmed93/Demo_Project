class ReportsController < ApplicationController

  def index
    @reports = Report.ordered.page(params[:page])
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(review_id: params[:curr_review_id], user: current_user)

    if @report.save
      respond_to do |format|
        format.js
        format.html { redirect_to movie_path(params[:curr_movie]), notice: 'Report submitted.' }
      end
    else
      respond_to do |format|
        format.js
        format.html { redirect_to movie_path(params[:curr_movie]), notice: 'Report already submitted.' }
      end
    end
  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy

    redirect_to reports_path
  end
end
