package com.kh.portfolio.Ranking.dao;

import java.util.List;

import com.kh.portfolio.recipe.vo.RecipeVO;

public interface RankingDAO {

	/**
	 * 페이징을 위한 리스트 출력
	 * @param startRec
	 * @param endRec
	 * @return
	 */
	List<RecipeVO> list(int startRec, int endRec);
}
