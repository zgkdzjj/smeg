class WarmingDrawer < Product

  jsonb_accessor :data,
    fascia: :string,
    drawer: :string,
    capacity: [:string, array: true, default: []],
    installation: :string,
    power_supply: :string,
    temperature: :string,
    timer: :string,
    function_list: [:string, array: true, default: []]

end
