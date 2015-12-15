action :create do
  populate_frontend
  new_resource.updated_by_last_action(false)
end

def populate_frontend
  node.default['haproxy']['frontends'] << make_frontend
end

def make_frontend
  {
    'name' => new_resource.name,
    'bind_ip' => new_resource.bind_ip,
    'bind_port' => new_resource.bind_port,
    'default_backend' => new_resource.default_backend
  }
end
