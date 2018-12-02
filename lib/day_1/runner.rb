require_relative 'chronal_calibration'

chronal_calibration = ChronalCalibration.new('inputs/day_1/input')
puts chronal_calibration.call
