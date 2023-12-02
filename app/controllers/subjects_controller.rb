class SubjectsController < ApplicationController
  before_action :set_subject, only: %i[show edit update destroy]

  def index
    @subjects = Subject.all
  end

  def show
    redirect_to subject_path(@subject)
  end

  def new
    @subject = Subject.new
  end

  def create
    @user = User.find(1)
    @subject = Subject.new(subject_params)
    @subject.user = current_user

    if @subject.save
      redirect_to subjects_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @subject.update(subject_params)
      redirect_to subject_path(@subject)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @subject.destroy
    redirect_to subjects_path, status: :see_other
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :grade_subject)
  end

  def set_subject
    @subject = Subject.find(params[:id])
  end
end
