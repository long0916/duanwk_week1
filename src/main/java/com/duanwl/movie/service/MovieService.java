package com.duanwl.movie.service;

import com.github.pagehelper.PageInfo;
import com.duanwl.movie.domain.Movie;
import com.duanwl.movie.vo.MovieVO;

public interface MovieService {

	/**
	 * 
	 * @Title: selects 
	 * @Description: 电影的模糊查询
	 * @param movieVO  查询条件
	 * @param pageNum
	 * @param pageSize
	 * @return
	 * @return: PageInfo<Movie>
	 */
	PageInfo<Movie>  selects(MovieVO movieVO,Integer pageNum,Integer pageSize);
	
	int deleteBatch(Integer[] ids);
}
