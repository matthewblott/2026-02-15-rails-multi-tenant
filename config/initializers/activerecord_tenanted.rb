Rails.application.config.active_record_tenanted.tenant_resolver = ->(request) {
  # Extract tenant from subdomain, domain, or however you identify tenants
  request.subdomain.presence || "default"
}
