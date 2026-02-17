class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  tenanted :mytenant
  # tenanted
end
