class LinearCompact < Product

  jsonb_accessor :data,
    total_functions: [:string, array: true, default: []],
    auto_menus: :string,
    device_display: :string,
    capacity: [:string, array: true, default: []],
    cooking_levels: :string,
    thermostat: :string,
    water_tank_capacity: :string,
    microwave_power: :string,
    installation: :string,
    programmability: [:string, array: true, default: []],
    cleaning: :string,
    lighting: :string,
    function_list: [:string, array: true, default: []]

end
