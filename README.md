Mille-feuille
=============

Mille-feuille is a tool made to get some big pictures based on Google Maps satellite or flight view.

# Usage
	Usage: millefeuille [-mode] [position] [size] [zoom]  
		Tiles Mode:  
			millefeuille -t TileX TileY  width(px) height(px) zoom  
		Flight Mode:
			millefeuille -f TileX TileY  width(px) height(px) zoom
		GPS Mode (Not implemented yet):  
			millefeuille -g lat° long° width(px) height(px) zoom  

# Dependencies
* Linux, (Should run on Mac OS X)
* [Image Magick - montage] (http://www.imagemagick.org/script/montage.php)

# How it works
## Tile mode
The script will just compute how many tiles you need to cover an image of the dimention you entered.  
Then, it will get every tiles he needs around the center using `wget`.  
At least, it will use the `montage` command to pack every tiles in a big image.  

## Flight mode
The flight mode works exactly as the tile mode with a few parameters more.  
_Note: The script render only pictures taken from the south._

## GPS mode
_I'm not working on it know. But the idea is to use Google Maps API._

# Warning!
## Google ban
This script can spam a bit Google Maps' servers. So I get this message:
> We're sorry but your computer or network may be sending automated queries. To protect our users, we can't process your request right now.

That's why the script sleeps 2 seconds between each tile downloaded. Now you can download over 800 tiles to generate your image.  
But if you don't trust me or you want to be sure that Google doesn't block your Google Maps, you should spoof your IP address by using a proxy, a VPN, Tor, or anything like this.
This way, if Google ban your IP address, you just have to turn off your spoof.

## Output Folder
The content of the `output/tiles` folder is automatically deleted everytime you run the script, so don't use it to store documents.
