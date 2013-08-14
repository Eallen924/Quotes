function displayQuote(startTime) {
   // log time difference between quote calls to verify the correct interval length
   console.log("Waited " + (new Date() - startTime));

   // ajax request to get new quote
  $.get('/quote', function(returnData){
    var $rotator = $('#rotating-item-wrapper');
    $rotator.fadeOut(1500, function() {
      $rotator.html(returnData).hide().fadeIn(1500);
    });

    var quote = $(returnData).find('.quote_body').text();
    var quoteChars = quote.length;
    var quoteTime = quoteChars * 120

    if (quoteTime > 25000){
      quoteTime = 25000
    } else if (quoteTime < 8000) {
      quoteTime = 8000
    } else {
      quoteTime = quoteChars * 120
    }

    console.log("This quote has " + quoteChars + " characters and will be displayed for " + quoteTime/1000 + "seconds");

    var startTime = new Date();
    // recursively display quotes
    setTimeout(function() { displayQuote(startTime) }, quoteTime);
  });
};

$(document).ready(function(){
  // initialize first timeout with a 10 second interval
  var quoteTime = 10000;
  // initialize a start time to verify how long it takes between quotes
  var startTime = new Date();
  setTimeout(function() { displayQuote(startTime) }, quoteTime);
});







































// function displayQuote(quoteObject) {
//   console.log(quoteObject);
//     var quoteHtml = '<div class="rotating-item"><p class="quote_body">"'+ quoteObject.body +'"</p><p class="quote_author"> - ' + quoteObject.author +' - </p></div>'
//     var $rotator = $('#rotating-item-wrapper');
//     $rotator.fadeOut(1500, function() {
//     $rotator.html(quoteHtml).fadeIn(1500);
//     });

//   $.get('/quote', function(returnData){
//     console.log(returnData.body);
//     console.log(returnData.author);

//     var quoteChars = returnData.body.length;
//     console.log(quoteChars);
//     var quoteTime = quoteChars * 120
//     console.log(quoteTime);
//     setTimeout(displayQuote(returnData), quoteTime);
//   });
// };

// $(document).ready(function(){
//   $.get('/quote', function(returnData){
//     console.log(returnData.body);
//     console.log(returnData.author);
//     var quoteChars = returnData.body.length;
//     console.log(quoteChars);
//     var quoteTime = quoteChars * 120
//     console.log(quoteTime);

//     setTimeout(displayQuote(returnData), quoteTime);
//   });
// });