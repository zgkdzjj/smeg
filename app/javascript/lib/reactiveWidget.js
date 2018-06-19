import Widget from "lib/widget";

class ReactiveWidget extends Widget {

  setState(data) {
    if (this.state == undefined) {
      this.prev_state = data;
    } else {
      this.prev_state = this.state;
    }
    this.state = data;
    this.render();
  }

  // Will merge current dataset and call setState
  //
  mergeAndSetState(data) {
    this.prev_state = this.state
    _.merge(this.state, data)
    this.render();
  }

  rebindEvents() {
    // Remove events from OFF
    this.root.off();

    // Handle removing all events from child elements
    // TODO

    // Call rebind events
    this.bind();
  }

  destroy() {
    // Remove events from OFF
    this.root.off();

    // Handle removing all events from child elements
    // TODO

    // Remove widget from view
    this.root.remove();
  }
}

export default ReactiveWidget;
