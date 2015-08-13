SimpleCaptcha.setup do |sc|
  # default: 100x28
  # sc.image_size = '80x34'

  # default: 5
  sc.length = 3

  # default: simply_blue
  # possible values:
  # 'embosed_silver',
  # 'simply_red',
  # 'simply_green',
  # 'simply_blue',
  # 'distorted_black',
  # 'all_black',
  # 'charcoal_grey',
  # 'almost_invisible'
  # 'random'
  sc.image_style = 'all_black'

  # default: low
  # possible values: 'low', 'medium', 'high', 'random'

  sc.distortion = 'low'
end
