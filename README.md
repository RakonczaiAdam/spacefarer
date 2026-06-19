## Database setup

- SQLite3 need to be installed `sudo apt install sqlite3`

- To seed data from csv files located in db/data/ run command `cds deploy --to sqlite:srv/db.sqlite`

## Model layer

The Intergalactic positions stored in IntergalacticPosition model, where every position ever dealt are stored with the start and end of the service. The active service of the Spacefarer is where the end of service in null.

