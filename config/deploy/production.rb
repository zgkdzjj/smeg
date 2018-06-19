set :rails_env,   "production"

# This is the public IP, if we deploy through VPN we will have to change this
# set :servers,     ["202.8.8.238"]
# These are the internal IP addresses if you are connected via VPN
set :servers,     ["119.225.67.213"]
# Changed to master as we are deploying master to the staging server for pre-live testing
set :branch,      "master"
