#!/bin/bash

mode=$1
sizeX=$4;
sizeY=$5;
zoom=$6

tileSize=256

more=""

divCeil () {
	a=$1
	b=$2
	
	if [[ $(($a%$b)) == 0 ]]
	then
		echo $(($a/$b))
		return $(($a/$b))
	else
		echo $(($a/$b+1))
		return $(($a/$b+1))
	fi
}

# USAGE
if [[ $mode != "-t" && $mode != "-g" && $mode != "-f" || $6 == "" ]]
then
	echo "Usage: millefeuille [-mode] [position] [size] [zoom]";
	echo "Tiles Mode:";
	echo "	millefeuille -t TileX TileY  width(px) height(px) zoom";
	echo "Flight Mode:";
	echo "	millefeuille -f TileX TileY  width(px) height(px) zoom";
	echo "GPS Mode:";
	echo "	millefeuille -g lat° long° width(px) height(px) zoom";
	exit;

# TILES
elif [[ $mode == "-t" || $mode == "-f" ]]
then
	echo "Tile Mode";
	tileX=$2;
	tileY=$3;
	numTileX=$(divCeil $sizeX $tileSize);
	numTileY=$(divCeil $sizeY $tileSize);
	echo "We'll need to download" $numTileX "x" $numTileY "tiles";

	if [[ $mode == "-f" ]]
	then
		more="&deg=0";
		v=55;
	else
		v=109;
	fi
# GPS
elif [[ $mode == "-g" ]]
then
	echo "GPS Mode";
	echo "Not implemented yet...";
	exit
fi

# PREPARING
mkdir output
cd output
rm -R *

# WGET
for ((i=$tileX; i < $(($tileX+$numTileX)); i++))
do
	for ((j=$tileY; j < $(($tileY+$numTileY)); j++))
	do
		# The map will be centered on the tile you ask for.
		x=$(($i-($numTileX/2)));
		y=$(($j-($numTileY/2)));
		wget -O "$y"-"$x".jpg "http://khm0.google.ch/kh/v=${v}&x=${x}&y=${y}&z=${zoom}${more}"

		# If you remove the sleep, Google may block you for spamming.
		sleep 2;
	done
done

# MONTAGE
montage -monitor -tile ${numTileX}x${numTileY} -geometry +0+0 * montage.jpg
display montage.jpg
