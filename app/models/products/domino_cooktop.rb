class DominoCooktop < Product

  jsonb_accessor :data,
    installation: :string,
    capacity: [:string, array: true, default: []],
    temperature_control: :string,
    gas_connection: :string,
    burners: :string,
    cutout: [:string, array: true, default: []],
    function_list: [:string, array: true, default: []]

end
