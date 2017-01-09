#!/bin/bash
# See https://en.wikibooks.org/wiki/FFMPEG_An_Intermediate_Guide/image_sequence for
# some useful tips on using ffmpeg to turn a sequence of images into a video

set -e

# Number of seconds to display each slide
SLIDE_DURATION=5
SLIDE_DURATION_FRAMES=$[$SLIDE_DURATION*25]

cd "$(dirname "$0")"

TEMP_DIR=$PWD/tmp
CONCAT_LIST=concatlist
VIDEO_SIZE=640x480

rm -rf $TEMP_DIR
mkdir $TEMP_DIR

# Create one mp4 file per image using the ffmpeg "zoompan" filter
cd images
for f in img-*.jpg
do
  echo "Converting $f to video"
  ffmpeg -i $f -vf "zoompan=z='if(lte(zoom,1.0),1.5,max(1.002,zoom-0.0030))':d=$SLIDE_DURATION_FRAMES" -vcodec libx264 -s $VIDEO_SIZE -pix_fmt yuv420p ../tmp/${f}.mp4 2>/dev/null
done

# Prepare a list of the individual videos in ffmpeg "concat" input format
cd $TEMP_DIR
for v in *.mp4
do
  echo "file '$v'" >> $CONCAT_LIST
done

# Concatenate the individual videos into a single video
# See https://trac.ffmpeg.org/wiki/Concatenate for details on combining multiple videos using ffmpeg
echo "Joining video files"
ffmpeg -f concat -i $CONCAT_LIST -c copy video-only.mp4

# Finally combine the video and the soundtrack
echo "Combining video with soundtrack"
ffmpeg -i video-only.mp4 -i ../audio/soundtrack.mp3 -acodec aac -vcodec libx264 -shortest on-hold.mp4

echo "Finished!"
