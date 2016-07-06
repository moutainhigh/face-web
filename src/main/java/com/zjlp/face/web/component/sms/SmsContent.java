package com.zjlp.face.web.component.sms;


/**
 * 信息列表
 * @ClassName: SmsContent 
 * @Description: (这里用一句话描述这个类的作用) 
 * @author Administrator
 * @date 2014年12月6日 下午3:54:06
 */
public enum SmsContent {
	
	/**
	 * 尊敬的用户，感谢您对本店的支持，小店特意奉送{}积分，请登录店铺首页领取，地址{}
	 */
	UMS_501("501", "尊敬的用户：您有一笔积分到账，请通过以下链接进行查看 {}"),
	
	/** 恭喜！供货商已给您分配商品，赶紧登录www.g-jia.net进行管理吧！*/
	UMS_401("401", "恭喜！供货商已给您分配商品，赶紧登录{}进行管理吧！"),
	
	/** 恭喜！您申请****店铺的代理权限已审核通过，赶紧登录www.g-jia.net进行管理吧！*/
	UMS_402("402", "恭喜！您申请{}店铺的代理权限已审核通过，赶紧登录{}进行管理吧！"),
	
	/**
	 * [浙江脸谱]尊敬的老板，您发起的****预约活动，有新客户预约，具体请登录http://*******查看详情。
	 */
	UMS_301("301", "[浙江脸谱]尊敬的老板，您发起的{}预约活动，有新客户预约，请登录{}查看详情。"),
	
	/**
	 * [浙江脸谱]尊敬的老板，客户****（姓名）已取消******预约，具体请登录http://*******查看详情。
	 */
	UMS_302("302", "[浙江脸谱]尊敬的老板，客户{}（姓名）已取消{}预约，请登录{}查看详情。"),
	
	/**
	 * [浙江脸谱]尊敬的用户，您预约的##活动，已被商家拒绝，具体请登录http://*******查看详情。
	 */
	UMS_303("303", "[浙江脸谱]尊敬的用户，您预约的{}活动，已被商家拒绝，请登录{}查看详情。"),
	
	/**
	 * [浙江脸谱]尊敬的用户，您预约的##活动，已被商家确认，具体请登录http://*******查看详情。
	 */
	UMS_304("304", "[浙江脸谱]尊敬的用户，您预约的{}活动，已被商家确认，请登录{}查看详情。"),
	
	/**
	 * [浙江脸谱]尊敬的用户，您分享的##有订单成交了，恭喜获得佣金****元！具体请登录http://*******领取。
	 */
	UMS_305("305", "[浙江脸谱]尊敬的用户，您分享的{}有订单成交了，恭喜获得佣金{}元！具体请登录{}领取。"),
	
	/**
	 * 微信用户
	 * [浙江脸谱]尊敬的用户，您预约的##活动，已被商家拒绝，具体请关注脸谱中国公众号（脸谱bestface）查看详情。
	 */
	UMS_306("306", "尊敬的用户，您预约的{}活动，已被商家拒绝，具体请关注脸谱中国公众号（脸谱bestface）查看详情。"),
	
	/**
	 * 微信用户
	 * [浙江脸谱]尊敬的用户，您预约的##活动，已被商家确认，具体请关注脸谱中国公众号（脸谱bestface）查看详情。
	 */
	UMS_307("307", "尊敬的用户，您预约的{}活动，已被商家确认，具体请关注脸谱中国公众号（脸谱bestface）查看详情。"),
	
	/**
	 * #尊敬的用户，您注册的手机账号短信验证码为#arg0#，请在3分钟内提交验证。
	 */
	UMS_201("201", "尊敬的用户，您注册的手机账号短信验证码为{}，请在3分钟内提交验证。"),

	/**
	 * #您的手机动态验证码为{xxxxxxxxxxxx}请勿将此验证码告知他人{xx}
	 */
	UMS_202("202", "您的手机动态验证码为{}，请勿将此验证码告知他人。"),

	/**
	 * #3、客户付款（脸谱，超管家都要）2031012004948
	 * [浙江脸谱]尊敬的老板，您店内的订单##客户已付款，请尽快安排发货，具体请登录刷脸App查看详情。
	 */
	UMS_203("203", "尊敬的老板，您店内的订单{}客户已付款，请尽快安排发货，具体请登录刷脸App查看详情。"),

