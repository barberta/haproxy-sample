if defined?(ChefSpec)
  ChefSpec::Runner.define_runner_method(:haproxy_sample_frontend)

  def create_haproxy_sample_frontend(resource)
    ChefSpec::Matchers::ResourceMatcher.new(:haproxy_sample_frontend, :create, resource)
  end

  ChefSpec::Runner.define_runner_method(:haproxy_sample_backend)

  def create_haproxy_sample_backend(resource)
    ChefSpec::Matchers::ResourceMatcher.new(:haproxy_sample_backend, :create, resource)
  end
end
