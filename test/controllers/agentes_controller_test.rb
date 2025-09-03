require "test_helper"

class AgentesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @agente = agentes(:one)
  end

  test "should get index" do
    get agentes_url, as: :json
    assert_response :success
  end

  test "should create agente" do
    assert_difference("Agente.count") do
      post agentes_url, params: { agente: { name: @agente.name, status: @agente.status, user_id: @agente.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show agente" do
    get agente_url(@agente), as: :json
    assert_response :success
  end

  test "should update agente" do
    patch agente_url(@agente), params: { agente: { name: @agente.name, status: @agente.status, user_id: @agente.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy agente" do
    assert_difference("Agente.count", -1) do
      delete agente_url(@agente), as: :json
    end

    assert_response :no_content
  end
end
