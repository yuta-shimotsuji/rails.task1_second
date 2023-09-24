class SchedulesController < ApplicationController

 def index
    @today_display = Date.today
    @schedules = Schedule.all
 end

 def show
    @schedule = Schedule.find_by(params[:id])
 end

 def new
    @schedule = Schedule.new
 end

 def create
    @schedule = Schedule.new(params.require(:schedule).permit(:title, :start_day, :last_day, :all_day, :memo))
    if @schedule.save
      flash[:notice] = "スケジュールを作成しました"
      redirect_to :schedules
    else
      flash[:notice] = "スケジュールの作成に失敗しました"
      render "new"
    end

 end

 def edit
    @schedule = Schedule.find_by(params[:id])
 end

 def update
    @schedule = Schedule.find_by(params[:id])
    if @schedule.update(params.require(:schedule).permit(:title, :start_day, :last_day, :all_day, :memo))
        flash[:notice] = "スケジュールを編集しました"
        redirect_to :schedules
    else
        flash[:notice] = "スケジュールの編集に失敗しました"
        render "new"
    end
 end

 def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to :schedules
 end


end
