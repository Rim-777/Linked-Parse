### Ruby(Rails) API for the LinkedIn public-pages parsing with ActiveRecord, Sphinx, RSpec

### Dependencies:
- Ruby 2.2.3
- PostgreSQL
- Sphinx
- Redis

### Installation:
   - Clone poject
   - Run bundler:

   ```shell
   $ bundle install
   ```
   Create database.yml:
   ```shell
   $ cp config/database.yml.sample config/database.yml
   $ bundle exec rake db:create db:migrate
   ```
   - Run application(please use different terminal windows for each command):
   ```shell
    $ rails s -p 3000
    $ redis-server #(for background jobs)
    $ sideqik #(for background jobs)
    $ rake ts:index ts:start.
   ```
   
   ##### Tests:

   To execute tests, run following commands:

   ```shell
    $ bundle exec rake db:migrate RAILS_ENV=test #(the first time only)
    $ bundle exec rspec
   ```
   
   #### End-points:   
   ```
   GET "/api/v1/users"  #all users
   POST "/api/v1/users" - (param_key: linked_url(String)).
   GET "/api/v1/search/search" - (param_keys: category(String), query(String)
   ```
   
### License

The software is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


