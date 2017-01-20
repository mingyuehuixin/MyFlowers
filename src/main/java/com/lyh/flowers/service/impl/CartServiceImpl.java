package com.lyh.flowers.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lyh.flowers.dao.ICartItemDao;
import com.lyh.flowers.pojo.CartItem;
import com.lyh.flowers.service.ICartService;


@Service("cartService")
public class CartServiceImpl implements ICartService {
	@Resource
	private ICartItemDao cartItemDao;
	
	@Override
	public List<CartItem> myCart(String uid) {
		
		return cartItemDao.findByUser(uid);
	}

	@Override
	public void delete(String cartItemId) {
		cartItemDao.delete(cartItemId);
	}

	@Override
	public CartItem updateQuantity(String cartItemId, String quantity) {
		cartItemDao.updateQuantity(cartItemId, quantity);
		return cartItemDao.findByCartItemId(cartItemId);
	}

	@Override
	public CartItem loadCartItem(String cartItemId) {
		return cartItemDao.loadCartItem(cartItemId);
	}

	@Override
	public void addCartItem(CartItem cartItem) {
		String fid=cartItem.getFlower().getFid();
		String uid=cartItem.getUser().getUid();
		CartItem _cartItem=cartItemDao.findByUidAndFid(uid, fid);
		if(_cartItem==null){
			String cartItemId=uid+fid;
			cartItemDao.addCartItem(cartItemId, "1", fid, uid);
		}
		else{
			int quantity = _cartItem.getQuantity()+1;
			cartItemDao.updateQuantity(_cartItem.getCartItemId(),String.valueOf(quantity));
		}
	}
	
}
