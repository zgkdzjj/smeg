var session = {};

function loadSession() {
  let user = gon.user;
  let env = gon.env;
  let env_vars = gon.env_vars;

  session = {
    user: user,
    isProduction: function() {
      return env == "production";
    },
    isDevelopment: function() {
      return env == "development";
    },
    isTest: function() {
      return env == "test";
    }
  };
};

export { session, loadSession };
