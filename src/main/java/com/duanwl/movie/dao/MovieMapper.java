package com.duanwl.movie.dao;

import java.util.List;

import com.duanwl.movie.domain.Movie;
import com.duanwl.movie.vo.MovieVO;

public interface MovieMapper {

	
	
	List <Movie> selects(MovieVO movieVO);
	//����ɾ��
	int deleteBatch(Integer[] ids);
}
