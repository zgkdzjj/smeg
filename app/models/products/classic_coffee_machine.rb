class ClassicCoffeeMachine < Product

  jsonb_accessor :data,
    total_functions: [:string, array: true, default: []],
    device_display: :string,
    thermostat: :string,
    pump_pressure: :string,
    coffee_bean_capacity: :string,
    water_tank_capacity: :string,
    installation: :string,
    programmability: [:string, array: true, default: []],
    cleaning: :string,
    lighting: :string,
    function_list: [:string, array: true, default: []]

end
