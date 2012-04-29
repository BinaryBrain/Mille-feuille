Mille-feuille
=============

Tool to get a big map base on Google Maps (satellite view).

# Usage
Usage: millefeuille [-mode] [position] [size] [zoom]  
    Tiles Mode:  
        millefeuille -t TileX TileY  width(px) height(px) zoom  
    GPS Mode (Not implemented yet):  
        millefeuille -g lat° long° width(px) height(px) zoom  

# How it works
## Tile mode
The script will just compute how many tiles you need to cover an image of the dimention you entered.  
Then, it will get every tiles he needs around the center using `wget`.  
At least, it will use the `montage` command to pack every tiles in a big image.  

## GPS mode
_I'm not working on it know. But the idea is to use Google Maps API._

# Dependencies
[Image Magick - montage] (http://www.imagemagick.org/script/montage.php)

# Warning
This script can spam a bit Google Maps' servers. So I get this message:
> We're sorry but your computer or network may be sending automated queries. To protect our users, we can't process your request right now.
