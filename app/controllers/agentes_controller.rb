class AgentesController < ApplicationController
  before_action :set_agente, only: %i[ show update destroy ]

  # GET /agentes
  def index
    @agentes = Agente.all

    render json: @agentes
  end

  # GET /agentes/1
  def show
    render json: @agente
  end

  # POST /agentes
  def create
    @agente = Agente.new(agente_params)

    if @agente.save
      render json: @agente, status: :created, location: @agente
    else
      render json: @agente.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /agentes/1
  def update
    if @agente.update(agente_params)
      render json: @agente
    else
      render json: @agente.errors, status: :unprocessable_entity
    end
  end

  # DELETE /agentes/1
  def destroy
    @agente.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agente
      @agente = Agente.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def agente_params
      params.expect(agente: [ :name, :user_id, :status ])
    end
end
