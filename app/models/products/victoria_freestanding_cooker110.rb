class VictoriaFreestandingCooker110 < Product

  jsonb_accessor :data,
    installation: :string,
    device_display: :string,
    gas_hob: :string,
    capacity: :string,
    gas_input: :string,
    safety: :string,
    supplied_accessories: [:string, array: true, default: []],

    top_right_main_oven: :string,
    capacity_main_oven: :string,
    total_functions_main_oven: :string,
    door_main_oven: :string,
    door_glass_main_oven: :string,
    cooking_levels_main_oven: :string,
    thermostat_main_oven: :string,
    programmability_main_oven: [:string, array: true, default: []],
    cleaning_main_oven: :string,
    lighting_main_oven: :string,
    supplied_accessories_main_oven: [:string, array: true, default: []],

    aux_oven_left: :string,
    capacity_oven_left: :string,
    total_functions_oven_left: :string,
    door_oven_left: :string,
    cooking_levels_oven_left: :string,
    thermostat_oven_left: :string,
    programmability_oven_left: [:string, array: true, default: []],
    cleaning_oven_left: :string,
    lighting_oven_left: :string,
    safety_oven_left: :string,
    supplied_accessories_oven_left: [:string, array: true, default: []],

    grill: :string,
    capacity_grill: :string,
    total_functions_grill: :string,
    cooking_levels_grill: :string,
    thermostat_grill: :string,
    programmability_grill: [:string, array: true, default: []],
    cleaning_grill: :string,
    lighting_grill: :string,
    safety_grill: :string,
    supplied_accessories_grill: [:string, array: true, default: []],

    function_list: [:string, array: true, default: []]

end
