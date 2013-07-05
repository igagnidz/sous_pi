class Heater
  include HeaterDriver

  def to_h
  {:id => @id, :set_temperature => set_temperature, :temperature => temperature, :enabled => enabled, :enabled_at => enabled_at }
  end
end
