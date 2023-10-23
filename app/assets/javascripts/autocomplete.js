// For autocomplete data

$(document).on('ready page turbolinks:load', function() {

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
});
