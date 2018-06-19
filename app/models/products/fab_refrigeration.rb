class FabRefrigeration < Product

  jsonb_accessor :data,
    gross_capacity: [:string, array: true, default: []],

    shelves_main_compartment: [:string, array: true, default: []],
    drawers_main_compartment: [:string, array: true, default: []],
    lighting_main_compartment: [:string, array: true, default: []],

    shelves_inner_door: [:string, array: true, default: []],
    accessories_inner_door: [:string, array: true, default: []],

    shelves_freezer: [:string, array: true, default: []],
    drawers_freezer: [:string, array: true, default: []],
    accessories_freezer: [:string, array: true, default: []],

    defrost: :string,
    performance: :string,
    energy_consumption: :string,
    star_rating: :string,
    noise: :string,
    function_list: [:string, array: true, default: []]

end
