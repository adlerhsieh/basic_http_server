require "http/server"

module BasicHttp
  class Base
    getter :route
    def initialize
      @route   = Router.new
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
      Handler.new(request,self).respond
    end
  end
end

