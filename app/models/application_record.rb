class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  tenanted :primary
  # tenanted
end
