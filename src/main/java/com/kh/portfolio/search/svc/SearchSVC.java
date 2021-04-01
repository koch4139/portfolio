package com.kh.portfolio.search.svc;

import java.util.Map;

	public interface SearchSVC {
	
		/**
		 * 검색된 레시피 및 재료 넘겨준다.
		 * @param keyword
		 * @return
		 */
		Map<String, Object> searchList(String keyword);
		
	
}
