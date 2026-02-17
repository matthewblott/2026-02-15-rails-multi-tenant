class TenantProvisioner
  def self.create(tenant_name)
    # system("ARTENANT=#{tenant_name} rails db:tenant")
    # system("ARTENANT=#{tenant_name} rails db:migrate")
    
    exists = ApplicationRecord.tenant_exist?(tenant_name)

    unless exists
      ApplicationRecord.create_tenant(tenant_name)
    end

  end

end
