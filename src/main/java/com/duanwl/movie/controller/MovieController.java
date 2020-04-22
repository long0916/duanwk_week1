package com.duanwl.movie.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.duanwl.movie.domain.Movie;
import com.duanwl.movie.service.MovieService;
import com.duanwl.movie.vo.MovieVO;

@Controller
public class MovieController {
	@Resource
	private MovieService movieService;
	
	
	@RequestMapping("selects")
	public String selects(Model model, MovieVO movieVO,@RequestParam(defaultValue = "1" )Integer pageNum,
			@RequestParam(defaultValue = "3" ) Integer pageSize) {
		PageInfo<Movie> info = movieService.selects(movieVO, pageNum, pageSize);
		model.addAttribute("info", info);//��װ��ѯ���
		model.addAttribute("movieVO", movieVO);//��װ��ѯ����
	
		return "movies";
		
	}
	
	
	@RequestMapping("deleteBatch")
	@ResponseBody
	public boolean deleteBatch(@RequestParam("ids[]")Integer[] ids) {
		return movieService.deleteBatch(ids)>0;
	}
	
	
	

}
