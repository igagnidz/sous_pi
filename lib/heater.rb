class Heater

include HeaterDriver


  def to_h
  {:id => @id, :set_temperature => @set_temperature, :enabled => @enabled, :enabled_at => @enabled_at }
  end

  def self.all
    (1..4).to_a.map{|h| heaters[h].to_h}
  end

  def self.heaters
    @heaters = @heaters || []
    if @heaters == []
      @heaters = (1..4).to_a.map{ |x| Heater.new(x)}.to_a.unshift(nil)
    end
    @heaters
  end

end
