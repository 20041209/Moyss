
function qujian(thenumber,minnumber,maxnumber)
  local temp;
  if thenumber>=minnumber and thenumber<=maxnumber then
    temp=true;
  end
  return temp;
end
function isea(num,flags,address,better)
  local getresults={}
  gg.clearResults()
  flags=flags or 4
  gg.searchNumber(num, flags)
  if address and gg.getResultCount()~=0 then gg.searchAddress(address)end
  if better and gg.getResultCount()~=0 then gg.searchNumber(better,flags)end
  getresults=gg.getResults(gg.getResultCount())
  gg.clearResults()
  return getresults
end

function MYS(data,addressi,search,flag,values,datefreeze)
  local tempdate,temp={},{};
  local tempi=0
  data=data or {}
  local numsea=tonumber(search)
  if type(numsea)=="number" then
    min=numsea max=numsea
   elseif type(search)=="table" then
    min=search[1] max=search[2]
   elseif type(search)=="string" then
    min=tonumber(search:match("(.-)~")) max=tonumber(search:gsub("(.-)~",""))
  end
  local datelen=#data
  if datelen~=0 then
    if (not values)then
      for i=1, datelen do
        tempdate[i]={address=data[i].address+addressi,flags=flag}
      end
      tempdate=gg.getValues(tempdate)
      for i=1, datelen do
        if qujian(tempdate[i].value,min,max) then
          tempi=tempi+1
          temp[tempi]={address=data[i].address,flags=flag}
        end
      end
     else
      for i=1, datelen do
        tempdate[i]={address=data[i].address+addressi,flags=flag,value=values,freeze=datefreeze}
        temp[i]={address=data[i].address,flags=flag}
      end
      if datefreeze then
        gg.addListItems(tempdate)
       else
        gg.setValues(tempdate)
      end
    end
  end
  return temp;
end

function seas(data,addressi,search,flag,values)
  local temp={}
  local tempi=0
  data=data or {}
  if type(search)=="number" then
    min=search max=search
   else
    min=search[1] max=search[2]
  end
  local datelen=#data
  if data and datelen~=0 then
    if (not values)then
      for i=1, datelen do
        data[i]={address=data[i].address+addressi,flags=flag}
      end
      data=gg.getValues(data)
      for i=1, datelen do
        if qujian(data[i].value,min,max) then
          tempi=tempi+1
          temp[tempi]={address=data[i].address,flags=flag}
        end
      end
     else
      for i=1, datelen do
        data[i]={address=data[i].address+addressi,flags=flag,value=values}
        temp[i]={address=data[i].address,flags=flag}
      end
      gg.setValues(data)
    end
  end
  return temp
end

function index(date,tables,py,flags,value,datefreeze)
  date=date or {}
  tables=tables or {}
  if #date~=0 then
    local tempdate,editdate={},{}
    tempdate[1]={}
    for j=1,#date do
      tempdate[1][j]={address=date[j].address+tables[1],flags=32}
    end
    tempdate[1]=gg.getValues(tempdate[1])
    for i=2,#tables do
      tempdate[i]={}
      for j=1,#date do
        tempdate[i][j]={address=tempdate[i-1][j].value+tables[i],flags=32}
      end
      tempdate[i]=gg.getValues(tempdate[i])
    end
    local tabeslen=#tables
    for i=1,#date do
      editdate[i]={address=tempdate[tabeslen][i].value+py,flags=flags,value=value,freeze=datefreeze}
    end
    if datefreeze then
      gg.addListItems(editdate)
     else
      gg.setValues(editdate)
    end
  end
  return date
end



