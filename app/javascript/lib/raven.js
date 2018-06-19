import Raven from "raven-js";

function configureRaven() {
  let env = gon.env;
  let env_vars = gon.env_vars;

  let config = {
    release:      env_vars.version,
    environment:  "production",
    debug:        env == "development"
  }

  if ((env == "development") || (env == "staging")) {
    console.log(`Raven config`)
    console.log(config)
  };

  Raven.config(env_vars.raven_dsn, config).install();
}

export default configureRaven;
