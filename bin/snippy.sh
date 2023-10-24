#!/bin/sh


SNIPS=${HOME}/snippets

FILE=`ls ${SNIPS} | dmenu -i -fn 'xos4 Terminus:style=bold:pixelsize=18' -p 'Snippet'`

if [ -f ${SNIPS}/${FILE} ]; then
  DATA=$([ -x "${SNIPS}/${FILE}" ] && bash "${SNIPS}/${FILE}" || head --bytes=-1 ${SNIPS}/${FILE})
  printf "$DATA" | xsel -p -i
  printf "$DATA" | xsel -b -i
  xdotool key shift+Insert
fi
