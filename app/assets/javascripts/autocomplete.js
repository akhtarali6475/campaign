// For autocomplete data

function campaignAutocomplete(){
  $('.custom-select-campaign').select2({
    minimumInputLength: 3,
    ajax: {
      url: '/campaigns',
      dataType: "json",
      processResults: function(data, page) {
        return {
          results: $.map( data, function(result, i) {
            return { id: result.id, text: result.name }
          })
        }
      }
    }
  });
}

function contactAutocomplete(){
  $('.custom-select-contact').select2({
    minimumInputLength: 3,
    ajax: {
      url: '/contacts',
      dataType: "json",
      processResults: function(data, page) {
        return {
          results: $.map( data, function(result, i) {
            return { id: result.id, text: result.email }
          })
        }
      }
    }
  });
}

function transactionAutocomplete(){
  $('.custom-select-transaction').select2({
    minimumInputLength: 3,
    ajax: {
      url: '/transactions',
      dataType: "json",
      processResults: function(data, page) {
        return {
          results: $.map( data, function(result, i) {
            return { id: result.id, text: result.description }
          })
        }
      }
    }
  });
}

$(document).on('ready page turbolinks:load', function() {
  campaignAutocomplete();
  contactAutocomplete();
  transactionAutocomplete();
});
