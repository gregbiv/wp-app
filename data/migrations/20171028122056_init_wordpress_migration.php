<?php declare(strict_types=1);

use Phinx\Migration\AbstractMigration;

class InitWordpressMigration extends AbstractMigration
{
    /**
     * @inheritdoc
     */
    public function up()
    {
        $this->execute(file_get_contents(__DIR__ . '/../init.sql'));
    }

    /**
     * @inheritdoc
     */
    public function down()
    {
        $this->dropTable('wordpress');
    }
}
