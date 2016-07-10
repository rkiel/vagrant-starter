#### Getting Started with rails

#### Vagrant

Start up Vagrant

    vagrant up

Connect to Vagrant

    vagrant ssh rails
    cd /vagrant

#### Rails

Create a new rails project

    rm -f Gemfile*
    rails new .

#### Git

Restore `.gitingore` paths

    echo '.vagrant'     >> .gitignore
    echo '.rvmrc'       >> .gitignore
    echo 'node_modules' >> .gitignore

Reset repository (OPTIONAL)

    git -rf .git
    git init
    
Add new files to git

    git add .gitignore Gemfile* Rakefile app bin config* db lib log public test tmp vendor
    git add Vagrantfile provision

Commit changes

    git commit -m "rails new"

#### Rails

Remove comments

    cp Gemfile /tmp/Gemfile
    grep -v ^\\s*# /tmp/Gemfile > Gemfile

Add a JS runtime

    echo "gem 'therubyracer', platforms: :ruby" >> Gemfile

Install gems

    bundle install --without production

Commit changes

    git add Gemfile*
    git commit -m "added JS runtime"


Start the rails server

    ./bin/rails server -b 192.168.33.10

Vist the the Welcome page

[http://192.168.33.10:3000](http://192.168.33.10:3000)

#### Update Gemfile to be compatable with Heroku

Remove `sqlite3`

    cp Gemfile /tmp/Gemfile
    grep -v sqlite3 /tmp/Gemfile > Gemfile

Add gems

    echo "ruby '2.3.1'"             >> Gemfile

    echo "gem 'bcrypt', '~> 3.1.11'" >> Gemfile

    echo "group :development, :test do" >> Gemfile
    echo "  gem 'sqlite3'"              >> Gemfile
    echo "end"                          >> Gemfile

    echo "group :production do" >> Gemfile
    echo "  gem 'pg'"           >> Gemfile
    echo "end"                  >> Gemfile

    echo "group :development do" >> Gemfile
    echo "  gem 'netrc'"         >> Gemfile
    echo "  gem 'rest-client'"   >> Gemfile
    echo "  gem 'heroku-api'"    >> Gemfile
    echo "end"                   >> Gemfile

Update gems

    bundle install --without production

Commit changes

    git add Gemfile*
    git commit -m "make Gemfile compatable with Heroku"

#### Deploy to heroku

Login to your Heroku account

    heroku auth:login

Create a new project

    heroku create

Set your secret key

    heroku config:set SECRET_KEY_BASE=`rake secret`
    heroku config:get SECRET_KEY_BASE

Push your code to Heroku

    git push heroku master

Run your migrations

    heroku run rake db:migrate

Checkout the application

[https://TBD.herokuapp.com](https://TBD.herokuapp.com)


Generate a user model

    rails generate model user first last email password_digest
