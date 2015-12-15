actions :create
default_action :create

attribute :name, kind_of: String, name_attribute: true
attribute :bind_ip, kind_of: String, required: true
attribute :bind_port, kind_of: Fixnum, required: true
attribute :default_backend, kind_of: String, required: true

attr_accessor :exists
