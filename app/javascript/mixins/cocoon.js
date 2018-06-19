import initializers from '../initializers/input_components/*.js';

let CocoonLoader = function() {
  $('body').on('cocoon:after-insert', (e, item) => {
    if (initializers == undefined) { return };

    initializers.forEach((initializer) => {
      return initializer.default(this);
    });
  })
};

export default CocoonLoader;
