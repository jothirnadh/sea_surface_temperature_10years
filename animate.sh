#!/usr/bin/env bash

dir=png3
movie=output3/pwat.mp4
bitrate=4000k
framerate=5
ffmpeg -r $framerate -y -f image2 -pattern_type glob -i "$dir/*.png" -c:v libx264 -preset slow -b:v $bitrate -pass 1 -c:a libfdk_aac -b:a 0k -f mp4 -r $framerate -profile:v high -level 4.2 -pix_fmt yuv420p -movflags +faststart /dev/null && \
ffmpeg -r $framerate -f image2 -pattern_type glob -i "$dir/*.png" -c:v libx264 -preset slow -b:v $bitrate -pass 2 -c:a libfdk_aac -b:a 0k -r $framerate -profile:v high -level 4.2 -pix_fmt yuv420p -movflags +faststart $movie