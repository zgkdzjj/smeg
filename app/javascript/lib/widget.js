import Eventful from "mixins/eventful";
import Colorful from "mixins/colorful"

class Widget {
  constructor(root, opts = {}) {
    Eventful.call(this);
    Colorful.call(this);
    this.root = root;

    for (let key in opts) {
      this[key] = opts[key];
    }

    if (this.bind) {
      this.bind();
    }
  }

  // replaceHtml
  //
  // replaces the DOM elements and pointer with new HTML
  // if a bind method exists rebind
  replaceHtml(html, opts = {}) {
    let tree = $(html);
    this.root.replaceWith(tree);
    this.root = tree;
    if (this.bind && !opts.dontBind) {
      this.bind();
    }
    this.emit('htmlReplaced');
  }

  numberToCurrency(number) {
    var currencyFormat = new Intl.NumberFormat("en-AUD", { style: "currency", currency: "USD" })
    return currencyFormat.format(number)
  }
}

export default Widget;