function sfomal(onearr)
  local editdate,returnresults
  if onearr and #onearr~=0 then
    for i=1,#onearr do
      if onearr[i]["内存范围"] then gg.setRanges(tonumber(onearr[i]["内存范围"])) end
      if onearr[i]["提示"] then gg.toast(onearr[i]["提示"]) end
      if onearr[i]["suspend"] then gg.sleep(onearr[i]["suspend"]) end
      if onearr[i]["load"] then
        editdate=onearr[i]["load"]
       elseif onearr[i]["搜索数值"] then
        editdate=isea(onearr[i]["搜索数值"],tonumber(onearr[i]["类型"]),onearr[i]["改善"],onearr[i]["better"],onearr[i]["是否改善"],onearr[i]["显示UI"])
       elseif onearr[i]["results"] then
        returnresults=editdate
       elseif onearr[i]["pointer"] then
        editdate=index(editdate,onearr[i]["pointer"],tonumber(onearr[i]["偏移"]),tonumber(onearr[i]["类型"]),onearr[i]["修改结果"],onearr[i]["冻结结果"])
       elseif editdate then
        editdate= MYS(editdate,tonumber(onearr[i]["偏移"]),onearr[i]["判定结果"],tonumber(onearr[i]["类型"]),onearr[i]["修改结果"],onearr[i]["冻结结果"])
        if onearr[i]["恢复冻结"] then gg.clearList(onearr[i]["恢复冻结"]) end

      end
    end
  end
  return returnresults
end

	
year=os.date('*t').year
month=os.date('*t').month
day=os.date('*t').day
hour=os.date('*t').hour
min=os.date('*t').min
wday=os.date('*t').wday
gg.toast("💗欢迎使用💗")
function Main()
menu = gg.choice({
  '尘白禁区☃️测试',
  '⚠退出脚本'},
nil,'沫以伤制作QQ:𝟑𝟐𝟓𝟑𝟓𝟐𝟐𝟎𝟕𝟕')
if menu == 1 then A() end
if menu == 2 then Exit() end
XGCK=-1
end



function A()
  menu1 = gg.choice({
    '自定义子弹数量',
    '一键过关',
    '自定义大招能量',
    '一键10000大招能量',
    '大招无冷却',
    '一键10000技能能量',
    '技能无冷却',
    '自定义血量',
    '返回首页'},
  nil,'沫以伤测试')
  if menu1 == 1 then zdyzdsl() end
  if menu1 == 2 then yjwxzd() end
  if menu1 == 3 then zdydznl() end
  if menu1 == 4 then yjwxdznl() end
  if menu1 == 5 then dzwlq() end
  if menu1 == 6 then wxjnnl() end
  if menu1 == 7 then jnwlq() end
  if menu1 == 8 then zdyxl() end
  if menu1 == 9 then Main() end
  GLWW=-1
end







function zdyzdsl()
  local MYS=gg.prompt({"输入要修改的子弹数量:"})
  if MYS==nil then Main() elseif MYS~=nil then
    QS=(''..( MYS[1])..'')
    date={
      {["内存范围"]= gg.REGION_ANONYMOUS},
      {["name"]="自定义子弹数量"},
      {["搜索数值"]=1045220557,["类型"]=4,["改善"]=8,["是否改善"]=true},
      {["偏移"]=-80,["类型"]=4,["判定结果"]=4,["改善"]=0,["是否改善"]=true},
      {["偏移"]=8,["类型"]=4,["判定结果"]=5,["改善"]=0,["是否改善"]=true},
      {["偏移"]=-44,["类型"]=16,["修改结果"]=QS,["改善"]=8,["是否改善"]=true},
      {["偏移"]=-40,["类型"]=16,["修改结果"]=QS,["改善"]=4,["是否改善"]=true},
    }
    sfomal(date)
    gg.toast("自定义子弹数量 ojbk")
    end end


function yjwxzd()
  date={
      {["内存范围"]= gg.REGION_ANONYMOUS},
      {["name"]="一键过关"},
      {["搜索数值"]=-1027080192,["类型"]=4,["改善"]=C,["是否改善"]=true},
      {["偏移"]=4,["类型"]=4,["判定结果"]=1,["改善"]=0,["是否改善"]=true},
      {["偏移"]=-48,["类型"]=4,["判定结果"]=-1},
      {["偏移"]=-56,["类型"]=4,["判定结果"]=-1},
      {["偏移"]=40,["类型"]=4,["修改结果"]=999999999,["改善"]=4,["是否改善"]=true},
    }
    sfomal(date)
    gg.toast("一键无限子弹 ojbk")
    end


