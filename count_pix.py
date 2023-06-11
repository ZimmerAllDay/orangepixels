from PIL import Image

# Load the image
image = Image.open("punk01_bw.png")

# Convert the image to RGBA format
image_rgba = image.convert("RGBA")

# Get the pixel data
pixels = image_rgba.load()

# List to store the indices of colored pixels
colored_pixels = []

# Iterate through each pixel
for y in range(image.height):
    for x in range(image.width):
        # Check if the pixel is colored
        if pixels[x, y][3] != 0:  # Checking the alpha channel for transparency
            # Calculate the index of the colored pixel
            index = y * image.width + x
            colored_pixels.append(index)

# Print the indices of colored pixels
print(colored_pixels)



