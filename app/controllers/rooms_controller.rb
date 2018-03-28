class RoomsController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource :only => [:show, :index]
  before_action :set_room, only: [:show, :edit, :update, :destroy]
  before_action :set_paper_trail_whodunnit

  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.all
    @pesquisa = params[:pesquisa]

    if @pesquisa.present?
      where_target = '%' << params[:pesquisa] << '%'
      @rooms = @rooms.where('rooms.number ILIKE ? OR
        rooms.floor ILIKE ?', where_target, where_target)
    end

    @rooms = @rooms.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        format.html {redirect_to @room, notice: 'Room was successfully created.'}
        format.json {render :show, status: :created, location: @room}
      else
        format.html {render :new}
        format.json {render json: @room.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html {redirect_to @room, notice: 'Room was successfully updated.'}
        format.json {render :show, status: :ok, location: @room}
      else
        format.html {render :edit}
        format.json {render json: @room.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html {redirect_to rooms_url, notice: 'Room was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_room
    @room = Room.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def room_params
    params.require(:room).permit(:number, :floor)
  end
end
