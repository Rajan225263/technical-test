<?php

namespace App\Http\Controllers;
use App\Models\ManageTransaction;
use App\Models\Question;
use App\Models\Answer;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use DB;

class QuestionController extends Controller
{
    public function index()
    {
        return view('TechnicalTest.index');
    }

    public function questionList()
    {
        $questionList = Question::where('status', 'Active')->whereIn('type', ['I', 'L'])->orderByRaw("FIELD(type , 'I', 'L', 'A') ASC")->limit(1)->inRandomOrder()->get();
        $countManageTransaction= ManageTransaction::max('last_tran_no');

        if (is_numeric($countManageTransaction)) {
            $countManageTransaction = $countManageTransaction + 1;
        } else {
            $countManageTransaction = 0+1;
        }

        $totalCountOfAnswer=Answer::count();
        $totalCountOfQuestion=Question::where('status', 'Active')->count();

        return response()->json(array(
            'questionList'=>$questionList,
            'countManageTransaction'=>$countManageTransaction,
            'totalCountOfAnswer'=>$totalCountOfAnswer,
            'totalCountOfQuestion'=>$totalCountOfQuestion
        ));
    }

    public function store(Request $request)
    {




        try {
            if ($request->isMethod("POST")) {



                if (isset($request['btnAnswer']) && ($request['btnAnswer']=='Answer')) {

                    $question_type="A";

                    $answerData = array(
                        'question_id' => $request['questionId'],
                        'question_name' => $request['mcq_name']
                    );
                    Answer::insert($answerData);


                    $maxTransctionData = array(
                        'last_tran_no' => $request['questionNoHiden']
                    );

                    ManageTransaction::insert($maxTransctionData);

                } elseif (isset($request['btnLater']) && ($request['btnLater']=='Later')) {
                    $question_type="L";
                }

                Question::where(['id'=>$request['questionId']])->update(['type'=>$question_type]);


                return redirect()->route('questions');

                /*return response()->json(array(
                    'success'=>1,
                ));*/
            }
        } catch (\Exception $e) {

            $errorMessage=$e->getMessage();
            $customMessage="Exception! Something went wrong please try again!";

            $error = \Illuminate\Validation\ValidationException::withMessages([
                'exception' => [$customMessage]
            ]);
            throw $error;
        }

    }
}
