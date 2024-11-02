# Development - Contributing

If you already cloned the repository, here are some guidelines to setup your environment.

## Docker Configuration

First of all, you need to make a copy of the file `.env.example` and rename it as `.env`. Remember to set all appropriate environment variables, if needed.

### Docker Compose Services

This project uses Docker Compose to manage services. Below are the main services configured:

-   **nginx:** acts as the reverse proxy, serving requests to the Laravel application. Accessible on port `${HTTP_ON_HOST}`.
-   **php:** runs the Laravel application with PHP-FPM.
-   **mysql:** MySQL database server, accessible on port `${MYSQL_ON_HOST}`. Uses environment variables from `.env` to set up the initial database and user.
-   **phpmyadmin:** web-based MySQL administration interface, accessible on port `${PHPMYADMIN_ON_HOST}`.
-   **vite:** handles Vite, the asset bundler, and development server for the frontend. Accessible on port `${VITE_ON_HOST}`.
-   **artisan:** CLI for Laravel, useful for running migrations, queues, and other Laravel commands.
-   **composer:** used for dependency management with PHP’s Composer tool.
-   **npm:** used for managing JavaScript dependencies and running frontend build scripts.
-   **sonar:** service for checking when the website is operational.

### In-Depth Setup

For more details on Docker configuration, see the [Docker README](./docker/README.md).

## Laravel Configuration

This project is built with [Laravel 11](https://laravel.com/docs/11.x), using [React](https://react.dev) + [Inertia](https://inertiajs.com) and [TypeScript](https://www.typescriptlang.org) for the frontend. The configuration leverages [Vite](https://vite.dev) as the module bundler, providing Hot Module Replacement (HMR) to streamline frontend development by enabling instant feedback on changes without requiring a full page refresh.

### Artisan, Composer & NPM commands

The project is configured in such a way that all necessary executables are already provided within dedicated tool containers. While it is recommended to use these containers, you can still set up locally [PHP](https://www.php.net), [Composer](https://getcomposer.org) and [NPM](https://nodejs.org/en) on your machine, and use them as by default.

```bash
docker compose run --rm artisan <COMMAND>
docker compose run --rm composer <COMMAND>
docker compose run --rm npm <COMMAND>
```

> If you choose to use the tool containers instead of the locally installed executables (or viceversa), it's highly recommended not to switch within development, as it could cause privilege issues on files and folders created by these programs.

### In-Depth Setup

For more details on Laravel configuration, see the [Laravel README](./src/README.md).

## PHPMyAdmin Configuration

You can connect to the PHPMyAdmin container to see in real-time what is happening inside the database. This can be especially useful if you want to interact directly with the database while testing new functionalities.

To use PHPMyAdmin, you need to connect to `http://localhost:8080/`, and log in using the following default credentials:

-   **Username:** root
-   **Password:** devpassword

> While modifying the `.env` file, if you changed the database root password specified by the `MYSQL_ROOT_PASSWORD` environment variable, remember to use the new password.
