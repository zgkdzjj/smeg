class VictoriaFreestandingCooker93 < Product

  jsonb_accessor :data,
    total_functions: [:string, array: true, default: []],
    device_display: :string,
    gas_hob: :string,
    capacity: :string,
    gas_input: :string,
    main_oven: :string,
    electric_hob: :string,
    door_glass: :string,
    cooking_levels: :string,
    supplied_accessories_main_oven: [:string, array: true, default: []],
    thermostat: :string,
    installation: :string,
    programmability: [:string, array: true, default: []],
    cleaning: :string,
    lighting: :string,
    function_list: [:string, array: true, default: []]

end
