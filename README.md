# [WP-Blog](https://kornienko.site/)
[![Build Status](https://img.shields.io/travis/gregbiv/wp-blog.svg?style=flat-square)](https://travis-ci.org/gregbiv/wp-blog)

WP-blog is yet another one blog based on WordPress

## Features

* Dependency management with [Composer](http://getcomposer.org)
* Easy WordPress configuration with environment specific files
* Environment variables with [Dotenv](https://github.com/vlucas/phpdotenv)
* Autoloader for mu-plugins (use regular plugins as mu-plugins)

## Requirements

* PHP >= 5.6
* Composer - [Install](https://getcomposer.org/doc/00-intro.md#installation-linux-unix-osx)

## Installation

1. Update environment variables in `.env`  file:
  * `DB_NAME` - Database name
  * `DB_USER` - Database user
  * `DB_PASSWORD` - Database password
  * `DB_HOST` - Database host
  * `WP_ENV` - Set to environment (`development`, `staging`, `production`)
  * `WP_HOME` - Full URL to WordPress home (http://example.com)
  * `WP_SITEURL` - Full URL to WordPress including subdirectory (http://example.com/wp)
  * `AUTH_KEY`, `SECURE_AUTH_KEY`, `LOGGED_IN_KEY`, `NONCE_KEY`, `AUTH_SALT`, `SECURE_AUTH_SALT`, `LOGGED_IN_SALT`, `NONCE_SALT`

2. Set your site vhost document root to `/path/to/site/web/` (`/path/to/site/current/web/` if using deploys)

3. Access WP admin at `http://example.com/wp/wp-admin`

## Deploys

Methods to deploy WP-blog:

* [Ansible](http://github.com/gregbiv/digitalocean-automation)

## Contributing

Contributions are welcome from everyone. We have [contributing guidelines](https://github.com/roots/guidelines/blob/master/CONTRIBUTING.md) to help you get started.

## License
[MIT](https://github.com/gregbiv/wp-blog/blob/master/LICENSE.md)
