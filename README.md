Introduction
============

Redmoi means Red = read, moi = me in french, so it can mean readme in a sortof twisted way.

Redmoi is a bookmark system, which is able to fetch the URL, and extract the important text and save it.

Redmoi designed to be an archivement tool for collecting internet resources, will not only focus on html resources but also on other media. (ex. PDF...)

Requirements
============

* Ruby 1.9.x
* Rails 3.2.x
* Bundler

Get started
===========

### Install gems and setup database

    bundle install
    rake db:migrate

### Add smple data (Optional)

    rake db:seed
    rake db:sample

### Allow Gmail mailing service (Optional)

    export GMAIL_SMTP_USER=[YOUR GMAIL ADDRESS]
    export GMAIL_SMTP_PASSWORD=[YOUR GMAIL PASSWORD]

### Start

    rails s

License
=======

* The code is licensed under the MIT: http://www.opensource.org/licenses/mit-license.php
