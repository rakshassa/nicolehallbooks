class CharactersController < ApplicationController
  before_action :set_character, only: [:show, :edit, :update, :destroy, :gear, :gear_slots, :stat_mods]

  def import_characters
    character_count = 0
    ActiveRecord::Base.logger.silence do
      character_count = CharacterImporter.new.process_import_characters
    end

    message = "Imported " + character_count.to_s + " characters."
    redirect_to characters_url, notice: message
  end

  def import_character_gear
    character_count = 0
    ActiveRecord::Base.logger.silence do
      character_count = CharacterGearImporter.new.process_import_character_gear
    end

    message = "Imported gear for " + character_count.to_s + " characters."
    redirect_to characters_url, notice: message
  end

  def import_character_stats
    character_count = 0
    ActiveRecord::Base.logger.silence do
      character_count = CharacterStatsImporter.new.process_import_character_stats
    end

    message = "Imported stats for " + character_count.to_s + " characters."
    redirect_to characters_url, notice: message
  end

  def stat_mods
  end

  def gear

  end

  def gear_slots
    @tier = params['tier']
    records = @character.character_gears.where(tier: @tier)
    return redirect_to characters_url, notice: "Invalid Gear Tier" if records.blank?

    @character_gear_tier = records.first
  end

  # GET /characters
  # GET /characters.json
  def index
    # @characters = Character.all
    @characters = Character.playable
  end

  # GET /characters/1
  # GET /characters/1.json
  def show
  end

  # GET /characters/new
  def new
    @character = Character.new
  end

  # GET /characters/1/edit
  def edit
  end

  # POST /characters
  # POST /characters.json
  def create
    @character = Character.new(character_params)

    respond_to do |format|
      if @character.save
        format.html { redirect_to @character, notice: 'Character was successfully created.' }
        format.json { render :show, status: :created, location: @character }
      else
        format.html { render :new }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /characters/1
  # PATCH/PUT /characters/1.json
  def update
    respond_to do |format|
      if @character.update(character_params)
        format.html { redirect_to @character, notice: 'Character was successfully updated.' }
        format.json { render :show, status: :ok, location: @character }
      else
        format.html { render :edit }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /characters/1
  # DELETE /characters/1.json
  def destroy
    @character.destroy
    respond_to do |format|
      format.html { redirect_to characters_url, notice: 'Character was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_character
      @character = Character.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def character_params
      params.fetch(:character, {})
    end
end
