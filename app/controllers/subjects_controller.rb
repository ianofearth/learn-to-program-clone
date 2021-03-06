class SubjectsController < ApplicationController
  def index
    @subjects = Subject.order(:number)
  end

  def show
    @subject = Subject.find(params[:id])
    @lessons = @subject.lessons.order(:number)
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      flash[:notice] = "Subject successfully added!"
      redirect_to subjects_path
    else
      render :new
    end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    @subject = Subject.find(params[:id])
    if @subject.update(subject_params)
      flash[:notice] = "Subject successfully updated!"
      redirect_to subjects_path
    else
      render :edit
    end
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    redirect_to subjects_path
  end

  private
  def subject_params
    params.require(:subject).permit(:title, :number)
  end

end
