class Hellohtml
  def response
    [200, {"Content-Type" => "text/html"}, ["<b>Hello, HTML!</b>"]]
  end
end
