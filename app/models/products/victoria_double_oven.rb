class VictoriaDoubleOven < Product

  jsonb_accessor :data,
    device_display: :string,
    auto_menus: :string,
    installation: :string,
    main_oven: :string,

    capacity_main_oven: [:string, array: true, default: []],
    total_functions_main_oven: [:string, array: true, default: []],
    door_glass_main_oven: [:string, array: true, default: []],
    cooking_levels_main_oven: :string,
    thermostat_main_oven: :string,
    programmability_main_oven: [:string, array: true, default: []],
    cleaning_main_oven: :string,
    lighting_main_oven: :string,
    supplied_accessories_main_oven: [:string, array: true, default: []],

    capacity_aux_oven: [:string, array: true, default: []],
    total_functions_aux_oven: [:string, array: true, default: []],
    door_glass_aux_oven: [:string, array: true, default: []],
    cooking_levels_aux_oven: :string,
    thermostat_aux_oven: :string,
    supplied_accessories_aux_oven: [:string, array: true, default: []],
    programmability_aux_oven: [:string, array: true, default: []],
    cleaning_aux_oven: :string,
    lighting_aux_oven: :string,

    function_list_main_oven: [:string, array: true, default: []],
    function_list_aux_oven: [:string, array: true, default: []]

end
