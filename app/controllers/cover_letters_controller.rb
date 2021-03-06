class CoverLettersController < ApplicationController
  before_action :set_cover_letter, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [ :index, :new, :edit, :create, :update, :destroy ]
  before_action :set_user
#  before_action :authenticate_profile, only: [ :index ]

  # GET /cover_letters
  # GET /cover_letters.json
  def index
    @cover_letters = current_user.cover_letters.all.order('id desc').paginate(:page => params[:page], :per_page => 5)
  end

  # GET /cover_letters/1
  # GET /cover_letters/1.json
  def show
  end

  # GET /cover_letters/new
  def new
    @cover_letter = CoverLetter.new
    @cover_letter.companies.build
  end

  # GET /cover_letters/1/edit
  def edit
    @cover_letter = current_user.cover_letters.find(params[:id])
    @cover_letter.companies.build if @cover_letter.companies.last().nil?
  end

  # POST /cover_letters
  # POST /cover_letters.json
  def create
    @cover_letter = current_user.cover_letters.new(cover_letter_params)

    respond_to do |format|
      if @cover_letter.save
        format.html { redirect_to @cover_letter, notice: 'Cover letter was successfully created.' }
        format.json { render :show, status: :created, location: @cover_letter }
      else
        format.html { render :new }
        format.json { render json: @cover_letter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cover_letters/1
  # PATCH/PUT /cover_letters/1.json
  def update
    @cover_letter = current_user.cover_letters.find(params[:id])
    respond_to do |format|
      if @cover_letter.update(cover_letter_params)
        format.html { redirect_to @cover_letter, notice: 'Cover letter was successfully updated.' }
        format.json { render :show, status: :ok, location: @cover_letter }
      else
        format.html { render :edit }
        format.json { render json: @cover_letter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cover_letters/1
  # DELETE /cover_letters/1.json
  def destroy
    @cover_letter = current_user.cover_letters.find(params[:id]).destroy
    #@cover_letter.destroy
    respond_to do |format|
      format.html { redirect_to cover_letters_url, notice: 'Cover letter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cover_letter
      @cover_letter = CoverLetter.find(params[:id])
    end

  def set_user
    @user = current_user
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cover_letter_params
      params.require(:cover_letter).permit(:text,
      companies_attributes:[:id,:name, :hiring_agent_name, :address1, :address2, :post_code,:department ])
    end
end
