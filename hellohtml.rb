class Hellohtml
  def call(env)
    [200, {"Content-Type" => "text/html"}, ["<b>Hello, HTML!</b>"]]
  end
end
