class Dishwasher < Product

  jsonb_accessor :data,
    size: :string,
    capacity: [:string, array: true, default: []],
    device_display: :string,
    programmability: [:string, array: true, default: []],
    end_of_cycle_indicator: :string,
    baskets: :string,
    wash_system: [:string, array: true, default: []],
    water_softener: :string,
    temperatures: :string,
    water_connection: :string,
    timer: :string,
    filtration: :string,
    drying: :string,
    noise: :string,
    style: :string,
    total_programs: :string,
    energy_usage: :string,
    energy_rating: :string,
    water_usage: :string,
    water_rating: :string,
    feature_list: [:string, array: true, default: []],
    function_list: [:string, array: true, default: []],
    programs_list: [:string, array: true, default: []],
    quick_programs_list: [:string, array: true, default: []]

end
