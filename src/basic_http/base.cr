require "http/server"

module BasicHttp
  class Base
    def initialize
      @route = Router.new
    end

    def run(port=2000)
      server = HTTP::Server.new(port) {|request| respond_by(request) }
      puts "Server is listening to port #{port}"
      server.listen
    end

    def get(route, &block : ( -> String))
      @route.set(route, block)
    end

    private def respond_by(request)
      if @route.map.has_key?(request.path.to_s)
        log(request)
        HTTP::Response.ok("text/html",@route.map[request.path.to_s].call)
      else
        log(request)
        HTTP::Response.not_found
      end
    end

    private def log(request)
      puts Logger.new(request).result
    end
  end
end

