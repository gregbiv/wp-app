<?php declare(strict_types=1);
require_once __DIR__ . '/../vendor/autoload.php';

/** @var string Directory containing all of the site's files */
$root_dir = dirname(__DIR__);

/** @var string Document Root */
$webroot_dir = $root_dir . '/web';

/**
 * Expose global env() function from oscarotero/env
 */
Env::init();

$dotenv = new Dotenv\Dotenv($root_dir);

if (file_exists($root_dir . '/.env')) {
    $dotenv->load();
    $dotenv->required(['DB_HOST', 'DB_NAME', 'DB_USER', 'DB_PASSWORD']);
}

return [
    'paths' => [
        'migrations' => __DIR__ . '/../data/migrations',
    ],
    'environments' => [
        'default_migration_table' => 'phinxlog',
        'default_database' => 'wordpress',
        'wordpress' => [
            'adapter' => 'mysql',
            'host' => $_ENV['DB_HOST'],
            'name' => $_ENV['DB_NAME'],
            'user' => $_ENV['DB_USER'],
            'pass' => $_ENV['DB_PASSWORD']
        ],
    ],
];
