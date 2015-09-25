require "http/server"

module BasicHttp
  class Handler
    def initialize(@request,@app)
      @route = @app.route.map
    end

    def respond
      if @route.has_key?(@request.path.to_s)
        log
        HTTP::Response.ok("text/html", @route[@request.path.to_s].call)
      else
        log
        HTTP::Response.not_found
      end
    end

    def log
      puts Logger.new(@request,@app).result
    end
  end
end
