class CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :only_allow_teachers, only: [:new, :create, :edit, :update, :destroy]
  def index
   @courses=Course.all 
  end
  def show
   @course=Course.find(params[:id])
  end
  def new
    @course=Course.new
  end
  def create

    @course=Course.new(course_params)
    @course.user_id=current_user.id
    if @course.save
     redirect_to @course
      else
       render 'new'
    end

           
  end          
  def edit
    @course=Course.find(params[:id])
  end
  def update
    @course=Course.find(params[:id])
    if @course.update(course_params)
      redirect_to @course
      else
      render 'edit'
    end
  end

  def destroy
   @course=Course.find(params[:id])
   @course.destroy
   redirect_to courses_path
  end
  private

  def only_allow_teachers
    unless current_user.teacher? 
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to courses_path
    end
  end
  private
  def course_params
    params.require(:course).permit(:title,:description)
  end
  
end

