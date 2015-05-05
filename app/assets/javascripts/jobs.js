$(document).ready(function() {
  $(".btn-success").click(function() {
    var id = $(this).parents("li").attr("id");
    likeJob(id, this);
  });
  $(".btn-danger").click(function() {
    var id = $(this).parents("li").attr("id");
    hideJob(id, this);
  });
});

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
  removeRow(button);
  flashMessage("Added to My Jobs");
}

function addedToHiddenJobs(button) {
  removeRow(button);
  flashMessage("Successfully Removed");
}

function flashMessage(message) {
  $(".flash-container").show().addClass("alert-success")
  .text(message);
  setTimeout(function(){
    $(".flash-container").fadeOut();
  }, 1000);
}

function removeRow(button) {
  $(button).parent("div").parent("div").parent("li").remove();
}
