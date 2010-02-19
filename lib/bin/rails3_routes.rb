# This binary script introspects a Rails 3 application to grab the route that matches 
# the passed in controller and action. If we find a match we spit out the path used to get routed there.
project_dir = ARGV.shift # First arg is absolute path to user's rails app
require project_dir + '/config/application' # Load the user's application

controller_name = ARGV.shift # Second arg is the controller name
action_name = ARGV.shift # Third arg is the action name

# Load the user's Rails application
Rails::Application.initialize!
Rails::Application.reload_routes! # Load the routes
all_routes = Rails::Application.routes.routes
routes = all_routes.collect do |route|
  name = ActionController::Routing::Routes.named_routes.routes.index(route).to_s
  {:name => name, :verb => route.verb.to_s, :path => route.path, :reqs => route.requirements}
end
routes.reject!{ |r| r[:path] == "/rails/info/properties" } # skip the route if it's internal info route
# Find the path that matches our controller and action
routes.reject!{ |r| r[:reqs][:controller] != controller_name or r[:reqs][:action] != action_name }
exit 0 if routes.empty? # No matches
puts routes.first[:path] # Found at least one match, return the url path