require 'pixelart'

# Get all the PNG files in the directory
image_files = Dir.glob("./spritesheet_images/*.png").sort

# Output how many files we found
puts "Found #{image_files.size} image files"


## use a 24 x 24 grid (with sprites / tiles 24x24px each)
composite = ImageComposite.new( 24, 24, width: 24,
                                        height: 24)

# add all the images
image_files.each do |filename|
   composite << Image.read( filename )
end

composite.save( "./spritesheet.png" )