	/**
	 * #4、卖家发货2031012004949 
	 * [浙江脸谱]尊敬的用户，您的订单##卖家已发货，具体请下载刷脸App查看详情。
	 */
	UMS_204("204", "尊敬的用户，您的订单{}卖家已发货，具体请下载刷脸App查看详情。"),

	/**
	 * #5、卖家，预定成功2031012004950
	 * #尊敬的老板，您店内发起的#arg0#预定活动，有新客户成功预定，请尽快安排处理，具体详情请登录bossir平台查看。
	 */
	UMS_205("205", "尊敬的老板，您店内发起的{}预定活动，有新客户成功预定，请尽快安排处理，具体详情请登录bossir平台查看。"),

	/**
	 * #7、买家，预定成功2031012004952 
	 * #您的预定订单号为#arg0#，卖家会尽快为您安排，请耐心等待，如有疑问请联系卖家：#arg1#。
	 */
	UMS_207("207", "您的预定订单号为{}，卖家会尽快为您安排，请耐心等待，如有疑问请联系卖家：{}。"),

	/**
	 * #8、买家，预约成功2031012004953 
	 * #您的预约订单号为#arg0#卖家会尽快为您安排，请耐心等待，如有疑问请联系卖家：#arg1#。
	 */
	UMS_208("208", "您的预约订单号为{}卖家会尽快为您安排，请耐心等待，如有疑问请联系卖家：{}。"),
	
	/**
	 * #9、买家付款发送短信
	 * [浙江脸谱]尊敬的用户，您的订单号为##，店家会尽快处理，具体请下载刷脸App查看详情。
	 */
	UMS_209("209", "尊敬的用户，您的订单号为{}，店家会尽快处理，具体请下载刷脸App查看详情。"),
	/**
	 * #10、买家付款给买家发送短信 2031012010477
	 * [浙江脸谱]尊敬的用户，您的订单号为##，店家会尽快处理，您可以通过登录****** 或下载刷脸App查看详情。
	 */
	UMS_210("210", "尊敬的用户，您的订单号为{}，店家会尽快处理，您可以通过登录{} 或下载刷脸App查看详情。"),
	/**
	 * #11、卖家发货给买家发送短信 2031012010478
	 * [浙江脸谱]尊敬的用户，您的订单##卖家已发货，您可以通过登录****** 或下载刷脸App查看详情。
	 */
	UMS_211("211", "尊敬的用户，您的订单{}卖家已发货，您可以通过登录{} 或下载刷脸App查看详情。"),
	
	/**
	 * 微信用户
	 * [浙江脸谱]尊敬的用户，您的订单号为##，店家会尽快处理，您可以关注脸谱中国公众号（脸谱bestface）查看详情。
	 */
	UMS_212("212", "尊敬的用户，您的订单号为{}，店家会尽快处理，您可以关注脸谱中国公众号（脸谱bestface）查看详情。"),
	/**
	 * 微信用户
	 * [脸谱中国]尊敬的用户，您的订单##卖家已发货，您可以关注脸谱中国公众号（脸谱bestface）查看详情。
	 */
	UMS_213("213", "尊敬的用户，您的订单{}卖家已发货，您可以关注脸谱中国公众号（脸谱bestface）查看详情。"),
	
	/**
	 * 尊敬的用户，您于#arg0#申请的提现#arg1#已成功转入到#arg2#银行卡，卡号尾号为#arg3#中，请注意查收！
	 */
	UMS_106("106", "尊敬的用户，您于{}申请的提现{}已成功转入到{}银行卡，卡号尾号为{}中，请注意查收！"), 
	
	/**
	 * 尊敬的用户，您于#arg0#申请的提现#arg1#处理失败，请稍后再试或记录错误信息后咨询银行客服！
	 */
	UMS_107("107", "尊敬的用户，您于{}申请的提现{}处理失败，请稍后再试或记录错误信息后咨询银行客服！"), 
	
	/**
	 * 截止日期#arg0#，提现账户余额为#arg1#元，请及时充值！
	 */
	UMS_108("108", "截止日期{}，提现账户余额为{}元，请及时充值！"),
	
	;

	private String templateCode; // 短信模板
	private String content; // 短信内容

	private SmsContent(String templateCode, String content) {
		this.templateCode = templateCode;
		this.content = content;
	}

	public String getTemplateCode() {
		return templateCode;
	}

	public String getContent() {
		return content;
	}
}
