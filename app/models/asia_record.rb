class AsiaRecord < RegionRecordBase
  self.abstract_class = true

  connects_to database: { writing: :asia_db }
end
