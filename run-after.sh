echo "Change the name of the in / out files on the script:"

TYPE=${1:-Developers}
# FILE=${1:-logs/gource-master-log-DevOps.log}


gource  logs/gource-master-log-${TYPE}.log  --title ${TYPE} --file-idle-time 15 \
  --seconds-per-day 0.02 --multi-sampling --stop-at-end \
  --hide mouse,progress,filenames --date-format "%d/%m/%y" \
  --user-font-size 20  --max-files 0 --background-colour 000000 \
  --highlight-colour 0bc7ed --max-user-speed 500   --file-font-size 8 \
  --dir-font-size 10 --output-framerate 30 --auto-skip-seconds .1 \
  -1280x720  --output-ppm-stream - \
  | ffmpeg -y -r 30 -f image2pipe -vcodec ppm -i - -b 65536K movie-$TYPE.mp4