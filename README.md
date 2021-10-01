需求
一个简单的订餐系统，客户会在上面注册会员制并定期扣费送餐 需要以代码形式解决订单周期处理事项 
订阅机制 
用户会订阅某个套餐，如每周10份餐食 

Cut Off周期收费机制 套餐每周会有截止时间，超过此时间的只能订阅到下周送餐周期 
● 新建subscription的时候,立即新建一个order 
● 每周到固定时间Cut off时即新建一个order给这周还未生产order的subscription. 
● Group orders (当cut off为每周二晚上8pm时)，获取某一subscription周内所有orders (如 31/03 8pm – 07/04 8pm)，此Group包含此期间内新注册时建立的orders到cut off 时(即 07/04 8pm)建立的orders 

Cut Off 截止日 
● 原定每周二晚上8点的cut off, 改为每周四上午8点 
● 在周四上午8点之后, 需要能获取到对应orders的group 
● 如果有条件, 可以考虑下daylight saving发生时的cut off要如何安全的迁移 (此项不做要求) 

餐食流行度算法 
推荐算法，推荐出最流行的10个餐食品种给新客户 

额外考虑 
如何保证系统下线错过截止日期的后台Job，系统恢复后重新运行的订单处理