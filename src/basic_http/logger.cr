require "colorize"
module BasicHttp
  class Logger
    getter :result
    def initialize(@request)
      @result = StringIO.new
      @result << method
      @result << path
      @result << http_status
      @result << timestamp
    end
    def method
      @request.method + " "
    end
    def path
      "\"" + @request.path.to_s.colorize(:yellow).to_s + "\" "
    end
    def http_status
     "with " + "200 ".colorize(:green).to_s
    end
    def timestamp
     "at " + "#{Time.now.to_s("%Y/%m/%d %H:%M:%S")}".colorize(:blue).to_s
    end
  end
end
