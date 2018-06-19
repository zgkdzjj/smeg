class CeramicElectricCooktop < Product

  jsonb_accessor :data,
    capacity: [:string, array: true, default: []],
    installation: :string,
    controls: :string,
    size: :string,
    timers: :string,
    power_levels: :string,
    gas_connection: [:string, array: true, default: []],
    cutout: [:string, array: true, default: []]

end
