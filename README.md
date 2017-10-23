# README

Setup:

To setup app run -

> make build
> make import_cities

Database:
* No database required as static data can be indexed into ES by a rake task.

Sidekiq:
* Not using sidekiq anywhere currently but added as wanted to implement background jobs for some processes.
* Check Improvement section below to know more about sidekiq usage.

Redis:
* As Cache store

Elastic search:
* Search engine for finding city ids for acurate result from openweather apis.

Improvements:

* Improve script to import json file into Elastic search.

* Test cases

* Currently working only on city name, country can be added.

* Optimizing import query with sidekiq background jobs.

* Optimizing response time by implementing cache miss in background job.

* Cache frequently used cities by analying ES search counts and running cron job to serve faster.