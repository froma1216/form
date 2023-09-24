class EFrontierAll < ApplicationRecord
  def self.search(name, lap)
    column_name = "lap#{lap}_flag"
    query_string = "name LIKE ? AND #{column_name} = ?"
    where(query_string, "%#{name}%", 1)
  end
end
