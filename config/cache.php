<?php

/**
 * Redis settings
 */
/* Redis cache enabled */
defined('WP_REDIS_DISABLED')     or define('WP_REDIS_DISABLED', filter_var(
    getenv('WP_REDIS_DISABLED'),
    FILTER_VALIDATE_BOOLEAN
));

/* Redis host */
defined('WP_REDIS_HOST')     or define('WP_REDIS_HOST', getenv('WP_REDIS_HOST'));

/* Redis port */
defined('WP_REDIS_PORT')     or define('WP_REDIS_PORT', getenv('WP_REDIS_PORT'));
