require_relative 'hello'
require_relative 'hellohtml'
require_relative '404'

class HelloWorld
  def call(env)
    req = Rack::Request.new(env)
    case req.path_info
    when "/hello"
      Hello.new.call(env)
    when "/hello.html"
      Hellohtml.new.call(env)
    else
      Four04.new.call(env)
    end
  end
end

run HelloWorld.new
