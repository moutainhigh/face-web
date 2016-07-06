package com.zjlp.face.web.server.product.im.service;

import java.util.List;

import com.zjlp.face.web.server.product.im.domain.ImFriends;
import com.zjlp.face.web.server.product.im.domain.dto.ImFriendsDto;
/**
 * IM好友基础服务
 * @ClassName: ImFriendsService 
 * @Description: (这里用一句话描述这个类的作用) 
 * @author dzq
 * @date 2014年10月10日 上午10:36:20
 */
public interface ImFriendsService {
	/**
	 * 新增好友
	 * @Title: addImFriends 
	 * @Description: (这里用一句话描述这个方法的作用) 
	 * @param imFriends
	 * @date 2014年10月10日 上午10:36:44  
	 * @author dzq
	 */
	void addImFriends(ImFriends imFriends);
	
	/**
	 * 修改好友信息
	 * @Title: editImFriends 
	 * @Description: (这里用一句话描述这个方法的作用) 
	 * @param imFriends
	 * @date 2014年10月10日 上午10:38:06  
	 * @author dzq
	 */
	void editImFriends(ImFriends imFriends);
	
	/**
	 * 删除好友
	 * @Title: deleteFriends 
	 * @Description: (这里用一句话描述这个方法的作用) 
	 * @param id
	 * @date 2014年10月10日 上午10:37:32  
	 * @author dzq
	 */
	void deleteFriends(Long id);
	/**
	 * 查询我的好友
	 * @Title: findFriendsListByUserId 
	 * @Description: (这里用一句话描述这个方法的作用) 
	 * @param imUserId
	 * @return
	 * @date 2014年10月13日 下午2:19:02  
	 * @author dzq
	 */
	List<ImFriends> findFriendsListByUserId(Long imUserId);
	
	/**
	 * 查询我的好友
	 * @Title: findFriendsDtoListByUserId 
	 * @Description: (这里用一句话描述这个方法的作用) 
	 * @param imUserId
	 * @return
	 * @date 2014年10月14日 上午10:44:44  
	 * @author Administrator
	 */
	List<ImFriendsDto> findFriendsDtoListByUserId(Long imUserId);
	
	/**
	 * 根据好友查询记录条数
	 * @Title: getCountByFriends 
	 * @Description: (这里用一句话描述这个方法的作用) 
	 * @param imFriends
	 * @return
	 * @date 2014年10月18日 下午2:17:37  
	 * @author Administrator
	 */
	Integer getCountByFriends(ImFriends imFriends);

	/**
	 * 
	 * @Title: countIsFriend 
	 * @Description: 判断是否是好友
	 * @param loginAccount
	 * @param toFindLoginAccount
	 * @return
	 * @date 2015年8月27日 上午10:37:28  
	 * @author cbc
	 */
	Integer countIsFriend(String loginAccount, String toFindLoginAccount);
}
