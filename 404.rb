class Four04
  def call(env)
    [404, {"Content-Type" => "text/html"}, ["404, I'm Lost!"]]
  end
end
