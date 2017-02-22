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
		flowerDao.delete(fid);
	}

	@Override
	public void edit(Flower flower) {
		
		flowerDao.edit(flower);
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
		
		pb.setBeanList(flowerList);
		pb.setPc(pc);
		pb.setPs(ps);
		pb.setTr(count);
		
		return pb;
	}

	@Override
	public PageBean<Flower> findByType(String pid, String cname,String cid, int pc) {
		String material="-1",target="-1",type="-1",branchnumber="-1",flowercolor="-1",makeuse="-1";
		int minprice=0,maxprice=0;
		boolean flag=true;
		switch (pid) {
		case "1": makeuse=cname;
			break;
		case "2":material=cname;
			break;
		case "3":
			flag=false;
			switch (cname) {
				case "100-200元":
					minprice=100;
					maxprice=200;
					break;
				case "200-300元":
					minprice=200;
					maxprice=300;
					break;
				case "300-500元":
					minprice=300;
					maxprice=500;
					break;
				case "500-800元":
					minprice=500;
					maxprice=800;
					break;
				case "800元以上":
					minprice=800;
					maxprice=10000;
					break;
				}
			break;
		case "4":target=cname;
			break;
		case "5":branchnumber=cname;
			break;
		case "6":flowercolor=cname;
			break;
		case "7":type=cname;
			break;
		}
		int ps = 12;//每页记录数
		int count=findFlowerCountByCategory(cid);//鲜花总记录数
		
		List<Flower> flowerList;
		if(flag){
			flowerList=flowerDao.findByType(material,target,branchnumber,flowercolor,makeuse,type,(pc-1)*ps, ps);
		}else{
			flowerList=flowerDao.findByPrice(minprice, maxprice,  (pc-1)*ps, ps);
		}
		PageBean<Flower> pb = new PageBean<Flower>();
		
		pb.setBeanList(flowerList);
		pb.setPc(pc);
		pb.setPs(ps);
		pb.setTr(count);
		
		return pb;
	}

	@Override
	public void add(Flower flower) {
		
		flowerDao.add(flower.getFid(), flower.getFname(), flower.getMaterial(), flower.getPrice(),
				flower.getCurrPrice(), flower.getDiscount(), flower.getFlowersaying(), flower.getPacking(),
				flower.getTarget(), flower.getBranchnumber(), flower.getFlowercolor(), flower.getType(), 
				flower.getMakeuse(), flower.getCid(), flower.getImage_w(), flower.getImage_b());
	}

	@Override
	public PageBean<Flower> seachByKeyWord(String keyword, int pc) {
		int ps = 12;//每页记录数
		int count=flowerDao.findCount(keyword, keyword,keyword);//鲜花总记录数
		
		List<Flower> flowerList= flowerDao.findBySeachKey(keyword, keyword,keyword, (pc-1)*ps, ps);
		PageBean<Flower> pb = new PageBean<Flower>();
		
		pb.setBeanList(flowerList);
		pb.setPc(pc);
		pb.setPs(ps);
		pb.setTr(count);
		
		return pb;
	}

	
}
