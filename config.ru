require File.join(File.dirname(__FILE__), 'hello')
require File.join(File.dirname(__FILE__), 'hellohtml')

class HelloWorld
  def call(env)
    req = Rack::Request.new(env)
    case req.path_info
    when "/hello"
      Hello.new.response
    when "/hello.html"
      Hellohtml.new.response
    else
      [404, {"Content-Type" => "text/html"}, ["404, I'm Lost!"]]
    end
  end
end

run HelloWorld.new
