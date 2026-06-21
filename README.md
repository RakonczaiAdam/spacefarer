## Environment

Create a .env file based on the .env-example

Expose environment variables from .env with command: `export $(cat .env | xargs)`
This step needed for the email sending function which is a sandbox email sender on Mailtrap

## Database setup

- SQLite3 need to be installed `sudo apt install sqlite3`

## Start the application

This is a SAP CAP Java project, start the application with the command `mvn spring-boot:run`

## Authentication

In this project we use mock authentication, the user credentials are the following:
- user: bob
- password: bob

