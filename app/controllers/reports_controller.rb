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
      format.html { redirect_to reports_url, notice: 'Report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  #一覧検索
  def find
  	@reports = Array.new
  	if request.post? then
  	 # @date_1 = Report.where "entry_date >= ? ", params[:date_1]
  	 # @date_2 = Report.where "entry_date <= ? ", params[:date_2] 
  	 # @name = Report.where user_id: params[:name]
  	 # params[:date_1] != nil ? params[:date_1] : ""
  	 # params[:date_2] != nil ? params[:date_2] : ""
  	 # params[:name] != nil ? params[:name] : ""
  	 
  	 # a = nil
  	 # b = "2017-08-14"
  	 # c = nil
  	 
    #   if a == nil then
    #     a = "0000-00-00"
    #   end
    #   if b == nil then
    #     b = "9999-12-31"
    #   end
    #   if c == nil then
    #   end
      
     # a != nil ? a : ""
  	 # b != nil ? b : ""
  	 # c != nil ? c : ""
  	 
  	 # c !=nil ? and | or
  	  
  	 # @reports = Report.where("(entry_date >= ?) and (entry_date <= ?) and (user_id == ?)", a, b, c)
  	  
  	 # @reports = Report.where("entry_date >= ?", params[:date_1]).where("entry_date <= ?", params[:date_2])
  	 # if params[:name] != ""
  	 #   @reports.joins(Report.where("user_id == ?", params[:name]))
  	 # end  	  
    #   if params[:date_1] != ""
    # 	  @reports = Report.where("entry_date >= ?", params[:date_1])
    # 	end
    # 	if params[:date_2] != ""
    # 	  @reports = Report.where("entry_date <= ?", params[:date_2])
    # 	end
    # 	if params[:name] != ""
    # 	  @reports = Report.where("user_id == ?", params[:name])
    # 	end
    
     
      # def self.find_date_1
      #   where("entry_date >= ?", params[:date_1]) if params[:date_1].present?
      # end
      # def self.find_date_2
      #   where("entry_date <= ?", params[:date_2]) if params[:date_2].present?
      # end
      # def self.find_name
      #   where("user_id == ?", params[:name]) if params[:name].present?
      # end
      @reports = Report.find_date_1(params[:date_1]).find_date_2(params[:date_2]).find_name(params[:name])
      
      # if params[:date_1].present? 
      #   @reports = Report.find_date_1 params[:date_1]
      # end
      # if params[:date_2].present?
      #   @reports = Report.find_date_2 params[:date_2]
      # end
      # if params[:name].present?
      #   @reports = Report.find_name params[:name]
      # end
    	
  	end
  	
  end
  
  # def find_date
  #   @reports = Array.new
  #   if request.post? then
  #   f = params[:find].split(",")
  #     @reports = Report.where "entry_date >= ? and entry_date <= ?", f[0], f[1]
  #   end
  #   render :find
  # end
  
  # def find_name
  #   @reports = Array.new
  #   if request.post? then
  #   # @reports = Report.where user_id: params[:find] OK
    
    
  #   # @reports = Report.where "user_id like ?", '%' + params[:find] + '%'
    
  #     users = User.where "name like ?", '%' + params[:find] + '%'
  #     users.each do |user|
  #       @reports = user.report.
  #     end
  #   end
    
  #   render :find
  # end
  

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