function zdydznl()
  local MYS=gg.prompt({"输入要修改的大招能量:"})
  if MYS==nil then Main() elseif MYS~=nil then
    QS=(''..( MYS[1])..'')
    date={
      {["内存范围"]= gg.REGION_ANONYMOUS},
      {["name"]="自定义大招能量"},
      {["搜索数值"]=1050253722,["类型"]=4,["改善"]=8,["是否改善"]=true},
      {["偏移"]=16,["类型"]=4,["判定结果"]=-1,["改善"]=8,["是否改善"]=true},
      {["偏移"]=88,["类型"]=4,["判定结果"]=1050253722,["改善"]=0,["是否改善"]=true},
      {["偏移"]=32,["类型"]=4,["判定结果"]=1120403456,["改善"]=8,["是否改善"]=true},
      {["偏移"]=44,["类型"]=16,["修改结果"]=QS,["改善"]=4,["是否改善"]=true},
      {["偏移"]=48,["类型"]=16,["修改结果"]=QS,["改善"]=8,["是否改善"]=true},
    }
    sfomal(date)
    gg.toast("自定义大招能量 ojbk(改太大会卡死)")
    end end


function yjwxdznl()
    date={
      {["内存范围"]= gg.REGION_ANONYMOUS},
      {["name"]="一键100000大招能量"},
      {["搜索数值"]=1050253722,["类型"]=4,["改善"]=8,["是否改善"]=true},
      {["偏移"]=16,["类型"]=4,["判定结果"]=-1,["改善"]=8,["是否改善"]=true},
      {["偏移"]=88,["类型"]=4,["判定结果"]=1050253722,["改善"]=0,["是否改善"]=true},
      {["偏移"]=32,["类型"]=4,["判定结果"]=1120403456,["改善"]=8,["是否改善"]=true},
      {["偏移"]=44,["类型"]=16,["修改结果"]=100000,["改善"]=4,["是否改善"]=true},
      {["偏移"]=48,["类型"]=16,["修改结果"]=100000,["改善"]=8,["是否改善"]=true},
    }
    sfomal(date)
    gg.toast("一键100000大招能量 ojbk")
    end


function dzwlq()
    date={
    {["内存范围"]= gg.REGION_ANONYMOUS},
    {["name"]="大招无冷却"},
    {["搜索数值"]=534530,["类型"]=4,["改善"]=8,["是否改善"]=true},
    {["偏移"]=32,["类型"]=4,["判定结果"]=4},
    {["偏移"]=48,["类型"]=4,["判定结果"]=1},
    {["偏移"]=52,["类型"]=16,["修改结果"]=0,["改善"]=C,["是否改善"]=true},
    {["偏移"]=56,["类型"]=16,["修改结果"]=0,["改善"]=0,["是否改善"]=true},
    }
    sfomal(date)
    gg.toast("大招无冷却 ojbk")
    end


function wxjnnl()
    date={
    {["内存范围"]= gg.REGION_ANONYMOUS},
    {["name"]="一键10000技能能量"},
    {["搜索数值"]=1050253722,["类型"]=4,["改善"]=0,["是否改善"]=true},
    {["偏移"]=8,["类型"]=4,["判定结果"]=8,["改善"]=8,["是否改善"]=true},
    {["偏移"]=-44,["类型"]=16,["修改结果"]=10000,["改善"]=4,["是否改善"]=true},
    {["偏移"]=-48,["类型"]=16,["修改结果"]=10000,["改善"]=8,["是否改善"]=true},
    }
    sfomal(date)
    gg.toast("一键10000技能能量 ojbk")
    end


function jnwlq()
    date={
    {["内存范围"]= gg.REGION_ANONYMOUS},
    {["name"]="技能无冷却"},
    {["搜索数值"]=537602,["类型"]=4,["改善"]=8,["是否改善"]=true},
    {["偏移"]=36,["类型"]=4,["判定结果"]=0,["改善"]=C,["是否改善"]=true},
    {["偏移"]=52,["类型"]=16,["修改结果"]=0,["改善"]=C,["是否改善"]=true},
    {["偏移"]=56,["类型"]=16,["修改结果"]=0,["改善"]=0,["是否改善"]=true},
    }
    sfomal(date)
    gg.toast("技能无冷却 ojbk")
    end
    
    
