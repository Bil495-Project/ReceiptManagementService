class Receipt < ApplicationRecord
  has_one_attached :receipt_image
=begin
  def self.search(search)

    if search
      search_length = search.split.length
      find(:all, :conditions => [(['receipt_tag_id LIKE ?'] * search_length).join(' AND ')] + search.split.map { |receipt_tag_id| "%#{receipt_tag_id}%" })
    else
      find(:all)
    end

  end
=end
def self.search(search)
  if search
    #search = search.downcase
    # receipt = Receipt.find_by_location(search)
    receipt = Receipt.where( 'location LIKE ?', "%#{search}%" )
    #receipt = Receipt.where(['location LIKE ? OR date LIKE ?', "%#{search}%", "%#{search}%"])
    if receipt
      self.where(fatura_id: receipt)
    else
      Receipt.all
    end
  else
    Receipt.all
  end
end
end
