class Hello
  def response
    [200, {"Content-Type" => "text/plain"}, ["Hello, simple Ruby!"]]
  end
end
