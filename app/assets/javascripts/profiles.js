$(document).on('turbolinks:load', function() {

    console.log("init triggered profiles");

  $('select').material_select();

  // the "href" attribute of the modal trigger must specify the modal ID that wants to be triggered
  $('.modal').modal();

  // Function for displaying image in modal before upload

    $(document).on('change','#file-input', function(event) {
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
      console.log("sollte wechseln");
      //Unhide the Upload button
      $('#uploadPicture').css("display", "block");
      //Hide the change picture button
      $('#changeProfile').css("display", "none");
    });


  // Function for select a gallery picture as new Profile pic


    $(document).on('click','.masonry-item-icon', function(event){
        var imgsrc;
        var id;

        imgsrc = $(this).next().attr('src');
        id = $(this).next().attr('photoId');

        var img = new Image();
        img.src = imgsrc;
        $('#imgPreview').html(img);
        $('#imgPreview').children().addClass("fit-image");
        $('#imgPreview').attr('photoId', id);
        // Unhide the change picture button
        $('#changeProfile').css("display", "block");
        // hide the upload button
        $('#uploadPicture').css("display", "none");
    })


  // Ajax call to change the current profile Picture

    $(document).on('click','#changeProfile',function(event){
      var id;
      id = $('#imgPreview').attr('photoId');
      alert("ajax start");
      $.ajax({
        type: "POST",
        dataType: "json",
        contentType: "application/json",
        url: "/change_profile_pic",
        data: JSON.stringify({ photoId: id}),
        success: function(result){
          console.log('erfolgreich gesendet');
          //reload page to see changes
          location.reload();
        },
        error: function(){
          console.log('error');
        }

      })
    })


});

$(document).on("turbolinks:before-cache", function() {

  // Unhide the change picture button
  $('#changeProfile').css("display", "none");
  // hide the upload button
  $('#uploadPicture').css("display", "none");

})
