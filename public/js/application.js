$(document).ready(function() {

  varCount = 0;

  $('#addQuestion').on('click', function(e) {
    e.preventDefault();
    varCount++;

    $(this).before('<p><label for="question'+ varCount + '">Question ' + varCount+ ': </label><input name="question['+ varCount + ']" id="question' + varCount + '"><label for="option'+ varCount + '"> Options </label><input name="option[' + varCount + ']" id="option' + varCount + '"></p>');
  });
});



