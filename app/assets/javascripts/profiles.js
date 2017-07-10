$(document).on('turbolinks:load', function() {

  $('select').material_select();

  // the "href" attribute of the modal trigger must specify the modal ID that wants to be triggered
  $('.modal').modal();

  // Function for displaying image in modal before upload
  $(function() {
    $('#file-input').on('change', function(event) {
      var files = event.target.files;
      var image = files[0]
      var reader = new FileReader();
      reader.onload = function(file) {
        var img = new Image();
        img.src = file.target.result;
        $('#imgPreview').html(img);
        $('#imgPreview').children().addClass("fit-image");
      }
      reader.readAsDataURL(image);
    });
  });

});
