# Github_star_ratings

This Rails application that keeps track of the stars that a given user has in its Github repositories.

#### 1. Install Ruby 3.0.1

[Install RVM](https://rvm.io/rvm/install)

After installing go to project directory and install 3.0.3 ruby version
```
cd [your-path]/github_star_ratings
rvm install 3.0.3
```

#### 2. Install PostgreSQL

Just example:
```
sudo apt-get install postgresql postgresql-contrib
sudo -u postgres psql
```
Create a user and grant access on database
```sql
CREATE USER postgres WITH password 'postgres';
CREATE DATABASE "github_star_ratings_development";
CREATE DATABASE "github_star_ratings_test";
GRANT ALL PRIVILEGES ON DATABASE "github_star_ratings_development" to postgres;
GRANT ALL PRIVILEGES ON DATABASE "github_star_ratings_test" to postgres;
```

#### 3. Install gems
```
gem install bundler
bundle install --path=vendor/bundle
```

#### 4. Create the databases
```
bundle exec rake db:setup
```

# Run application

#### Run server
```
bundle exec rails s
```

#### Run redis server
```
/etc/init.d/redis-server start
```

#### Run tests
```
bundle exec rspec
```

#### Api endpoint

```
localhost:3000/repositories
```

```
{
  "username": "vinayak-mehta"
}
```
Response

```
[
  {
    "name": "100-pandas-puzzles",
    "stars": 2
  },
  {
    "name": "agnoster-zsh-theme",
    "stars": 0
  },
  {
    "name": "airflow-dag",
    "stars": 1
  },
  {
    "name": "airflow-dags",
    "stars": 1
  },
  {
    "name": "analyzr",
    "stars": 2
  },
  {
    "name": "awesome-apache-airflow",
    "stars": 0
  }
]
```