class Picture < ApplicationRecord

validates :artist, presence: true
validates :title, length: { minimum: 3, maximum: 20 }
validates :url, uniqueness: true, presence: true


  def self.newest_first
  Picture.order("created_at DESC")
  end

  def self.most_recent_five
  Picture.newest_first.limit(5)
  end

  def self.created_before(time)
  Picture.where("created_at < ?", time)
  end

  def self.pictures_created_in_year(year)
    if year != nil
      year = year.to_i
    dt = DateTime.new(year)
    start_date = dt.beginning_of_year
    end_date = dt.end_of_year
    Picture.where("created_at >= ? and created_at <= ?", start_date, end_date)
  end
  end

    # start_date = created_at.1.year.ago
    # end_date = year + 1
    # Picture.where("created_at >= :start_date AND created_at <= :end_date"

end
