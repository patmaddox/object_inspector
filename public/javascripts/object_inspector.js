var ObjectInspector = {'showHalos': false};

function showHalos() {
  console.debug('showing halos');
  jQuery('.inspect').prepend(jQuery('#oi-templates .oi-halo').clone());
  jQuery('.oi-halo-title').text(function(index, oldText) {
    return jQuery(this).parents('.inspect').attr('id');
  });
}

function removeHalos() {
  console.debug('removing halos');
  jQuery('.inspect .oi-halo').remove();
} 

function toggleHalos () {
  ObjectInspector.showHalos = !ObjectInspector.showHalos;
  if(ObjectInspector.showHalos) {
    showHalos();
  } else {
    removeHalos();
  }
}

function openInspector(id) {
  console.debug('inspecting ' + id);
  window.open('http://localhost:3000/inspected_objects/' + id, 'inspector_' + id,
             'width=650,height=600');
}

jQuery(function() {
  jQuery('.oi-interactive form')
    .bind('ajax:success', function(event, data, status, xhr) {
      console.debug('ajax success');
      var form = jQuery(this);
      console.debug(data);
      form.siblings('textarea').text(data);
      form[0].reset();
    })
    .bind('ajax:error', function(event, data, status, xhr) {
      console.debug('ajax failure :(');
      var form = jQuery(this);
      var data = eval(data.responseText);
    });

  // TODO: make these use livequery
  jQuery('#oi-devbar .oi-halos').click(toggleHalos);

  jQuery('.oi-halo-inspector a').click(function(event) {
    openInspector(jQuery(this).parents('.oi-halo').parents('.inspect').attr('id'));
    event.stopImmediatePropagation();
  });
});
