require 'chunky_png'

spritesheet = ChunkyPNG::Image.from_file('spritesheet.png')

sprite_width = 24
sprite_height = 24

spritesheet_width = spritesheet.dimension.width
sprites_in_row = spritesheet_width / sprite_width

specs = [128, 129, 130, 131, 132, 133, 134, 151, 159, 174, 184, 198, 208, 222, 232, 246, 256, 270, 272, 273, 274, 275, 276, 277, 278, 279, 280, 293, 294, 296, 297, 299, 300, 301, 303, 304, 316, 317, 320, 321, 322, 323, 324, 325, 326, 327, 328, 341, 342, 344, 345, 346, 347, 350, 351, 352, 366, 376, 390, 393, 394, 395, 396, 397, 398, 399, 400, 414, 415, 416, 417, 418, 419, 420, 421, 422, 423, 424, 425, 437, 438, 439, 440, 441, 442, 446, 447, 448, 449, 461, 462, 463, 464, 465, 466, 467, 468, 469, 470, 471, 472, 473, 485, 486, 487, 488, 489, 490, 491, 492, 493, 494, 495, 496, 497, 510, 511, 512, 513, 514, 515, 516, 517, 518, 519, 520, 521, 534, 536, 537, 538, 539, 540, 541, 542, 543, 544, 558, 562, 563, 564, 565, 566, 567]  # The indices of the sprites you want to use

composite = ChunkyPNG::Image.new(sprite_width, sprite_height, ChunkyPNG::Color::TRANSPARENT)

specs.each do |spec|
  sprite_row = spec / sprites_in_row
  sprite_col = spec % sprites_in_row

  sprite = spritesheet.crop(sprite_col * sprite_width, sprite_row * sprite_height, sprite_width, sprite_height)
  
  composite.compose!(sprite)
end

# Create the file name
filename = "orangepix#{'1'}.png"

# Define the directory
directory = "tmp"

# Ensure the directory exists
Dir.mkdir(directory) unless Dir.exist?(directory)

# Save the file in the directory
composite.save(File.join(directory, filename))

resized_composite = composite.resize(sprite_width * 4, sprite_height * 4)

# Create the 4x file name
filename_4x = filename.gsub('.png', '@4x.png')

# Save the resized image with the 4x file name
resized_composite.save(File.join(directory, filename_4x))
