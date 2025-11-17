<?php
namespace SimonPreston\Content\Models;

use Model;

/**
 * Model
 */
class Article extends Model
{
    use \Winter\Storm\Database\Traits\Validation;

    use \Winter\Storm\Database\Traits\SoftDelete;

    protected $dates = [
        'deleted_at',
        'published_at'
    ];


    /**
     * @var string The database table used by the model.
     */
    public $table = 'simonpreston_content_articles';

    /**
     * @var array Validation rules
     */
    public $rules = [
    ];

    public function categories()
    {
        return $this->belongsToMany('SimonPreston\Content\Models\Category');
    }
}
