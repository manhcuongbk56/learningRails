### Learning Rails from the book Agile web development with Rails

* Ruby version: 2.6.3

* Rails version: 5.2.3

* Database: PostgreSQL

* Database Configuration:

These two environment variables must be set:
```bash
export POSTGRES_USERNAME=<your postgres username>
export POSTGRES_PASSWORD=<your postgres password>
```

* Database creation and initialization:
```bash
rake db:create db:migrate
```

* Run spec test:
```bash
rspec
```
