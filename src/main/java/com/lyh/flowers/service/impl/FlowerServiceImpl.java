package com.lyh.flowers.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lyh.flowers.dao.IFlowerDao;
import com.lyh.flowers.pojo.Flower;
import com.lyh.flowers.pojo.PageBean;
import com.lyh.flowers.service.IFlowerService;


@Service("flowerService")
public class FlowerServiceImpl implements IFlowerService {
	@Resource
	private IFlowerDao flowerDao;
	
	@Override
	public void delete(String fid) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void edit(Flower flower) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Flower findByFid(String fid) {

		return flowerDao.findByFid(fid);
	}

	@Override
	public int findFlowerCountByCategory(String cid) {
		int count=flowerDao.findFlowerCountByCategory(cid);
		return count;
	}

	@Override
	public PageBean<Flower> findByCategory(String cid, int pc) {
		int ps = 12;//每页记录数
		int count=findFlowerCountByCategory(cid);//鲜花总记录数
		
		List<Flower> flowerList=flowerDao.findByCategory(cid, (pc-1)*ps, ps);
		
		PageBean<Flower> pb = new PageBean<Flower>();
		for(Flower fl:flowerList){
			System.out.println(fl.getImage_b());
		}
		
		pb.setBeanList(flowerList);
		pb.setPc(pc);
		pb.setPs(ps);
		pb.setTr(count);
		
		return pb;
	}
	
}
