$(document).on('turbolinks:load', function() {

  console.log("init triggered gallery");
  // Function for displaying filename before upload



  $(document).on('click','#uploadButton', function(event){
    //Unhide the preloader
    $('#preloader').show();

  });


  // Function for displaying image in modal before upload

  $(document).on('change','#gallery-file-input', function(event) {

    var files = event.target.files;
    var image = files[0];

    $('#file-name').html(image.name);

    //Unhide the Upload button
    //$('#uploadButton').parent().show();

    $('#uploadButton').css("display", "block");

  });


});

$(document).on("turbolinks:before-cache", function() {
  console.log("before cache");

  $('#uploadButton').css("display", "none");

  $('#file-name').html("");
})
