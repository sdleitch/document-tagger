class Document < ActiveRecord::Base
  def tag_document(params)
    self.interesting += 1 if params['interesting'] == 'on'
    self.funny += 1 if params['funny'] == 'on'
    self.boring += 1 if params['boring'] == 'on'
    self.times_tagged += 1
    self.save!
  end

  def self.pick_document(tagged_docs)
    ### TO-DO: THE BELOW DOCUMENTATION IS NOT YET IMPLEMENTED ###
    # This method will be used to weight the chance a Document will be selected,
    # skewing to those which have been tagged fewer times.
    #
    # If new Documents are added later, after tagging has begun,
    # those new Documents will have a higher probability of being
    # shown to the user. They will eventually be tagged ~ as older Documents.
    documents = self.all
    doc = documents.sample
    document_ids = documents.map { |doc| doc.id }
    if !tagged_docs.include?(doc.id) || (document_ids - tagged_docs).empty?
      return doc
    else
      self.pick_document(tagged_docs)
    end
  end
end
