class HelloWorld
  def call(env)
    req = Rack::Request.new(env)
    puts "*"*10
    puts req.path_info
    puts "*"*10
    case req.path_info
    when "/hello"
      [200, {"Content-type" => "text/plain"}, ["Hello, you simple world! :)"]]
    when "/hello.html"
      [200, {"Content-Type" => "text/html"}, ["<h1>Hello, HTML!</h1>"]]
    else
      [404, {"Content-Type" => "text/html"}, ["404, I'm Lost!"]]
    end
  end
end

run HelloWorld.new
