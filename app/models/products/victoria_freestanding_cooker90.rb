class VictoriaFreestandingCooker90 < Product

  jsonb_accessor :data,
    installation_cooker: :string,
    device_display: :string,
    gas_hob: :string,
    capacity_cooker: :string,
    gas_input: :string,
    safety_cooker: :string,
    supplied_accessories_cooker: [:string, array: true, default: []],

    lower_left_main_oven: :string,
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

    aux_oven_right: :string,
    capacity_oven_right: :string,
    total_functions_oven_right: :string,
    door_oven_right: :string,
    cooking_levels_oven_right: :string,
    thermostat_oven_right: :string,
    programmability_oven_right: [:string, array: true, default: []],
    cleaning_oven_right: :string,
    lighting_oven_right: :string,
    safety_oven_right: :string,
    supplied_accessories_oven_right: [:string, array: true, default: []],

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
