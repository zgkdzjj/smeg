class FrenchDoorRefrigeration < Product

  jsonb_accessor :data,
    gross_capacity: [:string, array: true, default: []],

    shelves_main_compartment: [:string, array: true, default: []],
    drawers_main_compartment: [:string, array: true, default: []],
    door_shelves_main_compartment: [:string, array: true, default: []],
    accessories_main_compartment: [:string, array: true, default: []],
    lighting_main_compartment: :string,

    shelves_freezer: [:string, array: true, default: []],
    drawers_freezer: [:string, array: true, default: []],
    door_shelves_freezer: [:string, array: true, default: []],

    defrost: :string,
    feature_list: [:string, array: true, default: []],
    performance: :string,
    energy_consumption: :string,
    star_rating: :string,
    noise: :string,
    weight: :string,
    function_list: [:string, array: true, default: []]

end
