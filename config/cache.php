<?php

/**
 * Redis settings
 */
/* Redis host */
defined('WP_REDIS_HOST')     or define('WP_REDIS_HOST', getenv('WP_REDIS_HOST'));

/* Redis port */
defined('WP_REDIS_PORT')     or define('WP_REDIS_PORT', getenv('WP_REDIS_PORT'));
