class ThredsController < ApplicationController
  before_action :set_thred, only: [:show, :edit, :update, :destroy]

  def index
    @threds = Thred.all
  end

  def show
    @posts = @thred.posts.entries
    @current = @posts.empty? ? Date.today : @posts.last.start
  end

  def new
    @thred = Thred.new
  end

  def edit
  end

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
