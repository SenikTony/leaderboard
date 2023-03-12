class EuropeRecord < RegionRecordBase
  self.abstract_class = true

  connects_to database: { writing: :europe_db }
end
