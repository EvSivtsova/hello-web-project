# POST /submit Route Design Recipe

_Copy this design recipe template to test-drive a Sinatra route._

## 1. Design the Route Signature

You'll need to include:
  * the HTTP method
  * the path
  * any query parameters (passed in the URL)
  * or body parameters (passed in the request body)

Return names
Method: POST
Path: /submit
Query parameters: 
  name (string)


## 2. Design the Response

The route might return different responses, depending on the result.

For example, a route for a specific blog post (by its ID) might return `200 OK` if the post exists, but `404 Not Found` if the post is not found in the database.

Your response might return plain text, JSON, or HTML code. 

_Replace the below with your own design. Think of all the different possible responses your route will return._

When query param `name` is `Julia`
```html
<!-- Response when the post is found: 200 OK -->

Thanks Julia, you sent this message: 'Hello world'
```

When query param `name` is `Elena`
```html
<!-- Response when the post is found: 200 OK -->

Thanks Elena, you sent this message: 'Hello world'
```

## 3. Write Examples

_Replace these with your own design._

```
# Request:

POST /submit?name=Julia
```html

# Expected response:

Thanks Julia, you sent this message: 'Hello world'

```

```
# Request:

POST /submit?name=Elena

# Expected response:

Thanks Elena, you sent this message: 'Hello world'

```

## 4. Encode as Tests Examples

```ruby
# EXAMPLE
# file: spec/integration/app_spec.rb

require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

context 'POST to /submit' do
    it "returns message: Thanks Julia, you sent this message: 'Hello world'" do
      response = post('/submit?name=Julia')
      expect(response.status).to eq 200
      expect(response.body).to eq "Thanks Julia, you sent this message: 'Hello world'"
    end

    it 'returns message: Thanks Elena, you sent this message: "Hello world"' do
      response = POST('/submit?name=Elena')
      expect(response.status).to eq 200
      expect(response.body).to eq "Thanks Elena, you sent this message: 'Hello world'"
    end
  end
end
```

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.