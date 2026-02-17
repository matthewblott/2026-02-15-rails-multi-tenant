class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  # tenanted :tenant
  tenanted
end
