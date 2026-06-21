## Environment

Expose environment variables from .env with command: `export $(cat .env | xargs)`
This step needed for the email sending function which is a sandbox email sender on Mailtrap

## Database setup

- SQLite3 need to be installed `sudo apt install sqlite3`

## Authentication

In this project we use mock authentication, the user credentials are the following:
- user: bob
- password: bob

