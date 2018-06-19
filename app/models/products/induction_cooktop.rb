class InductionCooktop < Product

  jsonb_accessor :data,
    cutout: [:string, array: true, default: []],
    installation: :string,
    power_levels: :string,
    size: :string,
    timers: :string,
    controls: :string,
    capacity: [:string, array: true, default: []]

end
