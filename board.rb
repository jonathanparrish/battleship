require './ship'
class Board
  def initialize
    @ship
    @fleet = []
    @shots_fired = []
  end

  def has_ship_on?(x_axis, y_axis)
    ship_on = false
    @fleet.each do |ship|
      if ship.covers?(x_axis, y_axis)
        ship_on = true
      end
    end
      return ship_on
  end
  def place_ship(ship, x_axis, y_axis, across)
    ship.place(x_axis, y_axis, across)
    conflict = false
    @fleet.each do |ship|
      if ship.overlaps_with?(ship)
        conflict = true
      end
    end
    if !conflict
      @fleet << ship
      return true
    else
      return false
    end
  end
  def fire_at(x_axis, y_axis)
    hit = false
    attack = [x_axis, y_axis]
    @fleet.each do |ship|
      if ship.covers?(x_axis, y_axis)
        hit = true
      end
    end
    if !hit
    @shots_fired << attack
      return false
    else
    @shots_fired << attack
      return true
    end
  end
end
# @shots_fired.each do |ship|
#   if attack.covers?(x_axis, y_axis)
#   return true
#   end
# end
