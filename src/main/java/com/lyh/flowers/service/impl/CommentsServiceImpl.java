package com.lyh.flowers.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lyh.flowers.dao.ICommentsDao;
import com.lyh.flowers.pojo.Comments;
import com.lyh.flowers.service.ICommentsService;

@Service("commentsService")
public class CommentsServiceImpl implements ICommentsService {
	@Resource
	private ICommentsDao commentsDao;
	
	@Override
	public void save(Comments comment) {
		commentsDao.add(comment);
	}

	@Override
	public List<Comments> findByFid(String fid) {
		
		return commentsDao.findByFid(fid);
	}
	
}
