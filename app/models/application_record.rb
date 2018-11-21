class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def whenever
    puts "wheneverです"
  end
end
