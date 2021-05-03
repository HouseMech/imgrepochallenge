
$(document).on('turbolinks:load', function() {
  if ($("#image_tag_list")) {
    console.log("setting up select2");
    var $element = $('#image_tag_list');
    if ($element.length > 0) {
      var tags = $element.data('tags');
      $element.select2({
        'width':'resolve',
        placeholder: "Add Tags",
        tags: true,
        tokenSeparators: [',', ' '],
        allowClear: true,
        data: tags,
      });
    }
  }
});
