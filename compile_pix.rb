require 'rmagick'

# Get all the PNG files in the directory
image_files = Dir.glob("spritesheet_images/*.png").sort

# Output how many files we found
puts "Found #{image_files.size} image files"

# Read all the images
images = image_files.map do |filename|
  puts "Reading #{filename}..."
  Magick::Image.read(filename).first
end

grid_width = 24
grid_height = 24

# Start with a new image with the size of the entire spritesheet
composite = Magick::Image.new(24 * grid_width, 24 * grid_height)
composite.alpha(Magick::ActivateAlphaChannel)  # Enable transparency
composite.matte_color = 'none'  # Make the whole image transparent

images.each_with_index do |image, index|
  x = (index % grid_width) * 24
  y = (index / grid_width) * 24
  puts "Placing image #{index} at #{x},#{y}"
  composite = composite.composite(image, x, y, Magick::OverCompositeOp)
end

output_filename = "spritesheet.png"
composite.write(output_filename)
puts "Wrote output to #{output_filename}"
