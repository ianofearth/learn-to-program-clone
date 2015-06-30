class LessonsController < ApplicationController
  def new
    @subject = Subject.find(params[:subject_id])
    @lesson = @subject.lessons.new
  end

  def show
    @subject = Subject.find(params[:subject_id])
    @lesson = Lesson.find(params[:id])
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

  def edit
    @subject = Subject.find(params[:subject_id])
    @lesson = Lesson.find(params[:id])
  end

  def update
    @subject = Subject.find(params[:subject_id])
    @lesson = Lesson.find(params[:id])
    if @lesson.update(lesson_params)
      flash[:notice] = @lesson.title + " has been updated!"
      redirect_to subject_lesson_path(@subject, @lesson)
    else
      render :edit
    end
  end

  def destroy
    @subject = Subject.find(params[:subject_id])
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    flash[:notice] = @lesson.title + " has be utterly destroyed! HAHAHAHAHAHA!"
    redirect_to subject_path(@subject)
  end


private
  def lesson_params
    params.require(:lesson).permit(:title, :content)
  end
end
