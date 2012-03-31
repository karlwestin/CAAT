#!/usr/bin/env bash

# execute version procedure. 
# version.nfo contains new version value.
#
./version.sh
VERSION=`cat version.nfo`
echo "New generated version: ${VERSION}"


#DST_FILE_NAME="${CAAT_DST}";
DST_FILE_NAME="caat";
CAAT_HOME="../"

VERSION=`cat version.nfo`

FILE_CAAT="${DST_FILE_NAME}.js"
FILE_CAAT_CSS="${DST_FILE_NAME}-css.js"
FILE_CAAT_BOX2D="${DST_FILE_NAME}-box2d.js"

echo "Packing ${FILE_CAAT}"
echo -e "/*" > "${FILE_CAAT}"
cat $CAAT_HOME/LICENSE >> "${FILE_CAAT}"
echo -e "\nVersion: ${VERSION}\n" >> "${FILE_CAAT}"
echo -e "Created on:" >> "${FILE_CAAT}"
date "+DATE: %Y-%m-%d%nTIME: %H:%M:%S" >> "${FILE_CAAT}"
echo -e "*/\n\n" >> "${FILE_CAAT}"

more $CAAT_HOME/src/CAAT.js >> "${FILE_CAAT}"
more $CAAT_HOME/src/core/class.js >> "${FILE_CAAT}"
more $CAAT_HOME/src/math/affinetransform2D.js >> "${FILE_CAAT}"
more $CAAT_HOME/src/math/color.js >> "${FILE_CAAT}"
more $CAAT_HOME/src/math/rectangle.js >> "${FILE_CAAT}"
more $CAAT_HOME/src/math/bezier.js >> "${FILE_CAAT}"
more $CAAT_HOME/src/math/point.js >> "${FILE_CAAT}"
more $CAAT_HOME/src/math/quadtree.js >> "${FILE_CAAT}"
more $CAAT_HOME/src/path/interpolator.js >> "${FILE_CAAT}"
more $CAAT_HOME/src/behaviour/behaviour.js >> "${FILE_CAAT}"
more $CAAT_HOME/src/behaviour/csskeyframehelper.js >> "${FILE_CAAT}"
more $CAAT_HOME/src/core/browserdetect.js >> "${FILE_CAAT}"
more $CAAT_HOME/src/model/debug.js >> "${FILE_CAAT}"
more $CAAT_HOME/src/model/actor.js >> "${FILE_CAAT}"
more $CAAT_HOME/src/model/audio.js >> "${FILE_CAAT}"
more $CAAT_HOME/src/model/extraActor.js >> "${FILE_CAAT}"
more $CAAT_HOME/src/model/director.js >> "${FILE_CAAT}"
more $CAAT_HOME/src/model/mouseevent.js >> "${FILE_CAAT}"
more $CAAT_HOME/src/model/conpoundimage.js >> "${FILE_CAAT}"
more $CAAT_HOME/src/model/imagepreloader.js >> "${FILE_CAAT}"
more $CAAT_HOME/src/model/timer.js >> "${FILE_CAAT}"
more $CAAT_HOME/src/model/scene.js >> "${FILE_CAAT}"
more $CAAT_HOME/src/modules/modules.js >> "${FILE_CAAT}"
more $CAAT_HOME/src/modules/CircleManager/PackedCircle.js >> "${FILE_CAAT}"
more $CAAT_HOME/src/modules/CircleManager/PackedCircleManager.js >> "${FILE_CAAT}"
more $CAAT_HOME/src/modules/LocalStorage/LocalStorage.js >> "${FILE_CAAT}"
more $CAAT_HOME/src/modules/ImageUtil/ImageUtil.js >> "${FILE_CAAT}"
more $CAAT_HOME/src/modules/Layout/layout.js >> "${FILE_CAAT}"
more $CAAT_HOME/src/modules/Font/font.js >> "${FILE_CAAT}"
more $CAAT_HOME/src/path/interpolatoractor.js >> "${FILE_CAAT}"
more $CAAT_HOME/src/path/path.js >> "${FILE_CAAT}"
more $CAAT_HOME/src/path/pathactor.js >> "${FILE_CAAT}"
more $CAAT_HOME/src/texture/plasma.js >> "${FILE_CAAT}"
more $CAAT_HOME/src/webgl/ShaderUtil.js >> "${FILE_CAAT}"
more $CAAT_HOME/src/webgl/glu.js >> "${FILE_CAAT}"
more $CAAT_HOME/src/webgl/glTexturePage.js >> "${FILE_CAAT}"


# Distribute resulting compiled files
#
echo -e "\nCopying:"
while read LINE; do
  echo -e "\tCopying results to ${LINE}"
  cp ${FILE_CAAT} ${LINE} 
done < version.distribution


