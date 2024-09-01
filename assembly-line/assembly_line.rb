class AssemblyLine
  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    base_production = 221 * @speed
    success_rate = case @speed
                   when 1..4
                     1.0
                   when 5..8
                     0.9
                   when 9
                     0.8
                   when 10
                     0.77
                   end
    (base_production * success_rate).round(1)
  end

  def working_items_per_minute
    (production_rate_per_hour / 60.0).floor
  end
end
