
-- 把以上代码复制到你脚本最前面即可



xfcpic="https://fs-im-kefu.7moor-fs1.com/29397395/4d2c3f00-7d4c-11e5-af15-41bf63ae4ea0/1705335463541/%E5%9B%BE%E6%A0%87.png"


gg.isvpn = function()
    local time = os.clock() --记录调用的首次时间 
    local request = gg.makeRequest("网站")
    local time1 = os.clock() - time
    while (
        function()
            if type(request) ~= "table" then
                return string.find(request, "报错返回值") or string.find(request, "不允许访问互联网的返回值")--判断返回值
            end
        end)()    
        and not request["content"] -- 判断返回后是否为nil
        and not request["code"] --判断code是否为nil
        and request["code"] ~= 200 --判断是否请求成功
        and time > 5 --判断请求时间是否正常 
        and (
        function() 
            if not request["content"] then --如果抛出来的是一个nil，那么就赋值
                return 0
            else
                return #request["content"]--否则抛出总长度
            end 
        end)() < 2000 do
        return true--有异常为true
    end                
    return false--正常走出则为false
end

function setvalue(address,flags,value) 
local CatWill={} 
CatWill[1]={} 
CatWill[1].address=address 
CatWill[1].flags=flags 
CatWill[1].value=value 
gg.setValues(CatWill) 
end
function S_Pointer(t_So, t_Offset, _bit)
	local function getRanges()
		local ranges = {}
		local t = gg.getRangesList('^/data/*.so*$')
		for i, v in pairs(t) do
			if v.type:sub(2, 2) == 'w' then
				table.insert(ranges, v)
			end
		end
		return ranges
	end
	local function Get_Address(N_So, Offset, ti_bit)
		local ti = gg.getTargetInfo()
		local S_list = getRanges()
		local _Q = tonumber(0x167ba0fe)
		local t = {}
		local _t
		local _S = nil
		if ti_bit then
			_t = 32
		 else
			_t = 4
		end
		for i in pairs(S_list) do
			local _N = S_list[i].internalName:gsub('^.*/', '')
			if N_So[1] == _N and N_So[2] == S_list[i].state then
				_S = S_list[i]
				break
			end
		end
		if _S then
			t[#t + 1] = {}
			t[#t].address = _S.start + Offset[1]
			t[#t].flags = _t
			if #Offset ~= 1 then
				for i = 2, #Offset do
					local S = gg.getValues(t)
    					t = {}
    					for _ in pairs(S) do
    						if not ti.x64 then
    							S[_].value = S[_].value & 0xFFFFFFFF
    						end
    						t[#t + 1] = {}
    						t[#t].address = S[_].value + Offset[i]
    						t[#t].flags = _t
    					end
    				end
			end
			_S = t[#t].address
		end
		return _S
	end
	local _A = string.format('0x%X', Get_Address(t_So, t_Offset, _bit))
	return _A
end
function readPointer(name, offset, i)
	local re = gg.getRangesList(name)
	local x64 = gg.getTargetInfo().x64
	local va = {[true] = 32, [false] = 4}
	if re[i or 1] then
		local addr = re[i or 1].start + offset[1]
		for i = 2, #offset do
			addr = gg.getValues({{address = addr, flags = va[x64]}})
			if not x64 then
				addr[1].value = addr[1].value & 0xFFFFFFFF
			end
			addr = addr[1].value + offset[i]
		end
		return addr
	end
end
--基址配置


local json =json--调用
local g = {}
g.file = gg.getFile()
g.sel = nil
gqlb={"请先搜索歌曲",}
idb={"1010"}
SN,gc=1,nil
g.config = gg.getFile():gsub("%lua$", "").."cfg"
function bei()
g.data = loadfile("音乐配置"..g.config)
if g.data ~= nil then
g.sel = g.data()
g.data = nil
end
if g.sel == nil then
g.sel = {"","10"}
end
end
bei()
function start(name,sl)
fw=gg.makeRequest("http://music.163.com/api/search/get?s="..name.."&type=1&offset=0&total=true&limit="..sl) return fw end
function play(id,name)
gg.toast("正在播放音乐："..name,true)
gg.playMusic("http://music.163.com/song/media/outer/url?id="..id..".mp3") end

function Play(gqlb,idb)
SN = gg.choice(gqlb,nil,ts) if SN == nil then XGCK =-1 else sn=gg.choice({"播放歌曲","播放并下载"},nil,"歌曲："..gqlb[SN]) if sn == nil then end if sn == 1 then play(idb[SN],gqlb[SN]) end if sn == 2 then
local XEY=gg.makeRequest("http://music.163.com/song/media/outer/url?id="..idb[SN]..".mp3").content local XEY1=gg.getFile():gsub("[^/]+$","")..gqlb[SN]..".mp3" io.open(XEY1,"w"):write(XEY) gg.alert("提示:\n\n音乐已成功下载位置:\n\n"..XEY1) end XGCK=-1 end end

function zjson(jsonr)
local str = jsonr local pattern = "\"[%w]+\":" string.gsub(str, pattern, function(v) if string.find(str, v) then str = string.gsub(str, v, string.gsub(v, "\"", "")) end end) str = string.gsub(str, ":", "=") str = string.gsub(str, "%[", "{") str = string.gsub(str, "%]", "}") local data = "-- WSG PRO 1.0.9(109)\nreturn " .. str local res = load(data)() return res end

function json(con)
res=zjson(con) zd=res.result.songCount pd=go3-zd if pd <= 0 then else go3=zd end ts="《"..go1.."》找到"..zd.."首歌曲，当前显示"..go3.."首" gqlb={} idb={} for i=1,go3 do gqlb[i]=res.result.songs[i].name idb[i]=res.result.songs[i].id
end end
---+音乐配置



hzs = {}
local hzs = hzs
local android = import('android.*')
function write(fileName, content)
if file.write(fileName, content) == false then gg.alert("请给框架和修改器 文件储存权限\n否则无法正常运行") os.exit() end
end
function panduan(rec) fille,err = io.open(rec) if fille == nil then return false else return true end end
function pdcf(lujing) rec = "/sdcard/PMK参数文件夹/配置文件/"..lujing fille,err = io.open(rec) if fille == nil then return false else return true end end
sleep = gg.sleep
function read(fileName) f = assert(io.open(fileName, 'r')) content = f:read("*all") f:close() return content end
function wtcf(lujing,neirong)
write("/sdcard/PMK参数文件夹/配置文件/"..lujing,neirong)
end
function rdcf(lujing)
return read("/sdcard/PMK参数文件夹/配置文件/"..lujing)
end
function pmusic(x) if audiokg == "开" then tmp1 = 0 gg.playMusic(x) tmp1 = 1 end end
if pdcf("audio") ~= true then wtcf("audio","开") end
audiokg = rdcf("audio")
function camusic(ress)
tmp1 = 0
if audiokg == "开" then
if panduan("/sdcard/PMK参数文件夹/音频/"..ress) == true then
pmusic("/sdcard/PMK参数文件夹/音频/"..ress)
tmp1 = 1
else
	download("https://escape2020-1303126286.cos.ap-shenzhen-fsi.myqcloud.com/"..ress ,"/sdcard/PMK参数文件夹/音频/"..ress)
pmusic("/sdcard/PMK参数文件夹/音频/"..ress)
tmp1 = 1
end
end
end
开 = "开" 关 = "关"
function checkimg(tmp)
if panduan("/sdcard/PMK参数文件夹/图片/"..tmp) ~= true then
gg.toast("正在下载资源"..tmp.."\n请耐心等待")
download("https://escape2020-1303126286.cos.ap-shenzhen-fsi.myqcloud.com/"..tmp,"/sdcard/PMK参数文件夹/图片/"..tmp)
end
end
file.getdirs("/sdcard/PMK参数文件夹/状态读取/")
ckimg = {
	"dz3logo",
	"pink",
	"blue",
	"check1",
	"check2",
	"exit",
}
for i = 1,#ckimg do
jindu = i
checkimg(ckimg[i])
end
context = app.context
window = context:getSystemService("window") -- 获取窗口管理器
function getLayoutParams()
LayoutParams = WindowManager.LayoutParams
layoutParams = luajava.new(LayoutParams)
	if (Build.VERSION.SDK_INT >= 26) then -- 设置悬浮窗方式
		layoutParams.type = LayoutParams.TYPE_APPLICATION_OVERLAY
		else
		layoutParams.type = LayoutParams.TYPE_PHONE
	end

layoutParams.format = PixelFormat.RGBA_8888 -- 设置背景
layoutParams.flags = LayoutParams.FLAG_NOT_FOCUSABLE -- 焦点设置Finish
layoutParams.gravity = Gravity.TOP|Gravity.LEFT -- 重力设置
layoutParams.width = LayoutParams.WRAP_CONTENT -- 布局宽度
layoutParams.height = LayoutParams.WRAP_CONTENT -- 布局高度

return layoutParams
end
function getj6()
jianbian6 = luajava.new(GradientDrawable)
jianbian6:setCornerRadius(20)
jianbian6:setGradientType(GradientDrawable.LINEAR_GRADIENT)
jianbian6:setColors({0x33000000,0x33000000})
jianbian6:setStroke(4,"0xdd282F4B")--边框宽度和颜色
return jianbian6
end
slctb2 = luajava.loadlayout({
	GradientDrawable,
	color = "#7f7fd5",
	cornerRadius = 10
})
function getseekgra()
jianbians = luajava.new(GradientDrawable)
jianbians:setCornerRadius(20)
jianbians:setGradientType(GradientDrawable.LINEAR_GRADIENT)
jianbians:setColors({0x667f7fd5,0x667f7fd5})
jianbians:setStroke(2,"0x44000000")--边框宽度和颜色

return jianbians
end
slctb=getseekgra()
slcta = luajava.loadlayout({
	GradientDrawable,
	color = "#282F4B",
	cornerRadius = 20
})
slctc = luajava.loadlayout {
	GradientDrawable,
	color = "#11ffffff",
	cornerRadius = 8
}
slctd = luajava.loadlayout {
	GradientDrawable,
	color = "#55ffffff",
	cornerRadius = 8
}
slcte = luajava.loadlayout {
	GradientDrawable,
	color = "#11ffffff",
	cornerRadius = 12
}
slctf = luajava.loadlayout {
	GradientDrawable,
	color = "#aa1E1C27",
	cornerRadius = 12
}
function getSelector3()
jianbians = luajava.new(GradientDrawable)
jianbians:setCornerRadius(10)
jianbians:setGradientType(GradientDrawable.LINEAR_GRADIENT)
jianbians:setColors({0x667f7fd5,0x667f7fd5})
jianbians:setStroke(2,"0x44000000")--边框宽度和颜色

selector = luajava.getStateListDrawable()
selector:addState({
	android.R.attr.state_pressed
}, luajava.loadlayout {
	GradientDrawable,
	color = "#88000000",
	cornerRadius = 12
}) -- 点击时候的背景
selector:addState({
	android.R.attr.state_pressed
}, slctf) -- 没点击的背景
return selector
end
function getSelector()
selector = luajava.getStateListDrawable()
selector:addState({
	android.R.attr.state_pressed
}, slcta) -- 点击时候的背景
selector:addState({
	-android.R.attr.state_pressed
}, slctb) -- 没点击的背景
return selector
end
function getSelector2()
selector = luajava.getStateListDrawable()
selector:addState({
	android.R.attr.state_pressed
}, slctd) -- 点击时候的背景
selector:addState({
	-android.R.attr.state_pressed
}, slctc) -- 没点击的背景
return selector
end

jianbian = luajava.new(GradientDrawable)
jianbian:setCornerRadius(30)
jianbian:setGradientType(GradientDrawable.LINEAR_GRADIENT)
jianbian2 = luajava.new(GradientDrawable)
jianbian2:setCornerRadius(30)
jianbian2:setGradientType(GradientDrawable.LINEAR_GRADIENT)

local isswitch
YoYoImpl = luajava.getYoYoImpl()
hzs.menu = function(sview)
if isswitch then
return false
end
isswitch = true
cebian ={
	LinearLayout,
	id = "侧边",
	visibility = "gone",
	layout_height = "250dp",
	layout_width = "68dp",
	orientation = "vertical",
	background = {
		GradientDrawable,
		color = "#00ffffff",
		cornerRadius = 10
	},
}
gund=	{LinearLayout,
		orientation="vertical",
		
		
	}
for i=1,#stab do
	gund[#gund+1]={
		LinearLayout,
		id = "jm"..i,
		layout_height = "28dp",
		layout_width = "68dp",
		layout_marginTop = "3dp",
		layout_marginBottom = "3dp",
		background=getSelector(),
		{
			TextView,
			gravity="center",
			text = stab[i][1],
			layout_height = "28dp",
			layout_width = "68dp",
			onClick=function() 切换(i) end
		}}
end
cebian[#cebian+1]={ScrollView,
	layout_height = "190dp",
		layout_width = "68dp",
		gund}
cebian[#cebian+1]={
		ImageView,
		id = "exit",
		src = "/sdcard/PMK参数文件夹/图片/exit",
		layout_width = "20dp",
		layout_height = "20dp",
		layout_marginTop = "10dp",
		layout_marginLeft = "14dp",
	}
cebian=luajava.loadlayout(cebian)
for i=1,#stab do
_ENV["layout"..i] = luajava.loadlayout({
	ScrollView,
	fillViewport = "true",
	padding = "10dp",
	id = "layout"..i,
	visibility = "gone",
	layout_width = "250dp",
	layout_height = "250dp",
	orientation = "horizontal",
	{
		LinearLayout,
		id = "layoutm"..i,
		background = getj6(),
		gravity = "top",
		layout_width = "210dp",
		orientation = "vertical",
		gravity = "center_horizontal",
	}
})
end
ckou = {
	LinearLayout,
	id = "chuangk",
	visibility = "gone",
	layout_width = "wrap_content",
	layout_height = "match_parent",
	orientation = "horizontal",
	cebian,
}
for i=1,#stab do
	ckou[#ckou+1]=_ENV["layout"..i]
end
ckou=luajava.loadlayout(ckou)
title = luajava.loadlayout({
	TextView,
	id = "title",
	textColor="#282F4B",
	visibility = "gone",
	text = stab[1][2],
	gravity = "center",
	textSize = "24sp",
	layout_marginLeft = "30dp",
	layout_width = "fill_parent",
})
floatWindow = {
	LinearLayout,
	id = "motion",
	layout_width = "wrap_content",
	orientation = "vertical",
	gravity = "center_vertical",
	layout_height = "wrap_content",
	{
		LinearLayout,
		layout_width = "match_parent",
		layout_height = "wrap_content",
		orientation = "horizontal",
		gravity = "center_vertical",
		{
			LinearLayout,
			layout_width = "48dp",
			layout_height = "wrap_content",
			layout_marginLeft = "0dp",
			layout_marginTop = "6dp",
			layout_marginBottom = "2dp",
			gravity = "center", {
				ImageView,
				id = "control",
				background = xfcpic,
				layout_width = "40dp",
				layout_height = "40dp",
			}},
		title,
	},
	ckou
}
local function invoke()
local ok
local RawX, RawY, x, y
mainLayoutParams = getLayoutParams()
floatWindow = luajava.loadlayout(floatWindow)
local function invoke2()
block('start')
for k=1,#stab do
for i = 1,#sview[k] do
_ENV["layoutm"..k]:addView(sview[k][i])
end
end

window:addView(floatWindow, mainLayoutParams)
block('end')
end

local runnable = luajava.getRunnable(invoke2)
local handler = luajava.getHandler()
handler:post(runnable)
block('join')
control.onClick = function()
隐藏()
end
exit.onClick = function()
gg.toast("悬浮窗已退出")
window:removeView(floatWindow)
luajava.setFloatingWindowHide(false)
luajava.newThread(function() os.exit() end):start()
bloc("end")
end

local isMove

hanshu = function(v, event)
local Action = event:getAction()
if Action == MotionEvent.ACTION_DOWN then
isMove = false
RawX = event:getRawX()
RawY = event:getRawY()
x = mainLayoutParams.x
y = mainLayoutParams.y
elseif Action == MotionEvent.ACTION_MOVE then
isMove = true
mainLayoutParams.x = tonumber(x) + (event:getRawX() - RawX)
mainLayoutParams.y = tonumber(y) + (event:getRawY() - RawY)
window:updateViewLayout(floatWindow, mainLayoutParams)
end
end
motion.onTouch = hanshu
control.onTouch = hanshu
exit.onTouch = hanshu
for i=1,#stab do
_ENV["jm"..i].onTouch = hanshu
end
end

invoke(swib1,swib2)
jm1:setBackground(slcta)
gg.setVisible(false)
luajava.setFloatingWindowHide(true)

end
corbk = true
当前ui = 1
function 切换(x)
当前ui = x
	luajava.runUiThread(function()
		for i=1,#stab do
			_ENV["jm"..i]:setBackground(slctb)
			_ENV["layout"..i]:setVisibility(View.GONE)
		end
		title:setText(stab[当前ui][2])
		_ENV["layout"..当前ui]:setVisibility(View.VISIBLE)
		_ENV["jm"..当前ui]:setBackground(slcta)
		YoYoImpl:with("FadeIn"):duration(200):playOn(_ENV["layout"..当前ui])
	end)
end
显示 = 0
beij = luajava.new(GradientDrawable)
beij:setCornerRadius(40)
beij:setGradientType(GradientDrawable.LINEAR_GRADIENT)
beij:setColors(({0xdd91EAE4,0xaa86A8E7,0xdd7f7fd5}))
beij:setStroke(0,"0x44FFffff")--边框宽度和颜色

beij2 = luajava.loadlayout({
	GradientDrawable,
	color = "#001E1C27",
	cornerRadius = 10
})
function getcolor(cl)
cl[1] = tonumber(math.ceil(cl[1]*2.6,0,5))

if cl[1] > 255 then cl[1] = "0xff" else
	cl[1] = "0x"..string.format("%x",cl[1]) end
for i = 1,3 do
cl[i+1] = string.format("%x",cl[i+1])
if string.len(cl[i+1]) == 1 then cl[i+1] = "0"..cl[i+1] end
end
cl = cl[1]..cl[2]..cl[3]..cl[4]
return cl
end
function getrgb(cl)
if string.sub(cl,1,1) == "#" then cl = "0x"..string.sub(cl,2,-1) end
cl = {
	tonumber(string.sub(cl,0,4)),tonumber("0x"..string.sub(cl,5,6)),tonumber("0x"..string.sub(cl,7,8))}
return cl
end
function 隐藏()
luajava.runUiThread(function()
control:setBackground(luajava.getBitmapDrawable(xfcpic))
	if tonumber(tostring(cebian:getVisibility())) == 8.0 then
		chuangk:setVisibility(View.VISIBLE)
		cebian:setVisibility(View.VISIBLE)
		title:setVisibility(View.VISIBLE)
		mainLayoutParams.flags = LayoutParams.FLAG_NOT_TOUCH_MODAL
		window:updateViewLayout(floatWindow, mainLayoutParams)
		YoYoImpl:with("SlideInDown"):duration(200):playOn(cebian)
		_ENV["layout"..当前ui]:setVisibility(View.VISIBLE)
		YoYoImpl:with("FadeIn"):duration(800):playOn(_ENV["layout"..当前ui])
		floatWindow:setBackground(beij)
	else
		luajava.runUiThread(function()mainLayoutParams.flags = LayoutParams.FLAG_NOT_FOCUSABLE
		window:updateViewLayout(floatWindow, mainLayoutParams)
		end)

control:setBackground(luajava.getBitmapDrawable(xfcpic))
	title:setVisibility(View.GONE)
	floatWindow:setBackground(beij2)
	chuangk:setVisibility(View.GONE)
	cebian:setVisibility(View.GONE)
	_ENV["layout"..当前ui]:setVisibility(View.GONE)
	end
	end)
end
function guid()
seed = {
	'e','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'
}
tb = {}
for i = 1,32 do
table.insert(tb,seed[math.random(1,16)])
end
sid = table.concat(tb)
return string.format('%s%s%s%s%s',
	string.sub(sid,1,8),
	string.sub(sid,10,12),
	string.sub(sid,21,22))
..string.format('%s%s%s%s%s',
	string.sub(sid,1,6),
	string.sub(sid,21,25)
)
end

chazhi={} chajv={}
function hzs.seek(name,bian,smin,smax,nows)
_ENV[bian] =nows
thum=getseekgra()
thum:setSize(60, 60)
smin=tonumber(smin) smax=tonumber(smax)
chajv[bian]=smax-smin
chazhi[bian]=1-smin
if smin==nil then smin=1 smax=10 end
truesmin=1
truesmax=truesmin+chajv[bian]
if not nows then nows = smin tnows=(smin-nows)
else
tnows=(nows-smin)+1
end
if _ENV[bian] == nil then _ENV[bian] = 1.0 end
if not name then name = "未设置" end
local names = name..guid()
rest = luajava.loadlayout({
	LinearLayout,
	layout_width = 'fill_parent',
	layout_hight = "fill_parent",
	{
		LinearLayout,
		layout_width = 'fill_parent',
		layout_hight = "fill_parent",
		layout_marginTop = "5dp",
		layout_marginBottom = "5dp",
		layout_marginLeft = "10dp",
		layout_marginRight = "10dp",
		gravity = "center_vertical",
		background = getseekgra(),
		{
			TextView,
			gravity = "top",
			text = name..":"..nows,
			textColor="#FFFFFF",
			id = luajava.newId(names),
			layout_width = '70dp',
			layout_marginLeft = "5dp",
			layout_marginRight = "0dp",
		},
		{
			SeekBar,
			layout_width = '120dp',
			id=luajava.newId(name.."seekbar"),
			min = truesmin,
			max = truesmax,
			progress=tnows,
			thumb=thum,
			progressHeight="10dp",
			onSeekBarChange = {
				onProgressChanged = function(SeekBar, var2, var3)
				if not var3 then
				return
				end
		  local resultvar=tonumber(string.sub(var2,0,-3))-chazhi[bian]
				luajava.runUiThread(function()
				luajava.getIdValue(names):setText(name..":".. resultvar)
				end)
				_ENV[bian] = resultvar
				end
			}}
	}})
return rest
end


function hzs.switch(name,func1,func2)
if type(func1) == "table" then gg.alert("出现错误\n如果你是用的是旧版\n请将开头第一个chagan.switch改成hzs.menu") gg.copyText("") os.exit() end
local func = 开关(name,func1,func2)
if not name then name = "未设置" end
rest = luajava.loadlayout({
	LinearLayout,
	layout_width = 'fill_parent',
	layout_hight = "fill_parent",
	{
		LinearLayout,
		layout_width = 'fill_parent',
		layout_hight = "fill_parent",
		layout_marginTop = "5dp",
		layout_marginBottom = "5dp",
		layout_marginLeft = "10dp",
		layout_marginRight = "10dp",
		gravity = "center_vertical",
		background = getseekgra(),
		{
			TextView,
			gravity = "top",
			text = name,
			layout_width = '100dp',
			layout_marginLeft = "10dp",
			layout_marginRight = "10dp",
		},
		{
			Switch,
			gravity = "top",
			layout_width = 'match_parent',
			layout_hight = "10dp",
			switchMinWidth = "20dp",
			onCheckedChange = function(Switch,var2,var3)
			if var2 == true then var2 = "开" else var2 = "关" end
			luajava.newThread(function() func() end):start()
			end,

		}}
})

return rest
end
function hzs.edit(name)
_ENV[name] = name..guid()
if not name then name = "点击输入文字" end
rest = luajava.loadlayout({
	LinearLayout,
	layout_width = 'fill_parent',
	layout_hight = "fill_parent",
	{
		LinearLayout,
		layout_width = 'fill_parent',
		layout_hight = "fill_parent",
		layout_marginTop = "5dp",
		layout_marginBottom = "5dp",
		layout_marginLeft = "10dp",
		layout_marginRight = "10dp",
		gravity = "center_vertical",
		background = getseekgra(),
		{
			EditText,
			gravity = "top",
			hint = name,
			gravity="center",
			id = luajava.newId(_ENV[name]),
			layout_width = 'fill',
			layout_marginLeft = "10dp",
			layout_marginRight = "10dp",
		}}
})

return rest
end
function hzs.radio(radio)
firadio = {
	LinearLayout,
	layout_width = 'fill_parent',
	layout_hight = "fill_parent",
	padding="10dp",
	orientation = "vertical"
}
if type(radio[1]) == "string" or type(radio[1]) == "number" then
firadio[#firadio+1] = {
	TextView,text = radio[1]} end
radios = {
	RadioGroup,background = getseekgra(),
	layout_width = 'fill_parent',
}
for i = 2,#radio do
radios[#radios+1] = {
	RadioButton,
	layout_width = 'fill_parent',
	text = radio[i][1],
	onClick = function() luajava.newThread(function() pcall(radio[i][2]) end):start() end,
}
end
firadio[#firadio+1] = radios
return luajava.loadlayout(firadio)
end

function hzs.check(cklist)
rest = {
	LinearLayout,
	layout_width = 'match_parent',
	layout_height = "30dp",
	
	gravity = "center"

}
for i = 1,#cklist do
local name = cklist[i][1]
local func1 = cklist[i][2]
local func2 = cklist[i][3]
local nid = cklist[i][4]
if type(func1) == "table" then gg.alert("出现错误\n如果你是用的是旧版\n请将开头第一个chagan.switch改成hzs.menu") gg.copyText("PMKNB666") os.exit() end
if not name then name = "未设置" end
nid = name..guid()
local func = 开关2(nid,func1,func2,nid)
rstt = luajava.loadlayout({
	LinearLayout,
	layout_width = 'wrap_content',
	layout_height = "30dp",
	layout_marginTop = "5dp",
	layout_marginBottom = "5dp",
	layout_marginLeft = "0dp",
	layout_marginRight = "10dp",
	gravity = "center_vertical",
	onClick = function() luajava.newThread(function() func() end):start() end,

	{ImageView,
	id = luajava.newId(nid),
	layout_width = '20dp',
	layout_height = "20dp",
	background = "/sdcard/PMK参数文件夹/图片/check1",
	},{
		TextView,
		gravity = "top",
		text = name,
		textColor="#ffffff",
		layout_width = 'wrap_content',
		layout_height = 'wrap_content',
		layout_marginLeft = "4dp",
		layout_marginRight = "5dp",
	}})
rest[#rest+1] = rstt
end
return luajava.loadlayout(rest)
end
function hzs.button(txt,func)
if not txt then txt = "未设置" end
return luajava.loadlayout(
	{
		LinearLayout,
		layout_width = 'fill_parent',
		layout_hight = "wrap_content", {
			LinearLayout,
			layout_width = "fill_parent",
			gravity = "center_horizontal",
			layout_marginRight="10dp",
			layout_marginLeft="10dp",
			layout_marginTop = "5dp",
			layout_marginBottom = "5dp",
			background = getSelector3(),
			onClick = function() luajava.newThread(function() pcall(func) end):start() end,
			{
				TextView,
				text = txt,
				textSize = "16sp",
				layout_width = "wrap_content",
			},
		}})
end
function hzs.text(txt,color,size)
if not txt then txt = "未设置文字" end
if not color then color = "#ffffff" end
if not size then size = "18sp" end
return luajava.loadlayout(
	{
		TextView,
		text = txt,
		textSize = size,
		textColor = color,
		layout_width = "wrap_content",
	})
end
corb = true
function hzs.setedit(name,txt)
txt = tostring(txt)
luajava.runUiThread(function()
	luajava.getIdValue(_ENV[name]):setText(txt)
	end)
end

function hzs.getedit(name)
edit = tostring(luajava.getIdValue(_ENV[name]):getText())
return edit
end
function 开关(name,func1,func2)
if func1 == nil then func1 = "" end
if func2 == nil then func2 = "" end
if type(func1) == "function" then
return function()
namers = _ENV[name]
if namers ~= "开" then
_ENV[name] = "开"
pcall(func1)
else
	_ENV[name] = "关"
pcall(func2)
end
end
end
end
function 开关2(name,func1,func2,nid)
if func1 == nil then func1 = "" end
if func2 == nil then func2 = "" end
if type(func1) == "function" then
return function()
namers = _ENV[name]
if namers ~= "开" then
luajava.runUiThread(function()
luajava.getIdValue(nid):setBackground(luajava.getBitmapDrawable("/sdcard/PMK参数文件夹/图片/check2"))
end)
_ENV[name] = "开"
func1()
else
    luajava.runUiThread(function()
	luajava.getIdValue(nid):setBackground(luajava.getBitmapDrawable("/sdcard/PMK参数文件夹/图片/check1"))
end)
_ENV[name] = "关"
func2()
end
end
end
end



function czmk()
nydz={}
wdnydz={}
shzqhnydz={}
shzqhnydz2={}
shzqhnydz3={}
wjiddz={}
gtnydz={}
zijiid={}
jtkgnydz={}
end



function guanbibufenfanzuobi2()
    gg.clearResults()
gg.setRanges(gg.REGION_CODE_APP)
gg.searchNumber(':Quit',gg.TYPE_BYTE,false,gg.SIGN_EQUAL,0, -1)
gg.getResults(100000)
gg.editAll('0',gg.TYPE_BYTE)
end
--关闭部分反作弊2调用函数


wjdz={}
bydz={}
wqdz={}



--判断类型
function LXPD(LX)
  local lx
  if LX == 'A' then
    lx = gg.TYPE_AUTO
   elseif LX == 'D' then
    lx = gg.TYPE_DWORD
   elseif LX == 'F' then
    lx = gg.TYPE_FLOAT
   elseif LX == 'E' then
    lx = gg.TYPE_DOUBLE
   elseif LX == 'W' then
    lx = gg.TYPE_WORD
   elseif LX == 'B' then
    lx = gg.TYPE_BYTE
   elseif LX == 'Q' then
    lx = gg.TYPE_QWORD
   elseif LX == 'X' then
    lx = gg.TYPE_XOR
   else
    lx = gg.TYPE_AUTO
  end
  return lx
end

--判断内存范围
function LCPD(LC)
  local lc
  if LC == 'Jh' then
    lc = gg.REGION_JAVA_HEAP
   elseif LC == 'Ch' then
    lc = gg.REGION_C_HEAP
   elseif LC == 'Ca' then
    lc = gg.REGION_C_ALLOC
   elseif LC == 'Cd' then
    lc = gg.REGION_C_DATA
   elseif LC == 'Cb' then
    lc = gg.REGION_C_BSS
   elseif LC == 'PS' then
    lc = gg.REGION_PPSSPP
   elseif LC == 'A' then
    lc = gg.REGION_ANONYMOUS
   elseif LC == 'J' then
    lc = gg.REGION_JAVA
   elseif LC == 'S' then
    lc = gg.REGION_STACK
   elseif LC == 'As' then
    lc = gg.REGION_ASHMEM
   elseif LC == 'O' then
    lc = gg.REGION_OTHER
   elseif LC == 'B' then
    lc = gg.REGION_BAD
   elseif LC == 'Xa' then
    lc = gg.REGION_CODE_APP
   elseif LC == 'Xs' then
    lc = gg.REGION_CODE_SYS
   else
    lc = 262207
  end
  return lc
end


--主要配置文件
function tzmpy(srcs)
czmk()
  local lscf={}
  local xgpy={}
  local ztzm={}
  if #srcs["参数"][2]==0 then
    gg.clearResults()
    gg.setRanges(LCPD(srcs["参数"][1]))
    gg.searchNumber(srcs["特征"][1][1],LXPD(srcs["特征"][1][2]))
    ztzm=gg.getResults(99999999999)
    srcs["参数"][2]=ztzm
    if #ztzm==0 then
      gg.alert("未搜索到值")
     else
      if #srcs["特征"]>=2 then
        for a=2,#srcs["特征"] do
          for b=1,#ztzm do
            ztzm[b]={address=ztzm[b].address+srcs["特征"][a][1],flags=LXPD(srcs["特征"][a][3]),value=srcs["特征"][a][2]}
          end
          ztzm=gg.getValues(ztzm)
          for b=1,#ztzm do
            if ztzm[b].value==srcs["特征"][a][2] then
              lscf[#lscf+1]={address=ztzm[b].address-srcs["特征"][a][1],flags=LXPD(srcs["特征"][a][3]),value=srcs["特征"][a][2]}
            end
          end
          srcs["参数"][2]=lscf
          ztzm=lscf
          lscf={}
        end
      end
    end
  end
  if #srcs["修改"]~=0 then
    for a=1,#srcs["修改"] do
      for b=1,#srcs["参数"][2] do
        xgpy[#xgpy+1]={address=srcs["参数"][2][b].address+srcs["修改"][a][1],flags=LXPD(srcs["修改"][a][3]),value=srcs["修改"][a][2],freeze=srcs["修改"][a][4]}
      end
      gg.addListItems(xgpy)
      gg.setValues(xgpy)
      xgpy={}
    end
  end
end

--清空所有冻结值
function qksydj()
  local bclb=gg.getListItems()
  for a1=1,#bclb do
    bclb[a1].freeze=false
  end
  local bclb=gg.getValues(bclb)
  gg.addListItems(bclb)
  gg.clearList()
end




function xzyx()
string.toMusic('请选择你要游玩的游戏')
msxz=gg.choice({"官服","TDAU"},nil,"请选择你要游玩的游戏")
end


--[[ 2052        所有枪万能值   冻结崩溃
-0x20   弹夹内子弹数量
-0x74   布尔值，是否全自动
-0x3C   武器后坐力
-0x38   枪左右晃动
-0x50   武器抖动(改100F不抖动)
-0x78   武器伤害
-0x80   开枪间隔(冻结改0)
]]


--[[ 1082130432 偏移0x8自身验证 玩家万能值
-0x18  行走速度
-0x14   奔跑速度
-0x4   跳跃高度  建议60
0x4    下落速度  建议6
0xBC   当前血量

]]
--[[ 65537  65793  两个阵营的怪，偏移0xC后1D验证  怪物万能值
-0x4    当前血量
-0x24   旋转速度
-0x28   跳跃高度
-0x30   奔跑速度
-0x34   行走速度
-0x2C   下落速度
-0x40   一技能CD
-0x3C   二技能CD
-0x38   三技能CD
-0x58   移动速度
]]



function TDAU()

string.toMusic('欢迎使用TDAU主人科技。有bug积极和作者反馈,请不要快速开启和关闭功能，开始功能提示成功之前请不要开启或关闭其他功能。出现bug请重启外挂')


draw3 = require('draw3')
draw3 = require('draw3')
text1 = draw3.text(' ',0,0)
text2 = draw3.text('作者:主人',0,50)
text3 = draw3.text('公益脚本',0,100)
text4 = draw3.text('TDAU适配版',0,150)
text5 = draw3.text('免费公开测试中',0,200)
for i = 1, 4 do--这里改太大可能造成悬浮窗不出来
	gg.sleep(50)
	-- 设置随机颜色
    local color = '#1DF3EE'
    text1.setColor(color)
    local color = '#1DF3EE'
    text2.setColor(color)
    local color = '#1DF3EE'
    text3.setColor(color)
    local color = '#1DF3EE'
    text4.setColor(color)
    local color = '#1DF3EE'
    text5.setColor(color)
    
	-- 更新文本
	text1.update(i)
	text2.update(i)
	text3.update(i)
	text4.update(i)
	text5.update(i)
end

gg.setConfig("隐藏辅助", 23)
gg.setConfig("运行守护", 3)
gg.setConfig("冻结间隔", 1200)
gg.setConfig("旁路模式", 1)


stab={--菜单名字，大标题
	{"公告","公告"},
	{"基础功能","基础功能"},
	{"武器功能","武器功能"},
    {"扮演功能","扮演功能"},
    {"飞天功能","飞天功能"},
    {"娱乐功能","娱乐功能"},
	{"音乐功能","音乐界面"}
}

hzs.menu({{
hzs.text("使用前请先选择进程\n脚本作者:主人\n该版本适配TDAU在我们间的魔鬼\n穿墙控人由CatMix提供","#FFFFFF","15sp"),
hzs.button("🎃选择进程🎃",gg.setProcessX),
hzs.button("🌈重置秒开🌈",function() czmk() end),
hzs.button("😎解除冻结😎",function() qksydj() end),
hzs.button("✨收起页面✨",隐藏),
},
{
hzs.text("玩家功能区","#FFFFFF","15sp"),



hzs.button("自改坐标",
function()
srcs={
  ["参数"]={"Ca",wjdz},
  ["特征"]={
    {16842756,"D"},
    {-0x8,1092616192,"D"},
  },
  ["修改"]={}
}
tzmpy(srcs)
wjdz=srcs["参数"][2]
if #wjdz==0 then
srcs={
  ["参数"]={"Ca",wjdz},
  ["特征"]={
    {16842752,"D"},
    {-0x8,1092616192,"D"},
  },
  ["修改"]={}
}
tzmpy(srcs)
wjdz=srcs["参数"][2]
end

local lscf={}
lscf[1]={address=wjdz[1].address-0x4C,flags=16,value=0}
lscf[2]={address=wjdz[1].address-0x44,flags=16,value=0}
lscf[3]={address=wjdz[1].address-0x3C,flags=16,value=0}
lscf=gg.getValues(lscf)
local zg=gg.prompt({"X轴","Y轴","Z轴","是否冻结X坐标","是否冻结Y坐标","是否冻结Z坐标"},{lscf[1].value,lscf[2].value,lscf[3].value,false,false,false},{"number","number","number","checkbox","checkbox","checkbox"})

srcs={
  ["参数"]={"Ca",wjdz},
  ["特征"]={
    {16842756,"D"},
    {-0x8,1092616192,"D"},
  },
  ["修改"]={
    {-0x4C,zg[1],"F",zg[4]},
    {-0x44,zg[2],"F",zg[5]},
    {-0x3C,zg[3],"F",zg[6]},
  },
}
tzmpy(srcs)
wjdz={}
end),



hzs.button("一键强化体质",
function()
string.toMusic('体质强化中')
srcs={
  ["参数"]={"A",wjdz},
  ["特征"]={
    {1082130432,"D"},
    {0x8,1082130432,"D"},
  },
  ["修改"]={
    {0x4,6,"F",false},
    {-0x4,60,"F",false},
    {0xBC,2147483647,"D",false},
    {0x94,0,"F",false},
    {0xC8,0,"F",false},
    {-0x10,50,"F",false},
    {-0xC,50,"F",false},
  }
}
tzmpy(srcs)
string.toMusic('体质强化成功')
gg.toast("❤️体质强化成功❤️")
end),



hzs.button("关闭受伤血液",
function()
string.toMusic('关闭受伤血液开启中')
srcs={
  ["参数"]={"A",wjdz},
  ["特征"]={
    {1082130432,"D"},
    {0x8,1082130432,"D"},
  },
  ["修改"]={
    {0x94,0,"F",false},
    {0xC8,0,"F",false},
  }
}
tzmpy(srcs)
string.toMusic('关闭受伤血液开启成功')
gg.toast("❤️关闭受伤血液开启成功❤️")
end
),


hzs.switch("人物穿墙",
function()
nydz={}
srcs={
  ["参数"]={"Ca",nydz},
  ["特征"]={
    {16842756,"D"},
    {-0x8,1092616192,"D"},
  },
  ["修改"]={
    {0xC,-0.04,"F",false},
  },
}
tzmpy(srcs)
string.toMusic('穿墙开启成功')
gg.toast("❤️穿墙开启成功❤️")
end,

function()
string.toMusic('穿墙关闭中')
nydz={}
srcs={
  ["参数"]={"Ca",nydz},
  ["特征"]={
    {16842756,"D"},
    {-0x8,1092616192,"D"},
  },
  ["修改"]={
    {0xC,0.25,"F",false},
  },
}
tzmpy(srcs)
string.toMusic('穿墙关闭成功')
gg.toast("❤️穿墙关闭成功❤️")
end),

hzs.switch("自改高跳",
function()
local zg=gg.prompt({"自定义高跳高度\n建议用10倍"},{10})
string.toMusic('自改高跳开启中')
local xg=zg[1]*6
srcs={
  ["参数"]={"A",wjdz},
  ["特征"]={
    {1082130432,"D"},
    {0x8,1082130432,"D"},
  },
  ["修改"]={
    {0x4,6,"F",false},
    {-0x4,xg,"F",false},
  }
}
tzmpy(srcs)

string.toMusic('自改高跳开启成功')
gg.toast("❤️自改高跳开启成功❤️")
end,

function()
string.toMusic('自改高跳关闭中')
srcs={
  ["参数"]={"A",wjdz},
  ["特征"]={
    {1082130432,"D"},
    {0x8,1082130432,"D"},
  },
  ["修改"]={
    {0x4,2,"F",false},
    {-0x4,6,"F",false},
  }
}
tzmpy(srcs)

string.toMusic('自改高跳关闭成功')
gg.toast("❤️自改高跳关闭成功❤️")
end),






hzs.switch('自改血量',
function()
guanbibufenfanzuobi2()
local LLL=gg.prompt({"自定义血量"},{2147483647})
srcs={
  ["参数"]={"A",wjdz},
  ["特征"]={
    {1082130432,"D"},
    {0x8,1082130432,"D"},
  },
  ["修改"]={
    {0xBC,LLL[1],"D",false},
  }
}
tzmpy(srcs)

gg.playMusic("https://dict.youdao.com/dictvoice?audio=自改血量开启成功&le=zh")
gg.toast("❤️自改血量开启成功❤️")
end,

function()
	gg.playMusic("https://dict.youdao.com/dictvoice?audio=自改血量关闭中&le=zh")
srcs={
  ["参数"]={"A",wjdz},
  ["特征"]={
    {1082130432,"D"},
    {0x8,1082130432,"D"},
  },
  ["修改"]={
    {0xBC,100,"D",false},
  }
}
tzmpy(srcs)

gg.playMusic("https://dict.youdao.com/dictvoice?audio=自改血量关闭成功&le=zh")
gg.toast("❤️自改血量关闭成功❤")
end
),



hzs.switch('自改加速',
function()
beishu=gg.prompt({"自定义移动倍速"},{10})
beishuzhi=10*beishu[1]
gg.playMusic("https://dict.youdao.com/dictvoice?audio=自改加速开启中&le=zh")
srcs={
  ["参数"]={"A",wjdz},
  ["特征"]={
    {1082130432,"D"},
    {0x8,1082130432,"D"},
  },
  ["修改"]={
    {-0x10,beishuzhi,"F",false},
    {-0xC,beishuzhi,"F",false},
  }
}
tzmpy(srcs)

gg.playMusic("https://dict.youdao.com/dictvoice?audio=自改加速开启成功&le=zh")
gg.toast("❤️♡自改加速开启成功♡❤️")
end,

function()
gg.playMusic("https://dict.youdao.com/dictvoice?audio=自改加速关闭成功&le=zh")
srcs={
  ["参数"]={"A",wjdz},
  ["特征"]={
    {1082130432,"D"},
    {0x8,1082130432,"D"},
  },
  ["修改"]={
    {-0xC,4,"F",false},
    {-0x10,8,"F",false},
  }
}
tzmpy(srcs)

gg.playMusic("https://dict.youdao.com/dictvoice?audio=自改加速关闭成功&le=zh")
gg.toast("❤️♡自改加速关闭成功♡❤️")
end
),
},



{
hzs.text("武器功能区","#FFFFFF","15sp"),--空文本可用于换行，sp调整距离
hzs.button('一键全枪强化',
function()
gg.playMusic("https://dict.youdao.com/dictvoice?audio=全枪强化开启中&le=zh")
srcs={
  ["参数"]={"A",wqdz},
  ["特征"]={
    {2052,"D"},
    {0x4,1,"D"},
  },
  ["修改"]={
    {-0x20,2147483647,"D",false},
    {-0x74,1,"D",false},
    {-0x3C,0,"F",false},
    {-0x38,0,"F",false},
    {-0x50,100,"F",false},
    {-0x78,-100000,"D",false},
    {-0x80,0,"F",false},
  },
}
tzmpy(srcs)

gg.playMusic("https://dict.youdao.com/dictvoice?audio=全枪强化开启成功&le=zh")
gg.toast("❤️全枪强化开启成功❤️")
end),


hzs.button('无限子弹',
function()
gg.playMusic("https://dict.youdao.com/dictvoice?audio=无限子弹开启中&le=zh")
srcs={
  ["参数"]={"A",wqdz},
  ["特征"]={
    {2052,"D"},
    {0x4,1,"D"},
  },
  ["修改"]={
    {-0x20,2147483647,"D",false},
  },
}
tzmpy(srcs)

gg.playMusic("https://dict.youdao.com/dictvoice?audio=无限子弹开启成功&le=zh")
gg.toast("❤️无限子弹开启成功❤️")
end),


hzs.button('超级秒杀',
function()
gg.playMusic("https://dict.youdao.com/dictvoice?audio=超级秒杀开启中&le=zh")
srcs={
  ["参数"]={"A",wqdz},
  ["特征"]={
    {2052,"D"},
    {0x4,1,"D"},
  },
  ["修改"]={
    {-0x78,2147483647,"D",false},
  },
}
tzmpy(srcs)

gg.playMusic("https://dict.youdao.com/dictvoice?audio=超级秒杀开启成功&le=zh")
gg.toast("❤️超级秒杀开启成功❤️")
end),


hzs.button('负伤害',
function()
gg.playMusic("https://dict.youdao.com/dictvoice?audio=负伤害开启中&le=zh")
srcs={
  ["参数"]={"A",wqdz},
  ["特征"]={
    {2052,"D"},
    {0x4,1,"D"},
  },
  ["修改"]={
    {-0x78,-2147483647,"D",false},
  },
}
tzmpy(srcs)

gg.playMusic("https://dict.youdao.com/dictvoice?audio=负伤害开启成功&le=zh")
gg.toast("❤️负伤害开启成功❤️")
end),


hzs.button('武器全自动',
function()
string.toMusic('武器全自动开启中')
srcs={
  ["参数"]={"A",wqdz},
  ["特征"]={
    {2052,"D"},
    {0x4,1,"D"},
  },
  ["修改"]={
    {-0x74,1,"D",false},
  },
}
tzmpy(srcs)

string.toMusic('武器全自动开启成功')
gg.toast("❤️武器全自动开启成功❤️")
end),

hzs.button('无后座',
function()
string.toMusic('无后座开启中')
srcs={
  ["参数"]={"A",wqdz},
  ["特征"]={
    {2052,"D"},
    {0x4,1,"D"},
  },
  ["修改"]={
    {-0x3C,0,"F",false},
  },
}
tzmpy(srcs)

string.toMusic('无后座开启成功')
gg.toast("❤️无后座开启成功❤️")
end),


hzs.button('防抖',
function()
string.toMusic('防抖开启中')
srcs={
  ["参数"]={"A",wqdz},
  ["特征"]={
    {2052,"D"},
    {0x4,1,"D"},
  },
  ["修改"]={
    {-0x38,0,"F",false},
    {-0x50,100,"F",false},
  },
}
tzmpy(srcs)

string.toMusic('防抖开启成功')
gg.toast("❤️防抖开启成功❤️")
end),

hzs.switch('武器连发',
function()
string.toMusic('武器连发开启中')
srcs={
  ["参数"]={"A",wqdz},
  ["特征"]={
    {2052,"D"},
    {0x4,1,"D"},
  },
  ["修改"]={
    {-0x80,0,"F",true},
  },
}
tzmpy(srcs)

string.toMusic('武器连发开启成功')
gg.toast("❤️武器连发开启成功❤️")
end,
function()
string.toMusic('武器连发关闭中')
srcs={
  ["参数"]={"A",wqdz},
  ["特征"]={
    {2052,"D"},
    {0x4,1,"D"},
  },
  ["修改"]={
    {-0x80,0,"F",false},
  },
}
tzmpy(srcs)

string.toMusic('武器连发关闭成功')
gg.toast("❤️武器连发关闭成功❤️")
end
),
},



{
hzs.text("扮演功能区","#FFFFFF","15sp"),--空文本可用于换行，sp调整距离
hzs.button("部分扮演怪物强化",
function()
local zg=gg.prompt(
{"血量","移速","下落速度","跳跃高度","所有技能CD","移动释放技能","秒旋转"},
{"2147483647","10","-48","20","0",true,true},
{"number","number","number","number","number","checkbox","checkbox"})
zg[2]=zg[2]*8
if zg[6]==true then jn1=0 jn2=0 jn3=0 else jn1=2.05 jn2=1.1 jn3=2 end
if zg[7]==true then mxz=0 else mxz=0.2 end
wjdz={}
srcs={
  ["参数"]={"A",wjdz},
  ["特征"]={
    {1073741824,"D"},
    {0x50,1,"D"},
    {0x28,1036831949,"D"},
  },
  ["修改"]={
    {0x4,zg[5],"F",false},--1技能cd    1F
    {0x8,zg[5],"F",false},--2技能cd    1F
    {0xC,zg[5],"F",false},--3技能cd    15F
    {-0x4,jn1,"F",false},--          2.05F
    {-0x8,jn2,"F",false},--          1.1F
    {-0xC,jn3,"F",false},--          2F
    {0x10,zg[2],"F",false},--走路速度   4F
    {0x14,zg[2],"F",false},--奔跑速度   8F
    {0x18,zg[3],"F",false},--下落速度   -16F
    {0x1C,zg[4],"F",false},--跳跃高度   2F
    {0x20,mxz,"F",false},--秒旋转     0.2F
    {0x40,zg[1],"D",false},--当前血量   15000D
  },
}
tzmpy(srcs)
end),
},

{
hzs.text("飞天功能区","#FFFFFF","15sp"),
hzs.radio({"飞天",
{"升2",
function()
srcs={
  ["参数"]={"A",wjdz},
  ["特征"]={
    {1082130432,"D"},
    {0x8,1082130432,"D"},
  },
  ["修改"]={
    {0x4,-1,"F",false},
    {-0x4,0.05,"F",false},
  }
}
tzmpy(srcs)

string.toMusic('升')
end
},
{"升1",
function()
srcs={
  ["参数"]={"A",wjdz},
  ["特征"]={
    {1082130432,"D"},
    {0x8,1082130432,"D"},
  },
  ["修改"]={
    {0x4,-0.5,"F",false},
    {-0x4,0.05,"F",false},
  }
}
tzmpy(srcs)

string.toMusic('升')
end
},
{"定点",
function()
srcs={
  ["参数"]={"A",wjdz},
  ["特征"]={
    {1082130432,"D"},
    {0x8,1082130432,"D"},
  },
  ["修改"]={
    {0x4,0,"F",false},
    {-0x4,0.05,"F",false},
  }
}
tzmpy(srcs)

string.toMusic('定')
end
},
{"降1",
function()
srcs={
  ["参数"]={"A",wjdz},
  ["特征"]={
    {1082130432,"D"},
    {0x8,1082130432,"D"},
  },
  ["修改"]={
    {0x4,0.5,"F",false},
    {-0x4,0.05,"F",false},
  }
}
tzmpy(srcs)

string.toMusic('降')
end
},
{"降2",
function()
srcs={
  ["参数"]={"A",wjdz},
  ["特征"]={
    {1082130432,"D"},
    {0x8,1082130432,"D"},
  },
  ["修改"]={
    {0x4,1,"F",false},
    {-0x4,0.05,"F",false},
  }
}
tzmpy(srcs)

string.toMusic('降')
end
},

{"恢复",
function()
srcs={
  ["参数"]={"A",wjdz},
  ["特征"]={
    {1082130432,"D"},
    {0x8,1082130432,"D"},
  },
  ["修改"]={
    {0x4,2,"F",false},
    {-0x4,6,"F",false},
  }
}
tzmpy(srcs)

string.toMusic('恢复')
end
},
}
),


hzs.switch("自改飞天",
function()
local zgzhi=gg.prompt({"自改飞天\n整数下落，负数上升"},{0})
string.toMusic('自改飞天开启中')
srcs={
  ["参数"]={"A",wjdz},
  ["特征"]={
    {1082130432,"D"},
    {0x8,1082130432,"D"},
  },
  ["修改"]={
    {0x4,zgzhi[1],"F",false},
    {-0x4,0.05,"F",false},
  }
}
tzmpy(srcs)

string.toMusic('自改飞天开启成功')
gg.toast("❤️自改飞天成功❤️")
end,

function()
string.toMusic('自改飞天关闭中')
srcs={
  ["参数"]={"A",wjdz},
  ["特征"]={
    {1082130432,"D"},
    {0x8,1082130432,"D"},
  },
  ["修改"]={
    {0x4,2,"F",false},
    {-0x4,6,"F",false},
  }
}
tzmpy(srcs)

string.toMusic('自改飞天关闭成功')
gg.toast("❤️自改飞天关闭成功❤️")
end
),

},



{
hzs.text("娱乐功能区","#FFFFFF","15sp"),--空文本可用于换行，sp调整距离

hzs.button("修改皮肤商店货币",
function()
local zg=gg.prompt({"请输入你要修改的货币数量"},{114514520})
string.toMusic('皮肤商店货币修改中')
srcs={
  ["参数"]={"Jh",wjdz},
  ["特征"]={
    {115,"D"},
    {-0xC,10,"D"},
    {0x8,0,"D"},
    {0x10,0,"D"}
  },
  ["修改"]={
    {0xC,zg[1],"D",false}
  },
}
tzmpy(srcs)
string.toMusic('皮肤商店货币修改成功')
gg.toast("❤️皮肤商店货币修改成功❤️")
end),


hzs.button("修改生存货币",
function()
local zg=gg.prompt({"请输入你要修改的货币数量"},{114514520})
string.toMusic('生存货币修改中')
srcs={
  ["参数"]={"A",wjdz},
  ["特征"]={
    {1060418741,"D"},
    {0x4,1065353216,"D"},
    {0x8,1044957385,"D"},
    {0xC,1044957385,"D"}
  },
  ["修改"]={
    {0x1C,zg[1],"D",false}
  },
}
tzmpy(srcs)
string.toMusic('生存货币修改成功')
gg.toast("❤️生存货币修改成功❤️")
end),
},
{
hzs.button('关闭音乐',
function()
string.toMusic('音乐关闭成功')
end),
hzs.button('搜索音乐',
function()
search = gg.prompt({
"输入要搜索的歌曲\n可加上歌手名字",
"设置显示数量(数字)",}
,g.sel,{"text",})
if not search then return end
gg.saveVariable(search,g.config)
bei()
go1=search[1]
go3=search[2]
jg=start(go1,go3)
if jg.code == 200 then
fh=jg.content
fh=json(fh)
--print(fh)
Play(gqlb,idb)
else
function inspect()
gg.alert("访问网络异常，错误代码：\n\n"..jg.code)
end
if not pcall(inspect) then print("网络异常，请先连接上网络") os.exit() end
end
XGCK=-1
end),
hzs.button('热门音乐',
function()
Obtain=gg.makeRequest("https://api.uomg.com/api/rand.music?sort=热歌榜&format=json").content muchen=Obtain:match('url":"(.-)","picurl') gg.playMusic(muchen)
end),
}})

end



function GT3()

string.toMusic('欢迎使用鬼天3主人科技。有bug积极和作者反馈,请不要快速开启和关闭功能，开始功能提示成功之前请不要开启或关闭其他功能。出现bug请重启外挂')


draw3 = require('draw3')
draw3 = require('draw3')
text1 = draw3.text(' ',0,0)
text2 = draw3.text('作者:主人',0,50)
text3 = draw3.text('公益脚本',0,100)
text4 = draw3.text('鬼天3官服适配版',0,150)
text5 = draw3.text('免费公开测试中',0,200)
for i = 1, 4 do--这里改太大可能造成悬浮窗不出来
	gg.sleep(50)
	-- 设置随机颜色
    local color = '#1DF3EE'
    text1.setColor(color)
    local color = '#1DF3EE'
    text2.setColor(color)
    local color = '#1DF3EE'
    text3.setColor(color)
    local color = '#1DF3EE'
    text4.setColor(color)
    local color = '#1DF3EE'
    text5.setColor(color)
    
	-- 更新文本
	text1.update(i)
	text2.update(i)
	text3.update(i)
	text4.update(i)
	text5.update(i)
end

gg.setConfig("隐藏辅助", 23)
gg.setConfig("运行守护", 3)
gg.setConfig("冻结间隔", 1200)
gg.setConfig("旁路模式", 1)



stab={--菜单名字，大标题
	{"公告","公告"},
	{"基础功能","基础功能"},
	{"高级功能","高级功能"},
    {"武器功能","武器功能"},
    {"飞天功能","飞天功能"},
	{"音乐功能","音乐界面"}
}

hzs.menu({{
hzs.text("使用前请先选择进程\n脚本作者:主人","#FFFFFF","15sp"),
hzs.button("🎃选择进程🎃",function() gg.setProcessX() end),
hzs.button("🌈重置秒开🌈",function() czmk() end),
hzs.button("😎解除冻结😎",function() qksydj() end),
hzs.button("✨收起页面✨",function() 隐藏() end),
},
{
hzs.text("基础功能区","#FFFFFF","15sp"),



-- hzs.button("🌈重置秒开🌈",czmk()),
-- hzs.button("😎解除冻结😎",qksydj()),

---[[
hzs.button("向上瞬移10米",
function()
zbnydz={}
string.toMusic('瞬移中')
srcs={
  ["参数"]={"A",zbnydz},
  ["特征"]={
    {1034147594,"D"},
    {0x184,1065353216,"D"},
  },
}
tzmpy(srcs)
zbnydz=srcs["参数"][2]

local xgz={address=zbnydz[1].address+0x1CC,flags=16,value=1}
xgz=gg.getValues(xgz)

srcs={
  ["参数"]={"A",zbnydz},
  ["特征"]={
    {1034147594,"D"},
    {0x184,1065353216,"D"},
  },
  ["修改"]={
    {0x1CC,xgz['value']+1,"F",true},
  },
}
tzmpy(srcs)
zbnydz=srcs["参数"][2]
gg.sleep(1000)
srcs={
["修改"]={
    {0x1CC,xgz['value']+1,"F",false},
}
}
tzmpy(srcs)
zbnydz=srcs["参数"][2]
string.toMusic('瞬移成功')
end
),



hzs.button("自改坐标",
function()
zbnydz={}
srcs={
  ["参数"]={"A",zbnydz},
  ["特征"]={
    {1034147594,"D"},
    {0x184,1065353216,"D"},
  },
}
tzmpy(srcs)
zbnydz=srcs["参数"][2]
local lscf={}
for a=0,2 do
  local z=a*0x8
  lscf[a+1]={address=zbnydz[1].address+0x1C4+z,flags=16,value=0}
end
lscf=gg.getValues(lscf)
local zg=gg.prompt({"X轴","Y轴","Z轴","是否冻结X坐标","是否冻结Y坐标","是否冻结Z坐标","是否关闭下落"},{lscf[1].value,lscf[2].value,lscf[3].value,false,false,false,false},{"number","number","number","checkbox","checkbox","checkbox","checkbox"})
if zg==nil then
else
local ft=0
if zg[7]==false then
ft=100
else
ft=0
end
string.toMusic('坐标修改中')
srcs={
  ["参数"]={"A",nydz},
  ["特征"]={
    {1075838976,"D"},
    {0x4,1069547520,"D"},
  },
  ["修改"]={
    {0x2C,ft,"F",false},
  },
}
tzmpy(srcs)
nydz=srcs["参数"][2]
srcs={
  ["参数"]={"A",zbnydz},
  ["特征"]={
    {1034147594,"D"},
    {0x184,1065353216,"D"},
  },
  ["修改"]={
    {0x1C4,zg[1],"F",zg[4]},
    {0x1CC,zg[2],"F",true},
    {0x1D4,zg[3],"F",zg[6]},
  }
}
tzmpy(srcs)
zbnydz=srcs["参数"][2]

gg.sleep(1000)
srcs={
  ["参数"]={"A",zbnydz},
  ["特征"]={
    {1034147594,"D"},
    {0x184,1065353216,"D"},
  },
  ["修改"]={
    {0x1CC,zg[2],zg[5]},
  }
}
tzmpy(srcs)
zbnydz=srcs["参数"][2]
string.toMusic('坐标修改成功')
end
end
),



---[[
hzs.switch('重力高跳',
function()
gg.playMusic("https://dict.youdao.com/dictvoice?audio=高跳开启中&le=zh")
srcs={
  ["参数"]={"A",nydz},
  ["特征"]={
    {1034147594,"D"},
    {0x4,1065353216,"D"},
  },
  ["修改"]={
    {0x28,3000000,"F",false},
  }
}
tzmpy(srcs)
nydz=srcs["参数"][2]
gg.playMusic("https://dict.youdao.com/dictvoice?audio=重力高跳开启成功&le=zh")
gg.toast("❤️重力高跳开启成功❤️")
end,

function()
gg.playMusic("https://dict.youdao.com/dictvoice?audio=高跳关闭中&le=zh")
srcs={
  ["参数"]={"A",nydz},
  ["特征"]={
    {1034147594,"D"},
    {0x4,1065353216,"D"},
  },
  ["修改"]={
    {0x28,20,"F",false},
  }
}
tzmpy(srcs)
nydz=srcs["参数"][2]
gg.playMusic("https://dict.youdao.com/dictvoice?audio=重力高跳关闭成功&le=zh")
gg.toast("❤️重力高跳关闭成功❤️")
end
),




hzs.switch("自改高跳",
function()
gtnydz={}
local zg=gg.prompt({"自定义高跳高度\n建议在25～40倍之间"})
string.toMusic('自改高跳开启中')
srcs={
  ["参数"]={"A",gtnydz},
  ["特征"]={
    {6226027,"D"},
    {0xC,6226036,"D"},
  },
  ["修改"]={
    {0x3C,zg[1],"F",false},
  }
}
tzmpy(srcs)
gtnydz=srcs["参数"][2]
string.toMusic('自改高跳开启成功')
gg.toast("❤️自改高跳开启成功❤️")
end,

function()
string.toMusic('自改高跳关闭中')
srcs={
  ["参数"]={"A",gtnydz},
  ["特征"]={
    {6226027,"D"},
    {0xC,6226036,"D"},
  },
  ["修改"]={
    {0x3C,1,"F",false},
  }
}
tzmpy(srcs)
gtnydz=srcs["参数"][2]
string.toMusic('自改高跳关闭成功')
gg.toast("❤️自改高跳关闭成功❤️")
end),


---[[
hzs.switch('Nan无敌',
function()
	gg.playMusic("https://dict.youdao.com/dictvoice?audio=无敌开启中&le=zh")
srcs={
  ["参数"]={"A",wdnydz},
  ["特征"]={
    {16777216,"D"},
    {-0x44,65537,"D"},
  },
  ["修改"]={
    {-0xE0,-1,"D",false},
  }
}
tzmpy(srcs)
wdnydz=srcs["参数"][2]
gg.playMusic("https://dict.youdao.com/dictvoice?audio=无敌开启成功，死亡复活后生效&le=zh")
gg.toast("❤️无敌开启成功❤️\n❤️死亡复活后生效❤️")
end,

function()
	gg.playMusic("https://dict.youdao.com/dictvoice?audio=无敌关闭中&le=zh")
srcs={
  ["参数"]={"A",wdnydz},
  ["特征"]={
    {16777216,"D"},
    {-0x44,65537,"D"},
  },
  ["修改"]={
    {-0xE0,100,"D",false},
  }
}
tzmpy(srcs)
wdnydz=srcs["参数"][2]
gg.playMusic("https://dict.youdao.com/dictvoice?audio=无敌关闭成功，死亡复活后生效&le=zh")
gg.toast("❤️无敌关闭成功❤️\n❤️死亡复活后生效❤️")
end),




hzs.switch('自改血量',
function()
guanbibufenfanzuobi2()
local LLL=gg.prompt({"自定义血量"})
srcs={
  ["参数"]={"A",wdnydz},
  ["特征"]={
    {1082130432,"D"},
    {0x8,1082130432,"D"},
  },
  ["修改"]={
    {0xBC,LLL[1],"D",false},
  }
}
tzmpy(srcs)
wdnydz=srcs["参数"][2]
gg.playMusic("https://dict.youdao.com/dictvoice?audio=自改血量开启成功，死亡复活后生效&le=zh")
gg.toast("❤️自改血量开启成功❤️\n❤️死亡复活后生效❤️")
end,

function()
	gg.playMusic("https://dict.youdao.com/dictvoice?audio=自改血量关闭中&le=zh")
srcs={
  ["参数"]={"A",wdnydz},
  ["特征"]={
    {1082130432,"D"},
    {0x8,1082130432,"D"},
  },
  ["修改"]={
    {0xBC,100,"D",false},
  }
}
tzmpy(srcs)
wdnydz=srcs["参数"][2]
gg.playMusic("https://dict.youdao.com/dictvoice?audio=自改血量关闭成功，死亡复活后生效&le=zh")
gg.toast("❤️自改血量关闭成功❤️\n❤️死亡复活后生效❤️")
end
),



hzs.switch('自改加速',
function()
guanbibufenfanzuobi2()
beishu=gg.prompt({"自定义移动倍速"})
beishuzhi=10*beishu[1]
gg.playMusic("https://dict.youdao.com/dictvoice?audio=自改加速开启中&le=zh")
srcs={
  ["参数"]={"A",nydz},
  ["特征"]={
    {1034147594,"D"},
    {0x4,1065353216,"D"},
  },
  ["修改"]={
    {-0xC,beishuzhi,"F",false},
    {-0x8,beishuzhi,"F",false},
    {0x20,99999999,"F",false},
    {0x24,99999999,"F",false},
  }
}
tzmpy(srcs)
nydz=srcs["参数"][2]
gg.playMusic("https://dict.youdao.com/dictvoice?audio=自改加速开启成功&le=zh")
gg.toast("❤️♡自改加速开启成功♡❤️")
end,

function()
gg.playMusic("https://dict.youdao.com/dictvoice?audio=自改加速关闭成功&le=zh")
srcs={
  ["参数"]={"A",nydz},
  ["特征"]={
    {1034147594,"D"},
    {0x4,1065353216,"D"},
  },
  ["修改"]={
    {-0xC,5,"F",false},
    {-0x8,10,"F",false},
  }
}
tzmpy(srcs)
nydz=srcs["参数"][2]
gg.playMusic("https://dict.youdao.com/dictvoice?audio=自改加速关闭成功&le=zh")
gg.toast("❤️♡自改加速关闭成功♡❤️")
end
),
},


{
hzs.text("高级功能区","#FFFFFF","15sp"),--空文本可用于换行，sp调整距离



hzs.switch('防闪退',
function()
gg.playMusic("https://dict.youdao.com/dictvoice?audio=防闪退开启中&le=zh")
guanbibufenfanzuobi2()
gg.playMusic("https://dict.youdao.com/dictvoice?audio=防闪退开启成功&le=zh")
gg.toast("❤️防闪退开启成功❤️")
end,

function()
gg.playMusic("https://dict.youdao.com/dictvoice?audio=防闪退开启中&le=zh")
guanbibufenfanzuobi2()
gg.playMusic("https://dict.youdao.com/dictvoice?audio=防闪退开启成功&le=zh")
gg.toast("❤️防闪退开启成功❤️")
end
),



hzs.switch("集体控怪",
function()
string.toMusic('集体控怪开启中')
srcs={
  ["参数"]={"A",jtkgnydz},
  ["特征"]={
    {-1027080192,"D"},
    {-0x68,1,"D"},
    {-0x70,215,"D"},
  },
  ["修改"]={
    {-0x6C,114514,"D",false},
  }
}
tzmpy(srcs)
jtkgnydz=srcs["参数"][2]
string.toMusic('集体控怪开启成功')
gg.toast("❤️集体控怪开启成功❤️")
end,

function()
string.toMusic('集体控怪关闭中')
srcs={
  ["参数"]={"A",jtkgnydz},
  ["特征"]={
    {-1027080192,"D"},
    {-0x68,1,"D"},
    {-0x70,215,"D"},
  },
  ["修改"]={
    {-0x6C,98,"D",false},
  }
}
tzmpy(srcs)
jtkgnydz=srcs["参数"][2]
string.toMusic('集体控怪关闭成功')
gg.toast("❤️集体控怪关闭成功❤️")
end
),



hzs.switch("集体控人",
function()
string.toMusic('集体控人开启中')
srcs={
  ["参数"]={"A",wjiddz},
  ["特征"]={
    {86,"D"},
    {-0x50,81,"D"},
    {0x50,87,"D"},
  },
}
tzmpy(srcs)
wjiddz=srcs["参数"][2]
local lscf={{address=wjiddz[1].address+0xA0,flags=4,value=1}}
local zijiid=gg.getValues(lscf)
gg.addListItems(zijiid)
for a1=1,100 do
lscf[1].value=a1
gg.setValues(lscf)
end
gg.setValues(zijiid)
string.toMusic('集体控人开启成功')
gg.toast("❤️集体控人开启成功❤️")
end,

function()
if zijiid~=0 then
gg.setValues(zijiid)
string.toMusic('关不掉，再关剁了你手指')
else
string.toMusic('关不掉，再关剁了你手指')
end
end
),



hzs.switch("房主权限",
function()
string.toMusic('房主权限开启中')
srcs={
  ["参数"]={"A",wjiddz},
  ["特征"]={
    {86,"D"},
    {-0x50,81,"D"},
    {0x50,87,"D"},
  },
  ["修改"]={
    {0xA0,1,"D",false}
  }
}
tzmpy(srcs)
wjiddz=srcs["参数"][2]
string.toMusic('房主权限开启成功')
gg.toast("❤️房主权限开启成功❤️")
end,

function()
if zijiid~=0 then
gg.addListItems(zijiid)
string.toMusic('房主权限关闭成功')
gg.toast("❤️房主权限关闭成功❤️")
else
string.toMusic('房主权限关闭失败')
gg.toast("❤️房主权限关闭失败❤️")
end
end
),



hzs.switch('改服务器或模式',
function()
fuwuqi=gg.prompt({("输入需要修改的服务器或者模式"),("修改后的服务器或者模式")})
    gg.clearResults()
gg.setRanges(32)
gg.searchNumber(";"..fuwuqi[1],gg.TYPE_WORD)
gg.getResults(100000)
gg.editAll(';'..fuwuqi[2],gg.TYPE_WORD)
gg.playMusic("https://dict.youdao.com/dictvoice?audio=修改完毕&le=zh")
gg.toast("❤️♡改服务器或模式开启成功♡❤️")
end,

function()
fuwuqi=gg.prompt({("输入需要修改的服务器或者模式"),("修改后的服务器或者模式")})
    gg.clearResults()
gg.setRanges(32)
gg.searchNumber(";"..fuwuqi[1],gg.TYPE_WORD)
gg.getResults(100000)
gg.editAll(';'..fuwuqi[2],gg.TYPE_WORD)
gg.playMusic("https://dict.youdao.com/dictvoice?audio=修改完毕&le=zh")
gg.toast("❤️♡改服务器或模式开启成功♡❤️")
end
),



hzs.switch('生存沙盒',
function()
	 gg.clearResults()
	 gg.setRanges(32)
	 gg.searchNumber(";SBX", gg.TYPE_WORD, false, gg.SIGN_EQUAL, 0, -1)
	 gg.searchNumber("", gg.TYPE_WORD, false, gg.SIGN_EQUAL, 0, -1)
	 gg.getResults(100)
	 gg.editAll(";SUR", gg.TYPE_WORD)
	 gg.clearResults()
gg.playMusic("https://dict.youdao.com/dictvoice?audio=生存沙盒开启成功，请选择沙盒模式进入地图&le=zh")
gg.toast("❤️♡生存沙盒开启成功♡❤️")
end,

function()
string.toMusic('关不掉，再关剁了你手指')
end
),



hzs.switch('感染沙盒',
function()
	 gg.clearResults()
	 gg.setRanges(32)
	 gg.searchNumber(";SBX", gg.TYPE_WORD, false, gg.SIGN_EQUAL, 0, -1)
	 gg.searchNumber("", gg.TYPE_WORD, false, gg.SIGN_EQUAL, 0, -1)
	 gg.getResults(100)
	 gg.editAll(";INF", gg.TYPE_WORD)
	 gg.clearResults()
gg.playMusic("https://dict.youdao.com/dictvoice?audio=感染沙盒开启成功，请选择沙盒模式进入地图&le=zh")
gg.toast("❤️♡感染沙盒开启成功♡❤️")
end,

function()
string.toMusic('关不掉，再关剁了你手指')
end
),


hzs.switch('守护者强化',
 function()
    gg.playMusic("https://dict.youdao.com/dictvoice?audio=守护者强化开启中&le=zh")
    
    gg.playMusic("https://dict.youdao.com/dictvoice?audio=守护者强化开启成功&le=zh")
    gg.toast("❤️守护者强化开启成功❤️")
end,

function()
string.toMusic('关不掉，再关剁了你手指')
 end
),
},


{
hzs.text("武器功能区","#FFFFFF","15sp"),--空文本可用于换行，sp调整距离
hzs.switch('无限子弹',
function()
lsdz={}
wxzdnydz={}
gg.playMusic("https://dict.youdao.com/dictvoice?audio=无限子弹开启中&le=zh")
    gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber('444444',gg.TYPE_DWORD,false,gg.SIGN_EQUAL,0, -1)
local wxzdnydz=gg.getResults(99999)
for a1=1,#wxzdnydz do
  wxzd[a1].address=wdnydz[a1]+0x4
end
wxzdnydz=gg.getValues(wxzdnydz)
for a1=1,#wxzdnydz do
  if wxzdnydz[a1].value~=444443 then
    lsdz[a1]=wxzdnydz[a1]
  end
end
for a1=1,#lsdz do
  lsdz[a1].address=lsdz[a1].address-0x4
  lsdz[a1].value=-444444
end
gg.setValue(lsdz)
gg.playMusic("https://dict.youdao.com/dictvoice?audio=无限子弹开启成功&le=zh")
gg.toast("❤️无限子弹开启成功❤️")
end,
function()
gg.playMusic("https://dict.youdao.com/dictvoice?audio=无限子弹关闭中&le=zh")
    gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber('-444444',gg.TYPE_DWORD,false,gg.SIGN_EQUAL,0, -1)
gg.getResults(10000)
gg.editAll('444444',gg.TYPE_DWORD)
gg.playMusic("https://dict.youdao.com/dictvoice?audio=无限子弹关闭成功&le=zh")
gg.toast("❤️无限子弹关闭成功❤️")
end
),
hzs.switch('超级秒杀',
function()
gg.playMusic("https://dict.youdao.com/dictvoice?audio=超级秒杀开启中&le=zh")
    gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber('500D;10F;15D;17D',gg.TYPE_DWORD,false,gg.SIGN_EQUAL,0, -1)
gg.searchNumber('15',gg.TYPE_DWORD,false,gg.SIGN_EQUAL,0, -1)
gg.getResults(100)
gg.editAll('2,147,483,647',gg.TYPE_DWORD)
gg.playMusic("https://dict.youdao.com/dictvoice?audio=超级秒杀开启成功&le=zh")
gg.toast("❤️超级秒杀开启成功❤️")
end,
function()
string.toMusic('关不掉，再关剁了你手指')
end
),
hzs.switch('千里刀人',
function()
gg.playMusic("https://dict.youdao.com/dictvoice?audio=千里刀人开启中&le=zh")
    gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber('20;1,040,187,392;15;10',gg.TYPE_DWORD,false,gg.SIGN_EQUAL,0, -1)
gg.searchNumber('1040187392',gg.TYPE_DWORD,false,gg.SIGN_EQUAL,0, -1)
gg.getResults(100)
gg.editAll('1,343,554,297',gg.TYPE_DWORD)
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber('20;1,343,554,297;15;10',gg.TYPE_DWORD,false,gg.SIGN_EQUAL,0, -1)
gg.searchNumber('20',gg.TYPE_DWORD,false,gg.SIGN_EQUAL,0, -1)
gg.getResults(100)
gg.editAll('2,147,483,647',gg.TYPE_DWORD)
gg.playMusic("https://dict.youdao.com/dictvoice?audio=千里刀人开启成功&le=zh")
gg.toast("❤️千里刀人开启成功❤️")
end,
function()
string.toMusic('关不掉，再关剁了你手指')
end
),
hzs.switch('XIX改AKM',
function()
string.toMusic('XIX改AKM开启中')
    gg.clearResults()
gg.setRanges(32)
gg.searchNumber(":XIX",gg.TYPE_BYTE)
gg.getResults(100000)
gg.editAll(':asda',gg.TYPE_BYTE)
    gg.clearResults()
gg.setRanges(32)
gg.searchNumber(":AKM",gg.TYPE_BYTE)
gg.getResults(100000)
gg.editAll(':XIX',gg.TYPE_BYTE)
gg.playMusic("https://dict.youdao.com/dictvoice?audio=XIX改AKM开启成功，重进地图生效&le=zh")
gg.toast("❤️♡XIX改AKM开启成功♡❤️")
end,
function()
string.toMusic('XIX改KM关闭中')
    gg.clearResults()
gg.setRanges(32)
gg.searchNumber(":XIX",gg.TYPE_BYTE)
gg.getResults(100000)
gg.editAll(':AKM',gg.TYPE_BYTE)
    gg.clearResults()
gg.setRanges(32)
gg.searchNumber(":AKM",gg.TYPE_BYTE)
gg.getResults(100000)
gg.editAll(':XIX',gg.TYPE_BYTE)
gg.playMusic("https://dict.youdao.com/dictvoice?audio=XIX改AKM关闭成功，重进地图生效&le=zh")
gg.toast("❤️♡XIX改AKM关闭成功♡❤️")
end
),
hzs.switch('XIX强化',
function()
gg.playMusic("https://dict.youdao.com/dictvoice?audio=XIX强化开启中&le=zh")
    gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber('1,055,286,886;1,058,642,330;3::9',gg.TYPE_DWORD,false,gg.SIGN_EQUAL,0, -1)
gg.getResults(100)
gg.editAll('0',gg.TYPE_DWORD)
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber('1,028,443,341;1,073,741,824;1,065,353,216::73',gg.TYPE_DWORD,false,gg.SIGN_EQUAL,0, -1)
gg.searchNumber('1028443341',gg.TYPE_DWORD,false,gg.SIGN_EQUAL,0, -1)
gg.getResults(100)
gg.editAll('966,609,234',gg.TYPE_DWORD)
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber('966,609,234;1,073,741,824;1,065,353,216::73',gg.TYPE_DWORD,false,gg.SIGN_EQUAL,0, -1)
gg.searchNumber('1065353216',gg.TYPE_DWORD,false,gg.SIGN_EQUAL,0, -1)
gg.getResults(100)
gg.editAll('1,086,324,736',gg.TYPE_DWORD)
gg.playMusic("https://dict.youdao.com/dictvoice?audio=XIX强化开启成功&le=zh")
gg.toast("❤️XIX强化开启成功❤️")
end,
function()
string.toMusic('关不掉，再关剁了你手指')
end
),
hzs.switch('MCS870强化',
function()
gg.playMusic("https://dict.youdao.com/dictvoice?audio=MCS870强化开启中&le=zh")
    gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber('8;1,088,421,888;1,063,675,494::9',gg.TYPE_DWORD,false,gg.SIGN_EQUAL,0, -1)
gg.searchNumber('1,063,675,494',gg.TYPE_DWORD,false,gg.SIGN_EQUAL,0, -1)
gg.getResults(100)
gg.editAll('1,017,370,378',gg.TYPE_DWORD)
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber('8;1,088,421,888;1,017,370,378::9',gg.TYPE_DWORD,false,gg.SIGN_EQUAL,0, -1)
gg.searchNumber('8',gg.TYPE_DWORD,false,gg.SIGN_EQUAL,0, -1)
gg.getResults(100)
gg.editAll('25',gg.TYPE_DWORD)
gg.playMusic("https://dict.youdao.com/dictvoice?audio=MCS870强化开启成功&le=zh")
gg.toast("❤️MCS870强化开启成功❤️")
end,
function()
string.toMusic('关不掉，再关剁了你手指')
end
),
hzs.switch('RPG强化',
function()
gg.playMusic("https://dict.youdao.com/dictvoice?audio=RPG强化开启中&le=zh")
    gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber('1,056,964,608;1,075,000,115;4::13',gg.TYPE_DWORD,false,gg.SIGN_EQUAL,0, -1)
gg.searchNumber('4',gg.TYPE_DWORD,false,gg.SIGN_EQUAL,0, -1)
gg.getResults(100)
gg.editAll('999999999',gg.TYPE_DWORD)
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber('50;1,056,964,608;1,075,000,115::13',gg.TYPE_DWORD,false,gg.SIGN_EQUAL,0, -1)
gg.searchNumber('1,075,000,115',gg.TYPE_DWORD,false,gg.SIGN_EQUAL,0, -1)
gg.getResults(100)
gg.editAll('1,028,443,341',gg.TYPE_DWORD)
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber('20;50;1,056,964,608::41',gg.TYPE_DWORD,false,gg.SIGN_EQUAL,0, -1)
gg.searchNumber('1,056,964,608',gg.TYPE_DWORD,false,gg.SIGN_EQUAL,0, -1)
gg.getResults(100)
gg.editAll('0',gg.TYPE_DWORD)
gg.playMusic("https://dict.youdao.com/dictvoice?audio=RPG强化开启成功&le=zh")
gg.toast("❤️RPG强化开启成功❤️")
end,
function()
string.toMusic('关不掉，再关剁了你手指')
end
),
},

{
hzs.text("飞天功能区","#FFFFFF","15sp"),
hzs.radio({"飞天",
{"升2",
function()
srcs={
  ["参数"]={"A",nydz},
  ["特征"]={
    {1034147594,"D"},
    {0x4,1065353216,"D"},
  },
  ["修改"]={
    {0x2C,-10,"F",false},
  }
}
tzmpy(srcs)
nydz=srcs["参数"][2]
string.toMusic('升')
end
},
{"升1",
function()
srcs={
  ["参数"]={"A",nydz},
  ["特征"]={
    {1034147594,"D"},
    {0x4,1065353216,"D"},
  },
  ["修改"]={
    {0x2C,-5,"F",false},
  }
}
tzmpy(srcs)
nydz=srcs["参数"][2]
string.toMusic('升')
end
},
{"定点",
function()
srcs={
  ["参数"]={"A",nydz},
  ["特征"]={
    {1034147594,"D"},
    {0x4,1065353216,"D"},
  },
  ["修改"]={
    {0x2C,0,"F",false},
  }
}
tzmpy(srcs)
nydz=srcs["参数"][2]
string.toMusic('定')
end
},
{"降1",
function()
srcs={
  ["参数"]={"A",nydz},
  ["特征"]={
    {1034147594,"D"},
    {0x4,1065353216,"D"},
  },
  ["修改"]={
    {0x2C,5,"F",false},
  }
}
tzmpy(srcs)
nydz=srcs["参数"][2]
string.toMusic('降')
end
},
{"降2",
function()
srcs={
  ["参数"]={"A",nydz},
  ["特征"]={
    {1034147594,"D"},
    {0x4,1065353216,"D"},
  },
  ["修改"]={
    {0x2C,10,"F",false},
  }
}
tzmpy(srcs)
nydz=srcs["参数"][2]
string.toMusic('降')
end
},

{"恢复",
function()
srcs={
  ["参数"]={"A",nydz},
  ["特征"]={
    {1034147594,"D"},
    {0x4,1065353216,"D"},
  },
  ["修改"]={
    {0x2C,100,"F",false},
  }
}
tzmpy(srcs)
nydz=srcs["参数"][2]
string.toMusic('恢复')
end
},
}),





hzs.switch("自改飞天",
function()
local zgzhi=gg.prompt({"自改飞天\n整数下落，负数上升"})
string.toMusic('自改飞天开启中')
srcs={
  ["参数"]={"A",nydz},
  ["特征"]={
    {1034147594,"D"},
    {0x4,1065353216,"D"},
  },
  ["修改"]={
    {0x2C,zgzhi[1],"F",false},
  }
}
tzmpy(srcs)
nydz=srcs["参数"][2]
string.toMusic('自改飞天开启成功')
gg.toast("❤️自改飞天成功❤️")
end,

function()
string.toMusic('自改飞天关闭中')
srcs={
  ["参数"]={"A",nydz},
  ["特征"]={
    {1034147594,"D"},
    {0x4,1065353216,"D"},
  },
  ["修改"]={
    {0x2C,100,"F",false},
  }
}
tzmpy(srcs)
nydz=srcs["参数"][2]
string.toMusic('自改飞天关闭成功')
gg.toast("❤️自改飞天关闭成功❤️")
end
),

},
{
hzs.button('关闭音乐',
function()
string.toMusic('音乐关闭成功')
end),
hzs.button('搜索音乐',
function()
search = gg.prompt({
"输入要搜索的歌曲\n可加上歌手名字",
"设置显示数量(数字)",}
,g.sel,{"text",})
if not search then return end
gg.saveVariable(search,g.config)
bei()
go1=search[1]
go3=search[2]
jg=start(go1,go3)
if jg.code == 200 then
fh=jg.content
fh=json(fh)
--print(fh)
Play(gqlb,idb)
else
function inspect()
gg.alert("访问网络异常，错误代码：\n\n"..jg.code)
end
if not pcall(inspect) then print("网络异常，请先连接上网络") os.exit() end
end
XGCK=-1
end),
hzs.button('热门音乐',
function()
Obtain=gg.makeRequest("https://api.uomg.com/api/rand.music?sort=热歌榜&format=json").content muchen=Obtain:match('url":"(.-)","picurl') gg.playMusic(muchen)
end),
}})


end


while gg.isVPN() do
os.exit()
gg.alert("请不要抓包或开启VPN")
end


xzyx()
if msxz==1 then
GT3()
else
TDAU()
end

--倒计时(ret.vip)
gg.sleep(2000)
bloc = luajava.getBlock()
bloc('join')



--修复bug怎么用？直接注释掉