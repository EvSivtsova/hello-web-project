# GET /hello Route Design Recipe

_Copy this design recipe template to test-drive a Sinatra route._

## 1. Design the Route Signature

You'll need to include:
  * the HTTP method
  * the path
  * any query parameters (passed in the URL)
  * or body parameters (passed in the request body)

Return a hello message
Method: GET
Path: /hello
Query parameters: 
  name (string)


## 2. Design the Response

The route might return different responses, depending on the result.

For example, a route for a specific blog post (by its ID) might return `200 OK` if the post exists, but `404 Not Found` if the post is not found in the database.

Your response might return plain text, JSON, or HTML code. 

_Replace the below with your own design. Think of all the different possible responses your route will return._

When query param `name` is `Ev`

```html
<!-- Response when the post is found: 200 OK -->
<html>
  <head></head>
  <body>
    <h1>Hello Ev!</h1>
  </body>
</html>
```
When query param `name` is `Steve`

```html
<!-- Response when the post is found: 200 OK -->

<html>
  <head></head>
  <body>
    <h1>Hello Steve!</h1>
  </body>
</html>
```

## 3. Write Examples

_Replace these with your own design._

```
# 1 Request:

GET /hello?name=Ev

# Expected response:

<html>
  <head></head>
  <body>
    <h1>Hello Ev!</h1>
  </body>
</html>

```

```
# 2 Request:

GET /hello?name=Steve

# Expected response:

<html>
  <head></head>
  <body>
    <h1>Hello Steve!</h1>
  </body>
</html>

```

## 4. Encode as Tests Examples

```ruby
# EXAMPLE
# file: spec/integration/app_spec.rb

require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context 'GET to /hello' do
    it "should return 'Hello Ev'" do
      response = get('/hello?name=Ev')
      expect(response.status).to eq 200
      expect(response.body).to include("<h1>Hello Ev!</h1>")
    end

    it "should return 'Hello Steve'" do
      response = get('/hello?name=Steve')
      expect(response.status).to eq 200
      expect(response.body).to include("<h1>Hello Steve!</h1>"_
    end
  end
end
```

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.