## Parameters

### params as a 'named wildcard'

```ruby
get '/:number' do
  number = params[:number]
end
```

- parameters can be used like a named wildcard or splat operator and can be assigned to variables for use later on

### params accessing a query

```ruby
get '/?sort=desc' do 
  @files.reverse! if params[:sort] == 'desc'
end
```

- params can also be used to access query parameters from a URL