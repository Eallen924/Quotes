$(document).ready(function() { //start after HTML, images have loaded
  var InfiniteRotator = {
    init: function() {
      //interval between items (in milliseconds)
      var itemInterval = 10000;
      //set current item
      var getCurrentItem = function() {
        $.post('/quote/get', function(newQuote) {
          // console.log(newQuote)
          $('#rotating-item-wrapper').append(newQuote);
        })
      };

      //show first item

      //loop through the items
      var infiniteLoop = setInterval(function(){
        $('#rotating-item-wrapper').children(".rotating-item").remove();
        $('#rotating-item-wrapper').html(getCurrentItem());
      }, itemInterval);
    }
  };
  InfiniteRotator.init();
});
