class FreestandingCooker120 < Product

  jsonb_accessor :data,
    device_display: :string,
    description_2: :string,
    hob: :string,
    capacity_hob: [:string, array: true, default: []],
    barbecue: :string,
    safety_hob: :string,
    gas_input: :string,
    installation: :string,
    supplied_accessories_hob: [:string, array: true, default: []],

    main_oven_left: :string,
    capacity_main_oven: [:string, array: true, default: []],
    total_functions_main_oven: [:string, array: true, default: []],
    cooking_levels_main_oven: :string,
    thermostat_main_oven: :string,
    programmability_main_oven: [:string, array: true, default: []],
    cleaning_main_oven: :string,
    lighting_main_oven: :string,
    safety_main_oven: :string,
    supplied_accessories_main_oven: [:string, array: true, default: []],

    aux_oven_right: :string,
    capacity_aux_oven: [:string, array: true, default: []],
    total_functions_aux_oven: [:string, array: true, default: []],
    cooking_levels_aux_oven: :string,
    thermostat_aux_oven: :string,
    programmability_aux_oven: [:string, array: true, default: []],
    cleaning_aux_oven: :string,
    lighting_aux_oven: :string,
    safety_aux_oven: :string,
    supplied_accessories_aux_oven: [:string, array: true, default: []]

end