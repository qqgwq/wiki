$wechat_client = WeixinAuthorize::Client.new(ENV["wx4cdda2e2990ad32e"], ENV["cb1699bd752d101f363b2caa456c7163"])
$wechat_client.is_valid? #判断是否配置正确