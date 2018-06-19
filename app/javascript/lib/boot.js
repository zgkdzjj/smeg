import loadController           from "lib/controllerLoader"
import { loadSession, session } from "lib/session"

const boot = {
  init: () => {
    loadSession()
    loadController()

    const env = gon.env

    if (env == "development") {
      window.debugEvents = true
    }
  }
}

export default boot
