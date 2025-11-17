<?php

namespace SimonPreston\Content\Models;

use Model;

/**
 * Model
 */
class Category extends Model
{
    use \Winter\Storm\Database\Traits\Validation;

    use \Winter\Storm\Database\Traits\SoftDelete;

    protected $dates = [];


    /**
     * @var string The database table used by the model.
     */
    public $table = 'simonpreston_content_categories';

    /**
     * @var array Validation rules
     */
    public $rules = [];
}
