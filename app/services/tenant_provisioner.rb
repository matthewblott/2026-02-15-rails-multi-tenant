class TenantProvisioner
  def self.create(tenant_name)
    system("ARTENANT=#{tenant_name} rails db:tenant")
    system("ARTENANT=#{tenant_name} rails db:migrate")
  end
end
