$(document).ready(function() {
  $(".btn-success").click(function() {
    var id = $(this).parents("tr").attr("id");
    likeJob(id, this);
  });
  $(".btn-danger").click(function() {
    var id = $(this).parents("tr").attr("id");
    hideJob(id, this);
  });

  $("btn-danger.unlike").click(function() {
    var id = $(this).parents("tr").attr("id")
    unlikeJob(id, this);
  });
});

function unlikeJob(id, button) {
  $.ajax({
    type: "DELETE",
    url: "/liked_jobs"+ id,
    data: {id: id},
    success: function() {
     removedFromLikedJobs(button);
    },
    error: function() {
      alert("Job could not be removed at this time");
    }
  });
}

function hideJob(id, button) {
  $.ajax({
    type: "POST",
    url: "/hidden_jobs",
    data: {id: id},
    success: function() {
      addedToHiddenJobs(button);
    },
    error: function() {
      alert("Job could not be added at this time");
    }
  });
}

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

function addedToHiddenJobs(button) {
  $(button).parent("div").parent("td").parent("tr").remove();
  $(".flash-container").show().addClass("alert-success")
    .text("Successfully Removed");
  setTimeout(function(){
    $(".flash-container").fadeOut();
  }, 1000);
}

function removedFromLikedJobs(button) {
  $(button).parent("div").parent("td").parent("tr").remove();
  $(".flash-container").show().addClass("alert-success")
    .text("Successfully Removed");
    setTimeout(function() {
      $(".flash-container").fadeOut();
    }, 1000);
}
