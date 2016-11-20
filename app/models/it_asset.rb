require 'securerandom'

class ItAsset < ActiveRecord::Base
  before_create :randomize_id

  private

  #this method makes the unique identifier 10 alphanumeric characters
  def randomize_id
    begin
      self.id = SecureRandom.hex 5
    end while ItAsset.where(id: self.id).exists?
  end
end
