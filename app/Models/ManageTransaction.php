<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class ManageTransaction extends Model
{
    protected $table = "manage_transactions";

    protected $fillable = [
        'last_tran_no'
    ];

    protected $hidden = [
        ''
    ];
}
