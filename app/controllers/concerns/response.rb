module Response
  def json_response(object, status= :ok)
    render json: object, status: status, include: '**'
  end

  def auth_response(object, status= :ok)
    render json: object, serializer: AuthUserSerializer, status: status, include: '**'
  end
end