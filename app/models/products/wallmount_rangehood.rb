class WallmountRangehood < Product

  jsonb_accessor :data,
    installation: :string,
    motor: :string,
    max_airflow: :string,
    noise_rating: :string,
    illumination: :string,
    speeds: :string,
    delay_stop: :string,
    ducting_options: [:string, array: true, default: []],
    function_list: [:string, array: true, default: []]

end
