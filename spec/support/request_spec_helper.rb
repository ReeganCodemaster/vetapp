module RequestSpecHelper
  def jsom
    JSON.parse(response.body)
  end
end