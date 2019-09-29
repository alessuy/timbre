import time
import random
import datetime
import subprocess
import telepot
from telepot.loop import MessageLoop


def handle(msg):
    chat_id = msg['chat']['id']
    command = msg['text']

    if command == '/status':
        process = subprocess.Popen(['bash', '/home/pi/timbre/timbre_status.sh', 'status'], stdout=subprocess.PIPE)
        out, err = process.communicate()
        print(out)
        bot.sendMessage(chat_id, out)

    elif command == '/monitor' :
        process = subprocess.Popen(['bash', '/home/pi/timbre/timbre_status.sh', 'monitor'], stdout=subprocess.PIPE)
        out, err = process.communicate()
        print(out)
        bot.sendMessage(chat_id, out)

    elif command == '/stop' :
        process = subprocess.Popen(['bash', '/home/pi/timbre/timbre_status.sh', 'stop'], stdout=subprocess.PIPE)
        out, err = process.communicate()
        print(out)
        bot.sendMessage(chat_id, out)

    elif command == '/start' :
        process = subprocess.Popen(['bash', '/home/pi/timbre/timbre_status.sh', 'start'], stdout=subprocess.PIPE)
        out, err = process.communicate()
        print(out)
        bot.sendMessage(chat_id, out)

    elif command == '/restart' :
        process = subprocess.Popen(['bash', '/home/pi/timbre/timbre_status.sh', 'restart'], stdout=subprocess.PIPE)
        out, err = process.communicate()
        print(out)
        bot.sendMessage(chat_id, out)

    elif command == '/ring' :
        process = subprocess.Popen(['bash', '/home/pi/timbre/timbre_status.sh', 'ring'], stdout=subprocess.PIPE)
        out, err = process.communicate()
        bot.sendMessage(chat_id, 'Ring test OK')

    else : 
        bot.sendMessage(chat_id, 'Comando Incorrecto')


bot = telepot.Bot('77sahsjahjsahjshjahsjaM')
MessageLoop(bot, handle).run_as_thread()
while 1:
    time.sleep(10)
