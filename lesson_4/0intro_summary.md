## intro

After building a web app locally, We can now deploy the app to a server on the internet. Once we've done that we can have other users access the site by providing them the URL

- learn the configuration needed to run a production Sinatra application
- Heroku is able to run apps that haven't been configured for production, they tend not to perform so well.
- It only takes a few minutes to get an application setup the right way

## summary

- `Procfile` defines what types of processes the application provides and how to start them
- `config.ru` tells the web server how to start the app. In this particular project we require the file that contains the Sinatra app and then start it
- Use `Puma` when deploying projects as it is a production ready server. 
  - WEBrick is only really used for development
  - Puma is a threaded web server  - meaning it handles more than 1 request at a time using a single process. 
  - Due to this Puma performs much better for most applications
- We can specify a version of ruby in the `Gemfile` to ensure that same version is used in development and production.

