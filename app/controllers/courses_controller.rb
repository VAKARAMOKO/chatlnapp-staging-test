class CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :owned_course, only: [:edit, :update, :destroy]
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  #impressionist apres a 

  # GET /courses
  # GET /courses.json
  def index

   # @comment = @course.comments.order('created_at asc')
    @courses = Course.all.order("created_at Desc")
    @course = Course.new

  end

  # GET /courses/1
  # GET /courses/1.json
  def show
        
  end

  # GET /courses/new
  def new
    @course = current_user.course.build
  end

  # GET /courses/1/edit
  def edit
  end
  # remove avatar
  
  # POST /courses
  # POST /courses.json

  def create
    @course = current_user.course.build(course_params)  
      if @course.save
        flash[:success] = "Le cours a été bien ajouter"
        redirect_to root_path
      else
        flash[:alert] = "Votre nouveau cours n'a pas pu être crée !  Veuillez vérifier le formulaire."
        render :new        
      end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
      if @course.update(course_params)
        flash[:sucess] = "Cours mis à jour"
        redirect_to root_path
      else
        flash[:alert] = "Mise à jour échouée..."
        render :edit
      end   
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:title, :description, :corps, :level_course, :user_id)
    end

    def owned_course
      unless current_user == @courses.user
        flash[:alert] = "Cette action n'est pas possible!"
        redirect_to root_path
    end
end
end
