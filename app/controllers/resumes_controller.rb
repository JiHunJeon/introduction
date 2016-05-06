class ResumesController < ApplicationController
  before_action :set_resume, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [ :index, :new, :edit, :create, :update, :destroy ]

  # GET /resumes
  # GET /resumes.json
  def index
    @resumes =  current_user.resumes.all.paginate(:page => params[:page], :per_page => 5)

  end

  # GET /resumes/1
  # GET /resumes/1.json
  def show
    @resume = current_user.resumes.find(params[:id])
  end


  # GET /resumes/new
  def new
    @resume = Resume.new
    @resume.skills.build
    @resume.work_histories.build
    @resume.educations.build
    @resume.projects.build
    @user = current_user
  end

  # GET /resumes/1/edit
  def edit
  end

  # POST /resumes
  # POST /resumes.json
  def create
    @resume = current_user.resumes.new(resume_params)

    respond_to do |format|
      if @resume.save
        format.html { redirect_to @resume, notice: 'Resume was successfully created.' }
        format.json { render :show, status: :created, location: @resume }
      else
        format.html { render :new }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resumes/1
  # PATCH/PUT /resumes/1.json
  def update
    respond_to do |format|
      if current_user.resumes.update(resume_params)
        format.html { redirect_to @resume, notice: 'Resume was successfully updated.' }
        format.json { render :show, status: :ok, location: @resume }
      else
        format.html { render :edit }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resumes/1
  # DELETE /resumes/1.json
  def destroy
    current_user.resumes.destroy
    respond_to do |format|
      format.html { redirect_to resumes_url, notice: 'Resume was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resume
      @resume = Resume.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resume_params
      params.require(:resume).permit(:summary,
                                     skills_attributes: [:name, :level],
                                     work_histories_attributes: [:name, :text, :started_at, :ended_at],
                                     educations_attributes: [:name, :text, :started_at, :ended_at],
      project_attributes: [:name, :text, :home_page])
    end
end
