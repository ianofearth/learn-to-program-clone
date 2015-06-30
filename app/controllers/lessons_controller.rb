class LessonsController < ApplicationController
  def new
    @subject = Subject.find(params[:subject_id])
    @lesson = @subject.lessons.new
  end

  def create
    @subject = Subject.find(params[:subject_id])
    @lesson = @subject.lessons.new(lesson_params)
    if @lesson.save
      flash[:notice] = "New lesson added to " + @subject.title + "!"
      redirect_to subject_path(@lesson.subject)
    else
      render :new
    end
  end

private
  def lesson_params
    params.require(:lesson).permit(:title, :content)
  end
end
