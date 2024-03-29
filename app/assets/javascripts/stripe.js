  Stripe.setPublishableKey('sk_test_LIeCBTv3nCs4I35yzMthkk5f');

  jQuery(function($) {
    $('.new-payment').submit(function(event) {
      var $form = $(this);

      // Disable the submit button to prevent repeated clicks
      $form.find('button').prop('disabled', true);

      Stripe.card.createToken($form, stripeResponseHandler);

      // Prevent the form from submitting with the default action
      return false;

    });
  });

  function stripeResponseHandler(status, response) {
    var $form = $('.new-payment');

    if (response.error) {
      alert("got here a")
      // Show the errors on the form
      $form.find('.payment-errors').text(response.error.message);
      $form.find('button').prop('disabled', false);
    } else {
      // response contains id and card, which contains additional card details
      var token = response.id;

      // Insert the token into the form so it gets submitted to the server
      $form.append($('<input type="hidden" name="stripeToken" />').val(token));
      // and submit
      $form.get(0).submit();

    }
  };
