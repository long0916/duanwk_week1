package com.duanwl.movie.service;

import com.github.pagehelper.PageInfo;
import com.duanwl.movie.domain.Movie;
import com.duanwl.movie.vo.MovieVO;

public interface MovieService {

	/**
	 * 
	 * @Title: selects 
	 * @Description: ��Ӱ��ģ����ѯ
	 * @param movieVO  ��ѯ����
	 * @param pageNum
	 * @param pageSize
	 * @return
	 * @return: PageInfo<Movie>
	 */
	PageInfo<Movie>  selects(MovieVO movieVO,Integer pageNum,Integer pageSize);
	
	int deleteBatch(Integer[] ids);
}
