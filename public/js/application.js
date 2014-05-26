$(document).ready(function() {

  varCount = 0;

  $('#addQuestion').on('click', function(e) {
    // $(this).remove();
    e.preventDefault();
    varCount++;

    $(this).before('<p><label for="question'+varCount+'">Question '+varCount+': </label><input name="question['+varCount+']" id="question'+varCount+'" size="15"><label for="choice'+varCount+'"> Choice </label><input name="choice['+varCount+']" id="choice'+varCount+'" size="15" style="margin-right: 20px;"></p>');
  })


});



