require_relative 'hello'
require_relative 'hellohtml'
require_relative '404'
require 'logger'

# req = Rack::Request.new(env)

class HelloRouter

  attr_reader :logger

  def initialize(routes)
    @routes_config = routes
    @logger = Logger.new(STDOUT)
  end

  def call(env)
    logger.debug "[REQ] Start request"
    build_rack_app(env).call(env)
  end

  def build_rack_app(env)
    rack_app_name = resolve_route(env)
    Object.const_get(rack_app_name).new
  end

  def resolve_route(env)
    logger.debug "[REQ] Resolving #{env['REQUEST_PATH']}"
    @routes_config.resolve(env)
  end

end

class HelloRouterConfig

  attr_reader :logger

  def initialize
    @routes = {}
    @not_found_app = nil
    @logger = Logger.new(STDOUT)

    logger.debug "[CONFIG] Start config"
    yield(self)
    logger.debug "[CONFIG] End config"
  end

  def get(path, app)
    logger.debug "[CONFIG] Added #{path} to config"
    @routes[path] = app
  end

  def not_found(app)
    logger.debug "[CONFIG] Not found app: #{app}"
    @not_found_app = app
  end

  def root(app)
    get '/', app
    get '', app
  end

  def resolve(env)
    logger.debug "[REQ] Resolving #{env['REQUEST_PATH']}"
    @routes[env['REQUEST_PATH']] || @not_found_app
  end

end

config = HelloRouterConfig.new do |r|

  r.root 'Hello' # '/', ''

  r.get "/hello", 'Hello'
  r.get "/banana", 'Hello'
  r.get "/hello.html", 'Hellohtml'

  r.not_found 'Four04'
end

run ->(*) { [200, {}, ["I'm a proc"]] } # HelloRouter.new(config)
