# Billetto Ruby on Rails Engineer Test

This project is a Ruby on Rails application following Domain-Driven Design (DDD) principles with Rails Event Store for event-driven architecture.

---

## Prerequisites

Ensure you have the following installed on your system:

- **Ruby**: 3.1.0 or higher
- **Rails**: 7.2.2
- **PostgreSQL**: 12+
- **Bundler**: `gem install bundler`

---

## Setup Instructions

### 1. Clone the Repository

```bash
git clone git@github.com:JigarShahTntra/billetto_test_app.git
cd billetto_test_app
```

### 2. Install Gems

Run the following command to install the required gems:

```bash
bundle install
```

### 3. Configure the Database

Update the `config/database.yml` file with your database credentials.

#### Example `config/database.yml`:

```yaml
default: &default
  adapter: postgresql
  encoding: unicode
  pool: 5

development:
  <<: *default
  database: project_name_development
  username: <your_db_username>
  password: <your_db_password>

test:
  <<: *default
  database: project_name_test
  username: <your_db_username>
  password: <your_db_password>

production:
  <<: *default
  database: project_name_production
  username: <your_db_username>
  password: <your_db_password>
```

Create the database:

```bash
rails db:setup
```

### 4. Set Up Credentials

Store your credentials securely using Rails encrypted credentials.
To use the testing credentials use `master.key` provided in the email.

Run:
```bash
EDITOR="code --wait" rails credentials:edit
```

Add the following:

```yaml
billetto:
  api_key: 

clerk:
  api_key: 
  secret_key: 
  sign_in_url: 
  sign_up_url: 
```

### 5. Run the Tests

Ensure the application is functioning as expected by running the test suite:

```bash
rspec
```

### 6. Start the Server

Start the Rails development server:

```bash
rails s
```

Access the application at [http://localhost:3000](http://localhost:3000).

---

## Project Structure

This project follows Domain-Driven Design (DDD) principles with the following structure:

```
app/
  domain/
    commands/
    events/
    services/
    handlers/
  read_models/
config/
lib/
  command_bus.rb
  application_subscriptions.rb
```

### Key Components

1. **Commands**: Represent user actions.
2. **Events**: Immutable records of domain changes.
3. **Services**: Contain business logic.
4. **Handlers**: Update read models or trigger side effects.
5. **Read Models**: Denormalized data for fast queries.

---

## Features

1. **Event Ingestion**: Fetch and store events from an external API or seed data.
2. **Voting System**: Users can upvote or downvote events with restrictions.
3. **Event-Driven Architecture**: Leveraging Rails Event Store for domain events.

---

## Troubleshooting

### Common Issues

1. **Database Connection Error**:

   - Ensure PostgreSQL is running and credentials are correct in `config/database.yml`.

2. **Missing Credentials**:

   - Run `rails credentials:edit` to add the necessary keys.

3. **Dependency Errors**:

   - Run `bundle install` to ensure all gems are installed.

4. **Server Not Starting**:
   - Check logs in `log/development.log` for error details.
