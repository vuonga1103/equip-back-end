# Equip Backend 

[Video Demo](https://www.youtube.com/watch?v=TLyb1NhYnUs&feature=youtu.be&ab_channel=AnhV)

This is the Ruby on Rails API for Equip. Equip is an online marketplace where users can sell, buy, or donate used or new durable medical equipment. Users can add items for sale. Users can also browse and search for and sort items by various categories and distance.

[Link to Frontend](https://github.com/vuonga1103/equip-front-end)

## Getting Started

1. Install [Homebrew](https://brew.sh/)

    ```$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"```
  
2. Install [Ruby](https://www.ruby-lang.org/en/)
    
    ```$ brew install ruby```

3. Install [Rails](https://rubyonrails.org/)

    ```$ gem install rails```

4. Install [PostgreSQL](https://www.postgresql.org/)

    ```$ brew install postgresql```


## Downloading This Project

1. Clone the repo and cd into the folder
2. Bundle Install

    ```$ bundle install```
    
3. Create migrations, migrate and seed:

    ```
    $ rails db:create
    $ rails db:migrate
    $ rails db:seed
4. Last step, launch the rails server!

    ```$ rails s -p 4000```
