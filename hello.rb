class Hello
  def call(env)
    [200, {"Content-Type" => "text/plain"}, ["Hello, simple Ruby!"]]
  end
end