#
# CSS
#
echo "Packing ${FILE_CAAT_CSS}"
echo -e "/*" > "${FILE_CAAT_CSS}"
cat $CAAT_HOME/LICENSE >> "${FILE_CAAT_CSS}"
echo -e "\nVersion: ${VERSION}\n" >> "${FILE_CAAT_CSS}"
echo -e "Created on:" >> "${FILE_CAAT_CSS}"
date "+DATE: %Y-%m-%d%nTIME: %H:%M:%S" >> "${FILE_CAAT_CSS}"
echo -e "*/\n\n" >> "${FILE_CAAT_CSS}"

more $CAAT_HOME/src/CAAT.js >> "${FILE_CAAT_CSS}"
echo -e "CAAT.__CSS__=1;" >> "${FILE_CAAT_CSS}"
more $CAAT_HOME/src/core/class.js >> "${FILE_CAAT_CSS}"
more $CAAT_HOME/src/math/affinetransform2D.js >> "${FILE_CAAT_CSS}"
more $CAAT_HOME/src/math/color.js >> "${FILE_CAAT_CSS}"
more $CAAT_HOME/src/math/rectangle.js >> "${FILE_CAAT_CSS}"
more $CAAT_HOME/src/math/bezier.js >> "${FILE_CAAT_CSS}"
more $CAAT_HOME/src/math/point.js >> "${FILE_CAAT_CSS}"
more $CAAT_HOME/src/math/quadtree.js >> "${FILE_CAAT_CSS}"
more $CAAT_HOME/src/path/interpolator.js >> "${FILE_CAAT_CSS}"
more $CAAT_HOME/src/behaviour/behaviour.js >> "${FILE_CAAT_CSS}"
more $CAAT_HOME/src/behaviour/csskeyframehelper.js >> "${FILE_CAAT_CSS}"
more $CAAT_HOME/src/core/browserdetect.js >> "${FILE_CAAT_CSS}"
more $CAAT_HOME/src/model/debug.js >> "${FILE_CAAT_CSS}"
more $CAAT_HOME/src/model/actorCSS.js >> "${FILE_CAAT_CSS}"
more $CAAT_HOME/src/model/audio.js >> "${FILE_CAAT_CSS}"
more $CAAT_HOME/src/model/extraActor.js >> "${FILE_CAAT_CSS}"
more $CAAT_HOME/src/model/director.js >> "${FILE_CAAT_CSS}"
more $CAAT_HOME/src/model/mouseevent.js >> "${FILE_CAAT_CSS}"
more $CAAT_HOME/src/model/conpoundimage.js >> "${FILE_CAAT_CSS}"
more $CAAT_HOME/src/model/imagepreloader.js >> "${FILE_CAAT_CSS}"
more $CAAT_HOME/src/model/timer.js >> "${FILE_CAAT_CSS}"
more $CAAT_HOME/src/model/sceneCSS.js >> "${FILE_CAAT_CSS}"
more $CAAT_HOME/src/modules/modules.js >> "${FILE_CAAT_CSS}"
more $CAAT_HOME/src/modules/CircleManager/PackedCircle.js >> "${FILE_CAAT_CSS}"
more $CAAT_HOME/src/modules/CircleManager/PackedCircleManager.js >> "${FILE_CAAT_CSS}"
more $CAAT_HOME/src/modules/LocalStorage/LocalStorage.js >> "${FILE_CAAT_CSS}"
more $CAAT_HOME/src/modules/ImageUtil/ImageUtil.js >> "${FILE_CAAT_CSS}"
more $CAAT_HOME/src/modules/Layout/layout.js >> "${FILE_CAAT_CSS}"
more $CAAT_HOME/src/modules/Font/font.js >> "${FILE_CAAT_CSS}"
more $CAAT_HOME/src/path/interpolatoractor.js >> "${FILE_CAAT_CSS}"
more $CAAT_HOME/src/path/path.js >> "${FILE_CAAT_CSS}"
more $CAAT_HOME/src/path/pathactor.js >> "${FILE_CAAT_CSS}"


#
# Distribute resulting compiled files
#
echo -e "\nCopying:"
while read LINE; do
  echo -e "\tCopying results to ${LINE}"
  cp ${FILE_CAAT_CSS} ${LINE} 
done < version.distribution

# box2d

echo "Packing ${FILE_CAAT_BOX2D}"
echo -e "/*" > "${FILE_CAAT_BOX2D}"
cat $CAAT_HOME/LICENSE >> "${FILE_CAAT_BOX2D}"
echo -e "\nVersion: ${VERSION}\n" >> "${FILE_CAAT_BOX2D}"
echo -e "Created on:" >> "${FILE_CAAT_BOX2D}"
date "+DATE: %Y-%m-%d%nTIME: %H:%M:%S" >> "${FILE_CAAT_BOX2D}"
echo -e "*/\n\n" >> "${FILE_CAAT_BOX2D}"

more $CAAT_HOME/src/box2d/box2Dactor.js >> "${FILE_CAAT_BOX2D}"

#
# Distribute resulting compiled files
#
echo -e "\nCopying:"
while read LINE; do
  echo -e "\tCopying results to ${LINE}"
  cp ${FILE_CAAT_BOX2D} ${LINE} 
done < version.distribution
