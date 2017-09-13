#coding: utf-8
SamplesTaskKanriTask.delete_all

target = Date.today
SamplesTaskKanriTask.create!(
  name:"期限切れタスク",
  shosai:"確認用、期限切れのタスク",
  kigen:target-1,
  kanryo:false
)
SamplesTaskKanriTask.create!(
  name:"環境構築",
  shosai:"windowsでruby on rails5の環境構築を行う",
  kigen:target,
  kanryo:false
)
SamplesTaskKanriTask.create!(
  name:"タスク管理",
  shosai:"タスク管理アプリを作成する",
  kigen:target+1,
  kanryo:false
)
SamplesTaskKanriTask.create!(
  name:"http通信",
  shosai:"http通信のget、postについて勉強する",
  kigen:target+2,
  kanryo:false
)
SamplesTaskKanriTask.create!(
  name:"bootstrap",
  shosai:"bootstrapの使い方を覚える",
  kigen:target+3,
  kanryo:false
)