class WashingMachine < Product

  jsonb_accessor :data,
    device_display: :string,
    size: :string,
    drum_construction: :string,
    capacity: :string,
    door: :string,
    programs_list: [:string, array: true, default: []],
    feature_list: [:string, array: true, default: []],
    auxiliary_list: [:string, array: true, default: []],
    spin_speed: :string,
    water_rating: :string,
    energy_rating: :string,
    electrical_input: :string,
    total_current: :string,
    function_list: [:string, array: true, default: []]

end
