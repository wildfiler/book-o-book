class Author < ActiveRecord::Base
  has_many :books

  def last_5_books
    ['http://files2.adme.ru/files/news/part_41/410605/4537355-R3L8T8D-600-031.jpg',
     'http://files5.adme.ru/files/news/part_41/410605/4537805-R3L8T8D-600-4173383.jpg',
     'http://files6.adme.ru/files/news/part_41/410605/4537905-R3L8T8D-600-8112228.jpg',
     'http://files8.adme.ru/files/news/part_41/410605/4538005-R3L8T8D-600-9654148.jpg',
     'http://www.cornellpubs.com/Images2/Ideal%201949%20no36.jpg'].shuffle
  end
end
