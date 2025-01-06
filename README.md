# Laravel 11 + MySQL + Docker

Template for using Laravel + MySQL in a Docker environment.

## How To Use

First of all, you need to make a copy of the file `.env.example` in the project root folder, and rename it as `.env`. This also need to be done with the `.env.example` file within the `src` folder.

> Remember to set all appropriate environment variables, if needed.

### First launch

For the first launch of the program, you must execute the following command. This creates all the containers necessary to run the application.

```bash
docker compose build
```

After that completes, run the following to install and compile the dependencies for the application:

```bash
docker compose run --rm composer install
docker compose run --rm npm install
docker compose run --rm npm run build
```

Finally, launch all application containers, and run the necessary migrations:

```bash
docker compose up
docker compose run --rm artisan migrate
```

### Subsequent Launches

For all subsequent launches, you just need to execute:

```bash
docker compose up
```

When you are finished, you can close the application (and destroy all containers) by using:

```bash
docker compose down
```

You can access the application through [http://localhost:8000/](http://localhost:8000/).