function zdyxl()
  local MYS=gg.prompt({"输入要修改的血量:"})
  if MYS==nil then Main() elseif MYS~=nil then
    QS=(''..( MYS[1])..'')
    date={
    {["内存范围"]= gg.REGION_ANONYMOUS},
    {["name"]="自定义血量"},
    {["搜索数值"]=1050253722,["类型"]=4,["改善"]=8,["是否改善"]=true},
    {["偏移"]=16,["类型"]=4,["判定结果"]=-1,["改善"]=8,["是否改善"]=true},
    {["偏移"]=8,["类型"]=4,["判定结果"]=2,["改善"]=0,["是否改善"]=true},
    {["偏移"]=-36,["类型"]=16,["修改结果"]=QS,["改善"]=4,["是否改善"]=true},
    {["偏移"]=-32,["类型"]=16,["修改结果"]=QS,["改善"]=8,["是否改善"]=true},
    }
    sfomal(date)
    gg.toast("自定义血量 ojbk")
    end end
    
    
    
    
    
    
    




function Exit()
  bqt={"☄️𝑌𝑜𝑢𝑟 𝑙𝑜𝑣𝑒 𝑔𝑖𝑣𝑒𝑠 𝑚𝑒 𝑡ℎ𝑒 𝑓𝑒𝑒𝑙𝑖𝑛𝑔 𝑡ℎ𝑎𝑡 𝑡ℎ𝑒 𝑏𝑒𝑠𝑡 𝑖𝑠 𝑠𝑡𝑖𝑙𝑙 𝑎ℎ𝑒𝑎𝑑。你的爱让我相信我们的未来会更好☄️","••.•´¯`•.••   🎀我与春风携过客，你携秋水揽星河🎀   ••.•`¯´•.••","生活很苦🍒幸好你足够甜ʚ 💗ིྀ ɞ","🌺人世间有百媚千红，唯独☄️你是我情之所钟。","🌈 ᶫᵒᵛᵉᵧₒᵤ 🌈✨我喜欢的样子你都有❤️","今天的天气🌹不错，风很温柔，你很甜🌸","🌴万般皆苦，唯有自渡。","青丝三千🧊，抵不过时间；倾城容颜，抵不过岁月；如花美眷🧃，抵不过流年。","竹坞无🏝️尘水槛情，相思迢递隔重城，秋阴不散霜🏖️飞晚，留得枯荷听雨声。","🌌春深花浅笑，秋浓叶忧伤，夜月一帘梦，春风十里情。",".风很温柔🌈，水很清澈，花很鲜艳，你很特别🌼。早","🌸真正的爱情不在于你知道他（她）🌹有多好才要在一起；而是明知道他（她）有太多的不好还是不愿🥀离开。","髻子🍃伤春慵更梳。晚风🌪️庭院落梅初。淡云来往月疏疏。玉鸭熏炉闲瑞脑，朱樱斗帐🌱掩流苏。通犀还解辟🌾寒无。","一地薄雨🌧️，满室茶香，心上是你🌌，灯下也是你🌆"}

  local sjbq=bqt[math.random(1,#bqt)]
  gg.alert(sjbq)
  gg.toast('沫以伤制做🍓ʜᴀ͟ᴘ͟ᴘ͟ʏ ᴇᴠᴇʀʏᴅᴀʏ̆̈❤️欢迎下次使用🍹️\n🥂'..year..'年'..month..'月'..day..'日'..hour..'时'..min..'分')
  print("沫以伤制作𝘘𝘘:3253522077☄️")
  os.exit()
end

function HOME()
  lw=1
  Main()
end


while(true)do
  if gg.isVisible(true) then
    XGCK=1
    gg.setVisible(false)
  end
  gg.clearResults()
  if XGCK==1 then
    Main()
  end
end
