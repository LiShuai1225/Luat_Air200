module(...,package.seeall)

require"common"

--[[
�ӽ����㷨������ɶ���
http://tool.oschina.net/encrypt?type=2
http://www.ip33.com/crc.html
http://www.seacha.com/tools/aes.html
���в���
]]

local slen = string.len

--[[
��������print
����  ����ӡ�ӿڣ����ļ��е����д�ӡ�������aliyuniotǰ׺
����  ����
����ֵ����
]]
local function print(...)
	_G.print("test",...)
end

--[[
��������base64test
����  ��base64�ӽ����㷨����
����  ����
����ֵ����
]]
local function base64test()
	local originstr = "123456crypto.base64_encodemodule(...,package.seeall)sys.timer_start(test,5000)jdklasdjklaskdjklsa"
	local encodestr = crypto.base64_encode(originstr,slen(originstr))
	print("base64_encode",encodestr)
	print("base64_decode",crypto.base64_decode(encodestr,slen(encodestr)))
end

--[[
��������hmacmd5test
����  ��hmac_md5�㷨����
����  ����
����ֵ����
]]
local function hmacmd5test()
	local originstr = "asdasdsadas"
	local signkey = "123456"
	print("hmac_md5",crypto.hmac_md5(originstr,slen(originstr),signkey,slen(signkey)))
end

--[[
��������md5test
����  ��md5�㷨����
����  ����
����ֵ����
]]
local function md5test()
	local originstr = "sdfdsfdsfdsffdsfdsfsdfs1234"
	print("md5",crypto.md5(originstr,slen(originstr)))
end

--[[
��������crctest
����  ��crc�㷨����
����  ����
����ֵ����
]]
local function crctest()
	local originstr = "sdfdsfdsfdsffdsfdsfsdfs1234"
	print("crc16_modbus",string.format("%04X",crypto.crc16_modbus(originstr,slen(originstr))))
	print("crc32",string.format("%08X",crypto.crc32(originstr,slen(originstr))))
end

--[[
��������aestest
����  ��aes�㷨����
����  ����
����ֵ����
]]
local function aestest()
	local originstr = "123456crypto.base64_encodemodule(...,package.seeall)sys.timer_start(test,5000)jdklasdjklaskdjklsa"
	
	local encodestr = crypto.aes128_ecb_encrypt(originstr,slen(originstr),"1234567890123456",16)
	print("aes128_ecb_encrypt",common.binstohexs(encodestr))
	print("aes128_ecb_decrypt",crypto.aes128_ecb_decrypt(encodestr,slen(encodestr),"1234567890123456",16))
	
	--cbc����֧��
	--encodestr = crypto.aes128_cbc_encrypt(originstr,slen(originstr),"1234567890123456",16,"1234567890123456",16)
	--print("aes128_cbc_encrypt",common.binstohexs(encodestr))
	--print("aes128_cbc_decrypt",crypto.aes128_cbc_decrypt(encodestr,slen(encodestr),"1234567890123456",16,"1234567890123456",16))
end

--[[
��������test
����  ���㷨�������
����  ����
����ֵ����
]]
local function test()
	base64test()
	hmacmd5test()
	md5test()
	crctest()
	aestest()
end

sys.timer_start(test,5000)