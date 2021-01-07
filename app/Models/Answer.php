<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Answer extends Model
{
    protected $table = "answers";
    protected $with = ['question'];

    protected $fillable = [
        'question_id', 'question_name'
    ];

    protected $hidden = [
        ''
    ];

    public function question() {
        return $this->belongsTo(Question::Class, question_id);
    }
}
