import 'jquery-sortable/source/js/jquery-sortable';

// set default wide settings for sweetalerts
export default function (controller) {
  $("ol.sortable-animated").sortable({
    group: 'sortable-animated',
    pullPlaceholder: false,
    handle: '.anchor',

    // animation on drop
    onDrop: function  ($item, container, _super) {

      // Calculate the order of the list items
      let list_items = $(container.el).find('[data-toggle="position"]')
      _.each(list_items, (input, index) => {
        $(input).val(index);
      });

      _super($item, container);
    },
    onDragStart: function ($item, container, _super) {
      if(!container.options.drop)
        $item.clone().insertAfter($item);
      _super($item, container);
    },
    onDrag: function ($item, position) {
    }
  });

}
