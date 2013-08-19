class ThredsController < ApplicationController
  before_action :set_thred, only: [:show, :edit, :update, :destroy]

  # GET /threds
  # GET /threds.json
  def index
    @threds = Thred.all
  end

  # GET /threds/1
  # GET /threds/1.json
  def show
  end

  # GET /threds/new
  def new
    @thred = Thred.new
  end

  # GET /threds/1/edit
  def edit
  end

  # POST /threds
  # POST /threds.json
  def create
    @thred = Thred.new(thred_params)

    respond_to do |format|
      if @thred.save
        format.html { redirect_to @thred, notice: 'Thred was successfully created.' }
        format.json { render action: 'show', status: :created, location: @thred }
      else
        format.html { render action: 'new' }
        format.json { render json: @thred.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /threds/1
  # PATCH/PUT /threds/1.json
  def update
    respond_to do |format|
      if @thred.update(thred_params)
        format.html { redirect_to @thred, notice: 'Thred was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @thred.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /threds/1
  # DELETE /threds/1.json
  def destroy
    @thred.destroy
    respond_to do |format|
      format.html { redirect_to threds_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_thred
      @thred = Thred.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def thred_params
      params[:thred]
    end
end
