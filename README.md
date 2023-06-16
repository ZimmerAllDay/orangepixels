# Orange Pixels
Orange Pixels is a [Generative ORC-721](https://github.com/ordbase/generative-orc-721) protocol project designed to give collector/creators the ability to create any 2 color image in a 24 x 24 pixel grid. Orange Pixels is an attempt to demonstrate one way recursive inscriptions, combined with efficient generative collection protocols, can be used to create more and more complex and customizable creations. 

## Is Orange Pixels Recursive?
By definition, the ORC-721 protocol is recursive since all data related to images is stored on chain. The protocol uses a deploy inscription to references a source inscription - which until now has been a spritesheet - and the protocol layers the source images from the spritesheet to create a composite. Minted pieces are JSON files that need rendered by an external process. 

## How Does it Work?
Orange pixels references a 576 tile spritesheet (24 x 24).

![image_file](./spritesheet.png)

Each tile contains 1 colored pixel with a transparent background in a 24 x 24 grid.

![image_file](./images/tile0000.png)

Inscribers can use "g" values of 0 - 575 to represent any pixel position(s) in a 24 x 24 grid to create a 2 color composite image.

## How to Create an Image

There are 2 sample ways to create an image.
1. Use the [count_pix.py](https://github.com/ZimmerAllDay/orangepixels/blob/main/image_reader/count_pix.py) script to generate a list of colored pixels from a 24 x 24 px file. For example, running the script on this image:

![image file](./image_reader/punk01_bw.png)

Generates this output:

> 128, 129, 130, 131, 132, 133, 134, 151, 159, 174, 184, 198, 208, 222, 232, 246, 256, 270, 272, 273, 274, 275, 276, 277, 278, 279, 280, 293, 294, 296, 297, 299, 300, 301, 303, 304, 316, 317, 320, 321, 322, 323, 324, 325, 326, 327, 328, 341, 342, 344, 345, 346, 347, 350, 351, 352, 366, 376, 390, 393, 394, 395, 396, 397, 398, 399, 400, 414, 415, 416, 417, 418, 419, 420, 421, 422, 423, 424, 425, 437, 438, 439, 440, 441, 442, 446, 447, 448, 449, 461, 462, 463, 464, 465, 466, 467, 468, 469, 470, 471, 472, 473, 485, 486, 487, 488, 489, 490, 491, 492, 493, 494, 495, 496, 497, 510, 511, 512, 513, 514, 515, 516, 517, 518, 519, 520, 521, 534, 536, 537, 538, 539, 540, 541, 542, 543, 544, 558, 562, 563, 564, 565, 566, 567

Which can be pasted into the "g" values of a colleciton inscription, like this:

```json
{
   "p":"orc-721",
   "op":"mint",
   "s":"orangepixels",
   "g":[128, 129, 130, 131, 132, 133, 134, 151, 159, 174, 184, 198, 208, 222, 232, 246, 256, 270, 272, 273, 274, 275, 276, 277, 278, 279, 280, 293, 294, 296, 297, 299, 300, 301, 303, 304, 316, 317, 320, 321, 322, 323, 324, 325, 326, 327, 328, 341, 342, 344, 345, 346, 347, 350, 351, 352, 366, 376, 390, 393, 394, 395, 396, 397, 398, 399, 400, 414, 415, 416, 417, 418, 419, 420, 421, 422, 423, 424, 425, 437, 438, 439, 440, 441, 442, 446, 447, 448, 449, 461, 462, 463, 464, 465, 466, 467, 468, 469, 470, 471, 472, 473, 485, 486, 487, 488, 489, 490, 491, 492, 493, 494, 495, 496, 497, 510, 511, 512, 513, 514, 515, 516, 517, 518, 519, 520, 521, 534, 536, 537, 538, 539, 540, 541, 542, 543, 544, 558, 562, 563, 564, 565, 566, 567]
}
```
to generate this:

![image file](.tmp/orangepix1@4x.png)




