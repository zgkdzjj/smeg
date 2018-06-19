class GasInductionDominoCooktop < Product

  jsonb_accessor :data,
    capacity: [:string, array: true, default: []],
    cutout: [:string, array: true, default: []],
    installation: :string,
    gas_connection: [:string, array: true, default: []],
    ignition: :string

end
