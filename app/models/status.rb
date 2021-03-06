class Status
  attr_accessor :id, :name

  def initialize(options = {})
    options = options.symbolize_keys
    @id, @name = options[:id], options[:name]
  end
  
  def symbol
    @name.to_s.downcase.intern
  end
  
  def self.[](value)
    @@statuses.find { |status| status.symbol == value.to_s.downcase.intern }
  end
  
  def self.find(id)
    @@statuses.find { |status| status.id.to_s == id.to_s }
  end
  
  def self.find_all
    @@statuses.dup
  end
  
  @@statuses = [
    Status.new(:id => 1,   :name => I18n.t('status.draft')    ),
    Status.new(:id => 50,  :name => I18n.t('status.reviewed') ),
    Status.new(:id => 100, :name => I18n.t('status.published') ),
    Status.new(:id => 101, :name => I18n.t('status.hidden')   )
  ]
end
