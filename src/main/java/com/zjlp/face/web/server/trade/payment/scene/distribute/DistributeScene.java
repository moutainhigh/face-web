package com.zjlp.face.web.server.trade.payment.scene.distribute;

import com.zjlp.face.account.exception.PaymentException;
import com.zjlp.face.web.server.trade.payment.domain.dto.DistributeDto;
import com.zjlp.face.web.server.trade.payment.domain.dto.FeeDto;
/**
 * 金额分配接口
* @ClassName: DistributeScene 
* @Description: TODO(这里用一句话描述这个类的作用) 
* @author phb 
* @date 2015年3月20日 下午2:56:41 
*
 */
public interface DistributeScene {

	DistributeDto calculation(FeeDto feeDto,Long amount) throws PaymentException;
}
