set :application, ""
set :domain,      "vanutsteen.nl"
set :use_sudo,    false
set :deploy_to,   "/home/#{domain}"
set :repository, "."
set :scm, :none
set :deploy_via, :copy
set :copy_exclude, [".git", "db", "nbproject", "public/images/cars"]
set :user, "suP3RsecR3tUzer"

role :app, domain
role :web, domain
role :db,  domain, :primary => true

namespace :deploy do
  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end
end
