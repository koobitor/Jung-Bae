express = require 'express'
app = express()
_ = require "underscore"

word = 
  "บ่องตง": "บองตรงๆ",
  "เตง": "ตัวเอง",
  "หยั่นมา": "อย่ามา",
  "ไรแว๊": "อะไรวะ",
  "น่ามคาน": "น่ารำคาญ",
  "ถ่ามตง": "ถามตรงๆ",
  "น่ารักจุง": "น่ารักจัง",
  "ฝุดๆ": "สุดๆ",
  "อัลไล": "อะไร",
  "ต่อมตง": "ตอบตรงๆ",
  "ชิมิ": "ใช่มั้ย",
  "มะรุ": "ไม่รู้",
  "เมพขิงๆ": "เทพจริงๆ",
  "ไรหรา": "อะไรเหรอ",
  "น่าร๊อคอ่ะ": "น่ารักอ่ะ",
  "ช่ะ": "ใช่ป่ะ",
  "จุงเบย": "จังเลย",
  "พ่อง": "พ่อเมิง"

app.get '/wtr/:word', (req, res) ->
  input = req.params.word # req.query["q"]; #"บ่องตงเธอน่ารักจุงรักเธอจุงเบย";
  output = input
  index = _.keys word
  for i in [0...index.length]
    output = output.replace index[i],word[index[i]]
  res.json output

app.get '/rtw/:word', (req, res) ->
  input = req.params.word
  output = input
  index = _.keys word
  for i in [0...index.length]
    output = output.replace word[index[i]],index[i]
  res.json output

app.listen 3000