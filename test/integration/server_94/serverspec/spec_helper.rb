require "serverspec"

set :backend, :exec

def cmd_role_exists(role)
  "sudo -u postgres " <<
    %(psql -c "SELECT rolname FROM pg_roles WHERE rolname='#{role}'") <<
    " | grep #{role}"
end

def cmd_database_exists(database)
  "sudo -u postgres psql -l | grep #{database}"
end

def cmd_extension_exists(database, extension)
  %(sudo -u postgres psql -c "\\dx" #{database} | grep #{extension})
end
