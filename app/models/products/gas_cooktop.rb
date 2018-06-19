class GasCooktop < Product

  jsonb_accessor :data,
    capacity: [:string, array: true, default: []],
    ignition: :string,
    installation: :string,
    gas_connection: [:string, array: true, default: []],
    cutout: [:string, array: true, default: []],
    function_list: [:string, array: true, default: []]

end
