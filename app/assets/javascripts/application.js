// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

// This identifies our web app in the createToken call below
Stripe.setPublishableKey('pk_test_Lxxak5igPVRUJqs2Nro9e83E');
 
// This function adds the Stripe token to the form as a hidden field so we
// can access it in our server code. If there's an error in the payment
// details it displays the errors in the "payment-errors" class
var stripeResponseHandler = function(status, response) {
  var $form = $('#payment_form');
  if (response.error) {
    // Show the errors on the form
    $form.find('.payment-errors').text(response.error.message);
    $form.find('#bill-me').prop('disabled', false);
    $form.find('.payment-errors').html('<div class="alert alert-error alert-block"><button type="button" class="close" data-dismiss="alert">&times;</button><h4>We could not complete your request.</h4>' + response.error.message + '</div>');
  } else {
    // Get the Stipe token
    var token = response.id;
    // Insert the token into the form so it gets submitted to the server
    $form.append($('<input type="hidden" name="stripe_token" />').val(token));
    // Re-submit the form to our server
    $form.get(0).submit();
  }
};
 
// This function intercepts the form submission, calls Stripe to get a
// token and then calls the stripeResponseHandler() function to complete
// the submission.
jQuery(function($) {
  $('#payment_form').submit(function(e) {
    var $form = $(this);
    // Disable the submit button to prevent repeated clicks
    $form.find('#bill-me').prop('disabled', true);
    Stripe.createToken($form, stripeResponseHandler);
    // Prevent the form from submitting with the default action
    return false;
  });
});


