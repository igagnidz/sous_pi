module HeaterDriver
  attr_reader :id, :enabled, :enabled_at, :set_temperature

  def self.included(base)
    base.extend ClassMethods
  end

  def initialize(id)
    @id=id.to_i
  end

  def temperature
    @set_temperature
  end

  def temperature=(val)
    @set_temperature = val.to_i
  end

  def enabled=(bool)
    @enabled = !!bool
    if bool
      @enabled_at = @enabled_at || Time.now
    else
      @enabled_at = nil
      @temperature = nil
    end
    @enabled
  end

  module ClassMethods
    def [](id)
      raise 'Device not found' unless (1..4).include?(id.to_i)
      Heater.heaters
      if Heater.heaters[id.to_i]
         Heater.heaters[id.to_i]
      else
        Heater.heaters[id.to_i] = Heater.new(id.to_i)
      end
      Heater.heaters[id.to_i]
    end

    def all
      (1..4).to_a.map{|h| heaters[h].to_h}
    end

    def heaters
      @heaters = @heaters || []
      if @heaters == []
        @heaters = (1..4).to_a.map{ |x| Heater.new(x)}.to_a.unshift(nil)
      end
      @heaters
    end
  end
end