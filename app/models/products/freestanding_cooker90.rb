class FreestandingCooker90 < Product

  jsonb_accessor :data,
    description_2: :string,

    capacity_gas_hob: [:string, array: true, default: []],
    gas_input: :string,
    safety_gas_hob: [:string, array: true, default: []],
    supplied_accessories_gas_hob: [:string, array: true, default: []],

    capacity_electric_hob: [:string, array: true, default: []],
    safety_electric_hob: [:string, array: true, default: []],
    supplied_accessories_electric_hob: [:string, array: true, default: []],

    capacity: [:string, array: true, default: []],
    total_functions: [:string, array: true, default: []],
    door_glass: :string,
    auto_menus: :string,
    cooking_levels: :string,
    thermostat: :string,
    programmability: [:string, array: true, default: []],
    cleaning: :string,
    lighting: :string,
    supplied_accessories_main_oven: [:string, array: true, default: []],

    installation: :string,
    function_list: [:string, array: true, default: []]

end
