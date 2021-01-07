<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>NanoSoft Technical Test</title>
    <style type="text/css">
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>

<form id="technicalTestForm" name="technicalTestForm" method="post" action="{{ route('question-store') }}">
    @csrf
    <input type="hidden" name="questionNoHiden" value="" class="questionNoHiden">
    <input type="hidden" name="questionId" value="" class="questionId">

<table width="637" border="0" align="center">


    <tr>
        <td width="446" align="center" valign="top"><span style="font-weight:bold;">Technical Test of Nanosoft</span></td>
    </tr>
    <tr>
        <td width="446" align="center" valign="top"><span><b>Candidate Name:</b> Rajan Chandra Bhatta</span></td>
    </tr>

        <tr>
            <td width="446" align="center" valign="top"> <div id="questionCompleted" style="margin-top: 30px;"> </div></td>
        </tr>


    <div id="questionNotComplete">


    <tr>
        <td align="left" valign="top" style="color:blue;">

            <div class="questionName">

            </div>
        </td>
    </tr>
    <tr>
        <td>
            <div class="loadMcqInputList">

            </div>

        </td>
    </tr>
    <tr>
        <td style="padding-top:50px;">

                <label>
                    <input name="btnLater" id="btnLater" type="submit" style="width:80px; height:40px; text-align:center; color:white; background:red; cursor: pointer;" value="Later" />
                </label>

                <label>
                    <input name="btnAnswer" id="btnAnswer" type="submit"  value="Answer"  style="width:80px; height:40px; text-align:center; color:white; background:green; cursor: pointer;"/>
                </label>
        </td>
    </tr>
    </div>
</table>
</form>
</body>

<script type="text/javascript">
    function loadCustomFunction() {
        questionListLoad();
    }

    window.onload = loadCustomFunction;

/* Here load Question list data from db.*/

    function questionListLoad() {


        $.ajax(
            {
                type: 'GET',
                url: '/question-list',
                dataType: "json",
                success: function (result) {
                    $(".questionNoHiden").val(result.countManageTransaction);

                    if(result.totalCountOfAnswer==result.totalCountOfQuestion){
                        $('#questionCompleted').append('<span style="color: green; text-align: center;">Exam has been Completed</span>');
                       $("#btnLater").hide();
                        $("#btnAnswer").hide();

                        $("#questionNotComplete").css("display", "none");
                    }

                    $.each(result.questionList, function (k, val) {
                        $(".questionId").val(val.id);

                        // loading  dynamic Question name here from db.
                        // Author: Rajan Bhatta, Date: 02/01/2021

                        $('.questionName').append('Q.No.' + result.countManageTransaction + ': ' + val.name + ' ? ');

                        // loading  dynamic McQ List here from db.
                        // Author: Rajan Bhatta, Date: 02/01/2021

                        var mcqList_array = val.number_of_mcq.split(',');
                        for(var i = 0; i < mcqList_array.length; i++) {
                            mcqList_array[i] = mcqList_array[i].replace(/^\s*/, "").replace(/\s*$/, "");

                            $('.loadMcqInputList').append(' <label><input name="mcq_name" type="radio" id="' + mcqList_array[i] + '" value="' + mcqList_array[i] + '" />' + mcqList_array[i] + '</label><br>');
                        }

                    });
                }
            }
        );
    }



    // Form Submit

 /*   $('#technicalTestForm').on('submit', function (e) {

        e.preventDefault(); // avoid to execute the actual submit of the form.

        var form = $(this);
        var url = form.attr('action');
        //var formData=$(this).serialize();

        var mcq_name=$("input[name=mcq_name]").val();
        var questionNoHiden=$(".questionNoHiden").val();
        var questionId=$(".questionId").val();


        $.ajax({
            type: "POST",
            url: url,
            dataType: 'json',
            data: {_token:"{{ csrf_token() }}", mcq_name:mcq_name, questionNoHiden:questionNoHiden, questionId:questionId, btnAnswer:'Answer'},
            success: function(data)
            {
                if(data.success==1) {
                    questionListLoad();
                }
            }
        });

    });*/

</script>
</html>
