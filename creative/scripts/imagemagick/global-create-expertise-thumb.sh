SCRIPTS_DIR="$(cd "$(dirname "$0")" && pwd)"

RESOLUTION_PX=72
IN_IMAGES_DIR=$SCRIPTS_DIR/../../high-res-stock-images
OUT_IMAGES_DIR=$IN_IMAGES_DIR

convert -density 72 -units PixelsPerInch $IN_IMAGES_DIR/$1 $OUT_IMAGES_DIR/$2

convert -density 72 -units PixelsPerInch $IN_IMAGES_DIR/$1 -crop 360x220+0+0 $OUT_IMAGES_DIR/$2

#convert -density 72 -units PixelsPerInch $IN_IMAGES_DIR/$1 -resize 577.44x577.44 $OUT_IMAGES_DIR/$2