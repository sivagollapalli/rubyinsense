# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ -> 
  $('.answer').tooltip();

  window.HideOrShow = (ele) ->
    icon = $("#a_"+ele).contents().attr('class')
    $("#q_"+ele).toggle ->
    if icon == "icon-chevron-up"
      $("#a_"+ele).contents().attr("class", 'icon-chevron-down')
      $("#a_"+ele).contents().attr("title", 'Show')
    else
      $("#a_"+ele).contents().attr("class", 'icon-chevron-up');
      $("#a_"+ele).contents().attr("title", 'Hide');

  if typeof questions_score != 'undefined'
    $(questions_score).each (index) ->
        $('#question-rating-'+this[0]).raty({ readOnly: true, score: this[1] });
    


  #setting correct score is still be done
  $(".rating-block").raty click: (score, evt) ->
    alert "ID: " + $(this).attr("id") + "\nscore: " + score + "\nevent: " + evt


  

