$(document).on('turbolinks:load', function() {

  $('.parallax').parallax();

  var options = [
    {selector: '#staggered-test', offset: 400, callback: function(el){
      Materialize.showStaggeredList($(el));
    }}
  ];
  Materialize.scrollFire(options);

});
