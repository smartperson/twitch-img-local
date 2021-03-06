function fetchLatestImg() {
  $.getJSON("/latest.json", function(data) {
    console.log('loaded new img data');
    if ($('#latest-img').attr('src') != data.image) {
      $('#latest-img').attr('src', data.image);
      console.log('changing img source to update');
    }
  });
}

$(document).ready(function() {
  if ($('#latest-img').length) {
    fetchLatestImg();
    window.setInterval(fetchLatestImg, 30000);
  }
  $('#img-file-upload').change(function() {
    $("#status-box").html("processing…");
    this.closest('form').submit();
    $("input").prop("disabled", true);
  });
});
