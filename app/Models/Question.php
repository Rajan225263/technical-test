<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Question extends Model
{
    protected $table = "questions";

    protected $fillable = [
        'name', 'number_of_mcq', 'type', 'status'
    ];

    protected $hidden = [
        ''
    ];
}
