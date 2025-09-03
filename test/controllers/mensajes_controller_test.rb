require "test_helper"

class MensajesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mensaje = mensajes(:one)
  end

  test "should get index" do
    get mensajes_url, as: :json
    assert_response :success
  end

  test "should create mensaje" do
    assert_difference("Mensaje.count") do
      post mensajes_url, params: { mensaje: { contenido: @mensaje.contenido, conversation_id: @mensaje.conversation_id } }, as: :json
    end

    assert_response :created
  end

  test "should show mensaje" do
    get mensaje_url(@mensaje), as: :json
    assert_response :success
  end

  test "should update mensaje" do
    patch mensaje_url(@mensaje), params: { mensaje: { contenido: @mensaje.contenido, conversation_id: @mensaje.conversation_id } }, as: :json
    assert_response :success
  end

  test "should destroy mensaje" do
    assert_difference("Mensaje.count", -1) do
      delete mensaje_url(@mensaje), as: :json
    end

    assert_response :no_content
  end
end
