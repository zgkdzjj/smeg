// Can put common controller stuff in here :D
import Raven from "raven-js";

import initializers from '../initializers/**/*.js';

let runInitializers = function () {
  if (initializers == undefined) { return };

  initializers.forEach((initializer) => {
    return initializer.default(this);
  });
};

let Controller = function () {
  this.init = () => {
    try {
      runInitializers.call(this);
      this.call();
    } catch(e) {
      if (gon.env == "development") {
        console.error(e.stack)
      } else {
        Raven.captureException(e);
      }
    }
  };
};

export default Controller;
