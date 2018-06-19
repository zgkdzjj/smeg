require 'roo'

xlsx = Roo::Spreadsheet.open('db/seeds_data/171026_MegasheetBuiltInCookingSample.xlsx')

xlsx.info

# First Sheet
sheet = xlsx.sheet(0)

# Minus 1 as first column is fields
no_of_columns = sheet.last_column

(2..no_of_columns).each do |c|

  col = sheet.column(c)

  # Model Number
  p = ClassicOven.find_or_initialize_by model_number: col[1]


  p.description = col[2]
  p.aesthetic = col[3]

  p.feature_1 = col[4]
  p.feature_2 = col[5]
  p.feature_3 = col[6]
  p.feature_4 = col[7]
  p.feature_5 = col[8]

  p.dimensions = col[9]
  p.finish = col[10]

  p.supplied_accessories = col[20]
  p.optional_accessories = col[21]

  p.safety = col[22]
  p.power = col[23]
  p.warranty = col[24]
  p.status = col[25] == "Active" ? true : false

  p.total_functions = col[11]
  # p.display = col[12]
  p.capacity = col[13]
  p.cooking_levels = col[14]
  p.thermostat = col[15]
  p.installation = col[16]
  p.programmability = col[17]
  p.cleaning = col[18]
  p.lighting = col[19]

  # Loop till last row and assign
  # function_list: [:string, array: true, default: []]
  p.save
end
