class Microwave < Product

  jsonb_accessor :data,
    device_display: :string,
    cavity_type: :string,
    turntable: :string,
    power_levels: :string,
    microwave_power: :string,
    grill_power: :string,
    capacity: [:string, array: true, default: []],
    convection_power: :string,
    auto_cook_functions: :string,
    other_functions: [:string, array: true, default: []],
    defrost: :string,
    lighting: :string,
    control_panel: :string,
    clock: :string,
    timer: :string,
    function_list: [:string, array: true, default: []]

end
