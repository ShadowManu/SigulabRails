class ChemicalSubstancesController < ApplicationController
  before_action :set_chemical_substance, only: [:show, :edit, :update, :destroy]

  # GET /chemical_substances
  # GET /chemical_substances.json
  def index
    @chemical_substances = ChemicalSubstance.all
  end

  # GET /chemical_substances/1
  # GET /chemical_substances/1.json
  def show
  end

  # GET /chemical_substances/new
  def new
    @chemical_substance = ChemicalSubstance.new
  end

  # GET /chemical_substances/1/edit
  def edit
  end

  # POST /chemical_substances
  # POST /chemical_substances.json
  def create
    @chemical_substance = ChemicalSubstance.new(chemical_substance_params)

    respond_to do |format|
      if @chemical_substance.save
        format.html { redirect_to @chemical_substance, notice: 'Sustancia Quimica fue creada de forma exitosa.' }
        format.json { render :show, status: :created, location: @chemical_substance }
      else
        format.html { render :new }
        format.json { render json: @chemical_substance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chemical_substances/1
  # PATCH/PUT /chemical_substances/1.json
  def update
    respond_to do |format|
      if @chemical_substance.update(chemical_substance_params)
        format.html { redirect_to @chemical_substance, notice: 'Sustancia Quimica fue actualizado de forma exitosa.' }
        format.json { render :show, status: :ok, location: @chemical_substance }
      else
        format.html { render :edit }
        format.json { render json: @chemical_substance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chemical_substances/1
  # DELETE /chemical_substances/1.json
  def destroy
    @chemical_substance.destroy
    respond_to do |format|
      format.html { redirect_to chemical_substances_url, notice: 'Sustancia Quimica fue eliminado de forma exitosa.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chemical_substance
      @chemical_substance = ChemicalSubstance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chemical_substance_params
      params.require(:chemical_substance).permit(:name, :purity, :matter_states, :controlled, :legal_regime, :quantity, :cas, :use, :status, :responsible, :location, :expiration_date, :dangerous, :rI7, :rI4, :toxic, :oxidant, :explosive, :irritating, :inflamable, :corrosive, :nocive, :investigation, :teaching, :extention, :management)
    end
end