class Comment < ActiveRecord::Base
  acts_as_xlsx
  belongs_to :article
end
