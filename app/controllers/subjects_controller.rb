class SubjectsController < ApplicationController
  before_action :set_subject, only: %i[edit update destroy]

  def index
    @subjects = Subject.all
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)

    if @subject.save
      redirect_to subject_path(@subject)
    else
      render :new, status: :unprocesable_entity
    end
  end

  def edit
  end

  def update
    if @subject.update(subject_params)
      redirect_to subject_path(@subject)
    else
      render :edit, status: :unprocesable_entity
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
