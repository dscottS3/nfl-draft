class PicksController < ApplicationController
  # GET /picks
  # GET /picks.json
  def index
    @picks = Pick.limit(3).order('created_at DESC')
    round = Round.find_by_number(@picks.first.round.number) if @picks.present?
    @round = round.current_round_pick if @picks.present?
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @picks }
    end
  end

  # GET /picks/1
  # GET /picks/1.json
  def show
    @pick = Pick.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pick }
    end
  end

  # GET /picks/new
  # GET /picks/new.json
  def new
    pick = Pick.last
    @pick = Pick.new
    @round = pick.present? ? Round.find_by_number(pick.round.number) : Round.new
    @current_round = @round.current_round_pick
    @pick.round_id = @current_round.id
    @pick.team_id = @round.current_round_pick.team_id
    
    
    

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pick }
    end
  end

  # GET /picks/1/edit
  def edit
    @pick = Pick.find(params[:id])
  end

  # POST /picks
  # POST /picks.json
  def create
    @pick = Pick.new(params[:pick])

    respond_to do |format|
      if @pick.save
        format.html { redirect_to new_pick_path, notice: 'Pick was successfully created.' }
        format.json { render json: @pick, status: :created, location: @pick }
      else
        format.html { render action: "new" }
        format.json { render json: @pick.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /picks/1
  # PUT /picks/1.json
  def update
    @pick = Pick.find(params[:id])

    respond_to do |format|
      if @pick.update_attributes(params[:pick])
        format.html { redirect_to @pick, notice: 'Pick was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pick.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /picks/1
  # DELETE /picks/1.json
  def destroy
    @pick = Pick.find(params[:id])
    @pick.destroy

    respond_to do |format|
      format.html { redirect_to picks_url }
      format.json { head :no_content }
    end
  end
end
