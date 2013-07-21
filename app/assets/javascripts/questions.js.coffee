# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready -> 
    window.HideOrShow = (ele) ->
        icon = $("#a_"+ele).contents().attr('class')
        $("#q_"+ele).toggle ->
            if icon == "icon-minus"
                $("#a_"+ele).contents().attr("class", 'icon-plus')
                $("#a_"+ele).contents().attr("title", 'Show')
            else
               $("#a_"+ele).contents().attr("class", 'icon-minus');
               $("#a_"+ele).contents().attr("title", 'Hide');
