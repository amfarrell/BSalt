$(function() {
  //??? is there a convention for this?
  var transfercadet = function transfercadet(cadet_li,into_platoon_ul){
    // Make ajax call after ui element has been moved.
    console.log("transfer " + cadet_li.id + " to "+into_platoon_ul.id)
    $.ajax("cadets/update/"+cadet_li.id.split("_")[1], {
      "type": "PUT",
      "data": {"platoon_id":into_platoon_ul.id.split("_")[1]
      }}).success(function(){
        console.log("cadet " + cadet_li.li + " transferred");
      });
  }
  $(".cadetlist").sortable({
      connectWith: ".cadetlist", 
      beforeStop: function beforeStop(event, ui){
        console.log(ui.item.context)
        transfercadet(ui.item.context, ui.item.context.parentNode)
      }
    });
/*  $(".cadet").draggable({
    connectToSortable: "ul.cadetlist",
    helper: "clone"/*,
    start: function(event,ui){
      debugger
    },
  });
*/
  $(".after-cadet-slot").droppable({
    hoverClass: "after-cadet-slot-hovering",
    tolerance: "touch"
  });
});
