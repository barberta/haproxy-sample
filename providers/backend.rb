action :create do
  populate_backend
  new_resource.updated_by_last_action(false)
end

def populate_backend
  node.default['haproxy']['backends'] << make_backend
end

def make_backend
  {
    'name' => new_resource.name,
    'mode' => new_resource.mode,
    'balance_type' => new_resource.balance_type,
    'backend_options' => new_resource.backend_options,
    'servers' => new_resource.servers
  }
end
