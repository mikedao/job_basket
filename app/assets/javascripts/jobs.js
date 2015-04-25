$(document).ready(function() {
  $(".btn-success").click(function() {
    var id = $(this).parents("tr").attr("id");
    likeJob(id, this);
  });
});

function likeJob(id, button) {
  $.ajax({
    type: "POST",
    url: "/liked_jobs",
    data: {id: id},
    success: function() {
      addedToJobs(button);
    },
    error: function() {
      alert("Job could not be added at this time");
    }
  });
}

function addedToJobs(button) {
  var buttons = $(button).parent("div");
  buttons.parent("td").append("<h5 class='added-job'>Added to My Jobs</h5>");
  buttons.remove();
}
