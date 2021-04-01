package com.kh.portfolio.search.svc;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kh.portfolio.search.dao.SearchDAO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SearchSVCImpl implements SearchSVC {

	final SearchDAO searchDAO;
	
	/**
	 * 검색된 레시피 및 재료 재료들을 넘겨줌
	 */
	public Map<String, Object> searchList(String keyword){
		Map<String, Object> map = new HashMap<>();
		//레시피 리스트 넘겨줌
		map.put("recipeList", searchDAO.searchList(keyword));
		map.put("materialList", searchDAO.searchMaterialList(keyword));
		return map;
	}
}

