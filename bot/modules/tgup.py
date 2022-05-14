import os
from telegram.ext import CommandHandler

from bot import LOGGER, dispatcher
from bot.helper.telegram_helper.filters import CustomFilters
from bot.helper.telegram_helper.bot_commands import BotCommands
from bot.helper.telegram_helper.message_utils import sendMessage, editMessage

def tgupload(update, context):
    message = update.effective_message
    filename = message.text.split(' ', 1)
    if len(filename) == 1:
        return sendMessage('No filename was given.😂', context.bot, update.message)
    filename = filename[1]
    if os.path.exists(filename):
        pass
    else:
        return sendMessage('No such filename.🤔', context.bot, update.message)
    
    procs = sendMessage('uploading, be sure file size <2gb😅', context.bot, update.message)
    #context.bot.send_document(document=filename, filename=filename, reply_to_message_id=message.message_id, chat_id=message.chat_id)
    update.reply_document(document=filename, quote=True)
    editMessage("successfully uploaded 😉", procs)

TGUP_HANDLER = CommandHandler(BotCommands.tgupCommand, tgupload,
                                                  filters=CustomFilters.owner_filter | CustomFilters.authorized_chat, run_async=True)
dispatcher.add_handler(TGUP_HANDLER)
