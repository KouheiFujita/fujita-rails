class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]

  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.all
    # @reports = Array.new
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
    @comment = Comment.new
    # if @comment.present?
    #   @comment = Comment.all
    # end
    @users = User.all
  end

  # GET /reports/new
  def new
    @report = Report.new
    @users = User.all
  end

  # GET /reports/1/edit
  def edit
    @users = User.all
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = Report.new(report_params)

    respond_to do |format|
      if @report.save
        format.html { redirect_to @report, notice: 'Report was successfully created.' }
        format.json { render :show, status: :created, location: @report }
      else
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to @report, notice: 'Report was successfully updated.' }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_find_url, notice: 'Report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  #一覧検索
  def find
  # 	@reports = Array.new
    @users = User.all
    @reports = Report.all.order(created_at: :desc).page(params[:page]).per(10)
  	if request.post? then
      @reports = Report.find_date_1(params[:date_1]).find_date_2(params[:date_2]).find_name(params[:name]).order(created_at: :desc).page(params[:page]).per(10)
  	end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit(:entry_date, :user_id, :report)
    end
end
