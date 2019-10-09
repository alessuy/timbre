import time
import datetime
import telepot
from telepot.loop import MessageLoop


bot = telepot.Bot('apitelegramkey')
foto = open('/home/pi/timbre/camgge.png','rb')
bot.sendPhoto(-342267662,foto)



