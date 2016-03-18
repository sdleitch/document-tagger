class Document < ActiveRecord::Base
  def tag_document(params)
    self.interesting += 1 if params['interesting'] == 'on'
    self.funny += 1 if params['funny'] == 'on'
    self.boring += 1 if params['boring'] == 'on'
    self.times_tagged += 1
    self.save!
  end
end
