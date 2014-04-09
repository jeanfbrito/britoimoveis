module AreaHelper
  HECTARE = 10000
  def calculate_area(area)
    unless area.nil?
      if area > HECTARE
        result = (area.to_f / HECTARE)
        result == 1 ? "#{result} hectare" : "#{result} hectares"
      else
        "#{area}m2"
      end
    end
  end
end