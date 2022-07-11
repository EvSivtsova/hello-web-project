# POST /sort-names Route Design Recipe

_Copy this design recipe template to test-drive a Sinatra route._

## 1. Design the Route Signature

You'll need to include:
  * the HTTP method
  * the path
  * any query parameters (passed in the URL)
  * or body parameters (passed in the request body)

Return names
Method: POST
Path: /sort-names
Query parameters: 
  names (comma separated string)


## 2. Design the Response

The route might return different responses, depending on the result.

For example, a route for a specific blog post (by its ID) might return `200 OK` if the post exists, but `404 Not Found` if the post is not found in the database.

Your response might return plain text, JSON, or HTML code. 

_Replace the below with your own design. Think of all the different possible responses your route will return._

When query param `names` is `Joe,Alice,Zoe,Julia,Kieran`
```html
<!-- Response when the post is found: 200 OK -->

Alice,Joe,Julia,Kieran,Zoe
```

When query param `names` is `Joseph,Arabella,Mary,John,Zoe`
```html
<!-- Response when the post is found: 200 OK -->

Arabella,John,Joseph,Mary,Zoe
```

## 3. Write Examples

_Replace these with your own design._

```
# Request:

POST /sort-names?names=Joe,Alice,Zoe,Julia,Kieran
```html

# Expected response:

Alice,Joe,Julia,Kieran,Zoe

```

```
# Request:

POST /sort-names?names=Joseph,Arabella,Mary,John,Zoe

# Expected response:

Arabella,John,Joseph,Mary,Zoe

```

## 4. Encode as Tests Examples

```ruby
# EXAMPLE
# file: spec/integration/app_spec.rb

require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context 'POST to /sort-names' do
    it 'returns "Alice,Joe,Julia,Kieran,Zoe"' do
      response = post('/sort-names?names=Joe,Alice,Zoe,Julia,Kieran')
      expect(response.status).to eq 200
      expect(response.body).to eq "Alice,Joe,Julia,Kieran,Zoe"
    end

    it 'returns "Arabella,John,Joseph,Mary,Zoe"' do
      response = post('/sort-names?names=Joseph,Arabella,Mary,John,Zoe')
      expect(response.status).to eq 200
      expect(response.body).to eq "Arabella,John,Joseph,Mary,Zoe"
    end
  end
end
```

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.