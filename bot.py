import telebot
from telebot.types import InlineKeyboardMarkup, InlineKeyboardButton
import sqlite3

# তোমার দেওয়া এপিআই এবং এডমিন আইডি
API_TOKEN = '8787589315:AAER6edoHSmFWSrNrGNb-RZPwHKLEhQCrJ4'
ADMIN_ID = 6149729896

bot = telebot.TeleBot(API_TOKEN)

# ডাটাবেস তৈরি বা কানেক্ট করা
conn = sqlite3.connect('files.db', check_same_thread=False)
cursor = conn.cursor()
cursor.execute('''CREATE TABLE IF NOT EXISTS files 
                  (name TEXT PRIMARY KEY, file_id TEXT, file_type TEXT, btn_text TEXT, btn_url TEXT)''')
conn.commit()

# এডমিন ছাড়া অন্য কেউ ইনবক্সে মেসেজ দিলে
@bot.message_handler(func=lambda msg: msg.chat.type == 'private' and msg.from_user.id != ADMIN_ID)
def non_admin_dm(message):
    bot.reply_to(message, "you are not a admin")

# ফাইল সেভ করার ফাংশন (শুধুমাত্র এডমিনের জন্য)
@bot.message_handler(content_types=['document', 'video', 'photo', 'audio'], func=lambda msg: msg.chat.type == 'private' and msg.from_user.id == ADMIN_ID)
def handle_file(message):
    if not message.caption:
        bot.reply_to(message, "⚠️ অনুগ্রহ করে ক্যাপশনে ফাইলের নাম দিন।\n\nফরম্যাট: ফাইলের নাম | বাটনের নাম | লিংক\n(বাটন না চাইলে শুধু ফাইলের নাম দিন)")
        return
    
    # ক্যাপশন থেকে নাম এবং বাটনের ইনফরমেশন আলাদা করা
    parts = [p.strip() for p in message.caption.split('|')]
    name = parts[0].lower() # গ্রুপে সহজে খোঁজার জন্য ছোট হাতের অক্ষরে সেভ হবে
    btn_text = parts[1] if len(parts) > 1 else None
    btn_url = parts[2] if len(parts) > 2 else None
    
    # ফাইলের ধরন ও আইডি বের করা
    if message.document:
        file_id = message.document.file_id
        f_type = 'document'
    elif message.video:
        file_id = message.video.file_id
        f_type = 'video'
    elif message.photo:
        file_id = message.photo[-1].file_id
        f_type = 'photo'
    elif message.audio:
        file_id = message.audio.file_id
        f_type = 'audio'
    else:
        return

    try:
        cursor.execute("REPLACE INTO files (name, file_id, file_type, btn_text, btn_url) VALUES (?, ?, ?, ?, ?)", 
                       (name, file_id, f_type, btn_text, btn_url))
        conn.commit()
        bot.reply_to(message, f"✅ ফাইল '{name}' সফলভাবে সেভ হয়েছে!")
    except Exception as e:
        bot.reply_to(message, f"❌ এরর: {e}")

# সেভ করা ফাইলের লিস্ট দেখার কমান্ড (/list)
@bot.message_handler(commands=['list'], func=lambda msg: msg.chat.type == 'private' and msg.from_user.id == ADMIN_ID)
def list_files(message):
    cursor.execute("SELECT name FROM files")
    rows = cursor.fetchall()
    if not rows:
        bot.reply_to(message, "কোনো ফাইল সেভ করা নেই।")
        return
    res = "📁 **সেভ করা ফাইলের লিস্ট:**\n\n"
    for r in rows:
        res += f"▫️ {r[0]}\n"
    bot.reply_to(message, res, parse_mode='Markdown')

# গ্রুপে কেউ ফাইলের নাম লিখলে সেন্ড করা
@bot.message_handler(content_types=['text'], func=lambda msg: msg.chat.type in ['group', 'supergroup'])
def group_listener(message):
    text = message.text.lower().strip()
    cursor.execute("SELECT file_id, file_type, btn_text, btn_url FROM files WHERE name=?", (text,))
    row = cursor.fetchone()
    
    if row:
        file_id, f_type, btn_text, btn_url = row
        markup = None
        
        # বাটন থাকলে এড করা
        if btn_text and btn_url:
            markup = InlineKeyboardMarkup()
            markup.add(InlineKeyboardButton(text=btn_text, url=btn_url))
        
        # ফাইল সেন্ড করা
        try:
            if f_type == 'document':
                bot.send_document(message.chat.id, file_id, reply_markup=markup, reply_to_message_id=message.message_id)
            elif f_type == 'video':
                bot.send_video(message.chat.id, file_id, reply_markup=markup, reply_to_message_id=message.message_id)
            elif f_type == 'photo':
                bot.send_photo(message.chat.id, file_id, reply_markup=markup, reply_to_message_id=message.message_id)
            elif f_type == 'audio':
                bot.send_audio(message.chat.id, file_id, reply_markup=markup, reply_to_message_id=message.message_id)
        except Exception:
            pass # কোনো কারণে এরর দিলে বট যাতে ক্র্যাশ না করে

print("বট চালু হয়েছে...")
bot.polling(none_stop=True)
