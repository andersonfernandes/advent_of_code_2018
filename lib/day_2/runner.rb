require_relative 'inventory_management'

inventory_management = InventoryManagement.new('inputs/day_2/input')
puts inventory_management.call
