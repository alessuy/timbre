import time
import datetime
import telepot
from telepot.loop import MessageLoop


bot = telepot.Bot('hajHAJajjajAaHSAJSASH')
foto = open('/home/pi/timbre/timbre.jpg','rb')
bot.sendPhoto(-342267662,foto)
bot.sendMessage(-342267662, 'Riiing 1117')


