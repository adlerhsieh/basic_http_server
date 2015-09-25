require "./basic_http"

app = Iceberg.new

app.get "/" do
  "<h1>Hello World</h1>"
end

app.get "/app" do
  "this is app page"
end

app.run
