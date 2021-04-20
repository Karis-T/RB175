## how to setup configuration for deployment in heroku

1. Make sure you push your project to github first

2. Stop the app from reloading when in production with conditional and method:

   ```ruby
   require "sinatra/reloader" if development?
   ```

   - Sinatra uses `development?` and `production?` methods which return `true` based on the current value of the `RACK_ENV` environment variable.
   - Heroku automatically sets the environment to `"production"`, making `production?` return true and thus `development?` return `false`

3. Specify the exact ruby version in the `Gemfile` so Heroku knows the exact version of ruby to use when serving the project

   - If issues occur during testing on local server with `heroku local`, delete `Gemfile` and run `bundle install` again
   - Heroku will display an error if you decide to push to it without a ruby version
   - Heroku regularly updates its support and therefore doesn't support older versions of ruby. Because of this try to use a recent version of Ruby 

4. Configure the app to use a PRODUCTION web server

   - WEBrick is better for local development and is not designed to handle high concurrent workload that ruby apps need to serve in production. production servers should be used instead
     - WEBrick supports a new thread per each request and cannot make use of multiple cores 
   - Puma is preferred for production development as it supports multithreading and multiprocessing allowing maximum performance and more importantly multiple requests concurrently. 
   - Every time you make a change to the `Gemfile` `bundle install` must be run again
   - If you deploy a ruby app without a `Procfile`, the default webserver will be used

5. A `config.ru` in the root folder tells the web server (Puma) how to start the application

6. A `Procfile` in the root folder determines what processes should run when the application boots up

   - For larger apps its recommended you use a separate config file for Puma instead of providing its config inline. This approach is fine for simpler projects.
   - While its not required creating an explicit `Procfile` is recommended for greater control and flexibility over the app

7. Test the `Procfile` locally with `heroku local` in command line:

   - This allows us to simulate what the app will look like when its pushed to heroku. by running it locally we can catch any bugs and troubleshoot before deployment.
   - `heroku local` when first run downloads and installs a copy of `forego` which is a program that runs Procfile-compatible applications
   - despite the warning your app can still work without the `.env` files which is used to set environment variables for app local testing.

The app should work if you visit [localhost:5000](http://localhost:5000/)