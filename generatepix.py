# Create individual images with one colored pixel and transparent background.
# Loop through each possible pixel position in 24 x 24 px grid

from PIL import Image

# Define the size of the image
width, height = 24, 24

# Define the color of the pixel
color = (255, 153, 0, 255)  # Red color in RGBA format

# Counter for limiting the number of images
counter = 0

# Loop through each pixel position
for j in range(height):
    for i in range(width):
        # Create a new image with all pixels transparent
        img = Image.new('RGBA', (width, height), (0, 0, 0, 0))

        # Access the pixel data
        pixels = img.load()

        # Set the color of the pixel at position (i, j)
        pixels[i, j] = color

        # Save the image with a unique name
        img.save(f'tile{str(counter).zfill(4)}.png')

        # Increment the counter
        counter += 1

        # Check if the counter has reached the limit
        if counter >= 576:
            break

    # Break the outer loop if the counter has reached the limit
    if counter >= 576:
        break




