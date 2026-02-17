class User < SharedApplicationRecord
  before_validation :generate_device_token, on: :create
  validates :device_token, presence: true, uniqueness: true
  after_create :provision_tenant

  private

  def generate_device_token
    self.device_token ||= SecureRandom.urlsafe_base64(32)
  end

  def provision_tenant
    TenantProvisioner.create(tenant_name)
  end
  
  def tenant_name
    "user_#{id}"
  end

end
