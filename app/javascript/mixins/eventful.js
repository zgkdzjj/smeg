let debug = function(thing, message) {
  let obj = {
    caller: thing,
    event: message.event,
    eventName: message.eventName,
    target: message.target,
    data: message.data,
    func: message.func
  };
  if (window.debugEvents) {
    return console.log(obj);
  }
};

let Eventful = function() {
  this.on = (event, func) => {
    $(this).on("ev-" + event, function(event, data) {
      let message = {
        event: "on",
        eventName: event.type,
        target: event.target,
        func: func,
        data: data
      };
      debug(this, message);
      func(data, event);
    });
  };
  this.trigger = (event, data) => {
    let message = {
      event: "trigger",
      eventName: "ev-" + event,
      data: data
    };
    debug(this, message);
    $(this).trigger("ev-" + event, data);
  };
  this.emit = (event, data) => {
    let message = {
      event: "emit",
      eventName: "ev-" + event,
      data: data
    };
    debug(this, message);
    $(this).trigger("ev-" + event, data);
  };
};

export default Eventful;
