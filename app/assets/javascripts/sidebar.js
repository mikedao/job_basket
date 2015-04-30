$(document).ready(function() {
  function initializeSearchBar() {
    var tags = ["hello"];
    var bar = $("#search-bar");
    bar.keyup(function(){
      $('.search-item').hide().filter(function() {
        var itemText = $(this).text().toLowerCase();
        var searchText = $('#search-bar').val().toLowerCase();
        tags.push(searchText);
        var filterMatch = itemText.indexOf(searchText) != -1;
        return filterMatch;
      }).show();
    });
  }

  function initializeTags() {
    $('div.tags').find('input:checkbox').on('click', function () {
      $('.jobs-table > li').hide();
      if( $('div.tags').find('input:checked').length > 0)
    {
      $('div.tags').find('input:checked').each(function () {
        $('.jobs-table > li.' + $(this).attr('rel')).show();
      });
    }else{
      $('.jobs-table > li').show();
    }
    });
  }

  initializeSearchBar();
  console.log("Search Bar ready");

  initializeTags();
  console.log("Tags ready");
});
