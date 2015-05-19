class CoursesController < ApplicationController
  before_filter :authenticate_lecturer!
  # GET /courses
  # GET /courses.json
  def index
    lecturer = Lecturer.find_by_id(params[:lecturer_id])
    @courses = lecturer.courses
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    lecturer = Lecturer.find_by_id(params[:lecturer_id])
    @course = lecturer.courses.find(params[:id])
  end

  # GET /courses/new
  def new
    lecturer = Lecturer.find_by_id(params[:lecturer_id])
    @course = lecturer.courses.build
  end

  # GET /courses/1/edit
  def edit
    lecturer = Lecturer.find_by_id(params[:lecturer_id])
    @course = lecturer.courses.find(params[:id])
  end

  # POST /courses
  # POST /courses.json
  def create
    lecturer = Lecturer.find_by_id(params[:lecturer_id])
    @course = lecturer.courses.create(course_params)
    @course.lecturer_id = current_lecturer.id
    respond_to do |format|
      if @course.save
        format.html { redirect_to lecturer_courses_url, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      lecturer = Lecturer.find_by_id(params[:lecturer_id])
      @course = lecturer.courses.find(params[:id])
      if @course.update(course_params)
        format.html { redirect_to lecturer_course_url, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    lecturer = Lecturer.find_by_id(params[:lecturer_id])
    @course = lecturer.courses.find(params[:id])
    @course.destroy
    respond_to do |format|
      format.html { redirect_to lecturer_courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def course_params
      params.require(:course).permit(:name_course, :code_course, :sks, :program_study, :semester, :prerequisite, :description, :lecturer_id)
    end
end
