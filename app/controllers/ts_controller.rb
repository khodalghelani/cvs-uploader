class TsController < ApplicationController
  before_action :set_t, only: [:show, :edit, :update, :destroy]

  # GET /ts
  # GET /ts.json
  def index
    @ts = T.all
  end

  # GET /ts/1
  # GET /ts/1.json
  def show
  end

  # GET /ts/new
  def new
    @t = T.new
  end

  # GET /ts/1/edit
  def edit
  end

  # POST /ts
  # POST /ts.json
  def create
    @t = T.new(t_params)

    respond_to do |format|
      if @t.save
        format.html { redirect_to @t, notice: 'T was successfully created.' }
        format.json { render :show, status: :created, location: @t }
      else
        format.html { render :new }
        format.json { render json: @t.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ts/1
  # PATCH/PUT /ts/1.json
  def update
    respond_to do |format|
      if @t.update(t_params)
        format.html { redirect_to @t, notice: 'T was successfully updated.' }
        format.json { render :show, status: :ok, location: @t }
      else
        format.html { render :edit }
        format.json { render json: @t.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ts/1
  # DELETE /ts/1.json
  def destroy
    @t.destroy
    respond_to do |format|
      format.html { redirect_to ts_url, notice: 'T was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
    
    
    def import
        T.import(params[:file])
        redirect_to ts_path, notice: 'Excel sheet added successfully..!!'
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_t
      @t = T.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def t_params
      params.require(:t).permit(:title, :description, :author, :tags)
    end
end
