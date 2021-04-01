package com.kh.portfolio.search;

import java.util.List;


import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.kh.portfolio.recipe.vo.RecipeVO;
import com.kh.portfolio.search.dao.SearchDAO;

import lombok.extern.slf4j.Slf4j;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/*.xml" })
@Slf4j
public class SearchDAOImplTest {

	@Autowired
	SearchDAO searchDAO;
	@Autowired
	
	@Test
	@DisplayName("검색 리스트 출력")
//	@Disabled
	void searchlist() {
		String keyword = "ㄴㅇㄹㄴㅇㄹ";
		
		
		
		log.info("레시피 리스트는?"+searchDAO.searchList(keyword));
		log.info("재료 리스트는?"+searchDAO.searchMaterialList(keyword));
	}
}
