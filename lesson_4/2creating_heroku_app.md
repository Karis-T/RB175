## Creating a Heroku app

1. After being tested locally its time to deploy it to a remote server. Create the application using `heroku apps:create` followed by the name of the application you'd like
2. to push and built the project to heroku application use `git push heroku main`
   - be careful of available stacks when using a slightly older ruby
   - to see available stacks `heroku stack`
   - to set the stack use `heroku stack: set heroku-18` currently 3 are in use with them being updated regularly
3. Visit the application to check if everything is working 
   - https://karis-t-book-viewer.herokuapp.com/
4. To see if Heroku automatically sets the `RACK_ENV` check to see the change at `heroku config`

```
$ heroku config
=== ls-rb170-book-viewer Config Vars
LANG:     en_US.UTF-8
RACK_ENV: production
```

- Environment variables are often used to provide API keys and other secret values to applications without including them in the application's source code.