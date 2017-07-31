class ReportsController < ApplicationController

  def index
    @reports = Report.all.order(created_at: :desc)
  end

  def new
    @report = Report.new
  end

  def create
    movie = params[:curr_movie]
    review = params[:curr_review]
    @report = Report.create(review_id: review, user_id: current_user.id)
    if @report.save
      respond_to do |format|
        format.js
        format.html { redirect_to movie_path(movie), notice: 'Report submitted.' }
      end
    else
      respond_to do |format|
        format.js
        format.html { redirect_to movie_path(movie), notice: 'Report already submitted.' }
      end
    end
  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy
    redirect_to reviews_all_path
  end
end
