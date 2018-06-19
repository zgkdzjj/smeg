import Promise          from "bluebird"
import EventfulMixin    from "mixins/eventful"
import ControllerMixin  from "mixins/controller"
import ColorfulMixin    from "mixins/colorful"
import CocoonMixin      from "mixins/cocoon"

const loadController = function() {
  callController(fetchController())
}

// Call the appropriate controller, either one that we've made or the base
const fetchController = function() {
  const controller = resolveController()
  return controller.default
}

const resolveController = function() {
  let railsController = $("body").data("controller")
  let railsAction     = $("body").data("action")

  railsAction = railsAction == "update" ? "edit" : railsAction
  railsAction = railsAction == "create" ? "new" : railsAction

  const specifiedControllerName = `${railsController}/${railsAction}`
  const specifiedNamespace      = resolveNamespace(railsController)

  // Load the controller for the given controller and action, fallback if cannot be required
  let controller

  try {
    controller = require(`../controllers/${specifiedControllerName}`)
  } catch(e) {
    console.warn("Couldn't find specific page controller")
    console.warn(e.stack)
    try {
      controller = require(`../controllers/${specifiedNamespace.controllerName}`)
    } catch(e) {
      console.warn("Couldn't find namespace base controller")
      console.warn(e.stack)
      controller = require(`../controllers/base`)
    }
  }
  return controller
}

const resolveNamespace = function(railsController) {
  const NAMESPACEREGEX          = /(.+)\//g
  const match                   = NAMESPACEREGEX.exec(railsController)
  const namespace               = match == null ? "" : match[1]
  const namespaceControllerName = match == null ? "" : `../controllers/${namespace}/base`

  return {
    match:          match != null,
    namespace:      namespace,
    controllerName: namespaceControllerName
  }
}

// Call the controller with whatever extensions it requires
const callController = function(Controller) {
  const controller = new Controller()

  EventfulMixin.call(controller)
  ControllerMixin.call(controller)
  ColorfulMixin.call(controller)
  CocoonMixin.call(controller)

  controller.root = $("body")
  // controller.modal = new Modal()
  initControllerAfterFetchingScripts(controller)

  window.controller = controller
}

const initControllerAfterFetchingScripts = function(controller) {
  const scripts = controller.scripts ? controller.scripts() : []
  const promises = scripts.map(fetchScript)

  Promise.all(promises).then(() => {
    controller.init()
  }).catch((statuses) => {
    console.warn("Scripts failed to load!")
    console.warn(statuses)

    controller.init()
  })
}

const fetchScript = function(script) {
  return new Promise((resolve, reject) => {
    $.getScript(script)
      .done((data, status, jqXHR) => {
        if (status == "success") {
          resolve(data)
        } else {
          reject(status)
        }
      }).fail((jqXHR, status, exception) => {
        reject(exception)
      })
  })
}

export default loadController
