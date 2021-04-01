package com.kh.portfolio.Ranking.svc;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kh.portfolio.common.paging.PageCriteria;
import com.kh.portfolio.recipe.dao.RecipeDAO;
import com.kh.portfolio.recipe.vo.RecipeVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class RankingSVCImpl implements RankingSVC {
	
	final RecipeDAO recipeDAO;
	final PageCriteria pc;
	/**
	 * 페이징을 위한 리스트 출력
	 * @param startRec
	 * @param endRec
	 * @return
	 */
	@Override
	public Map<String, Object> list(int reqPage) {
		Map<String, Object> map = new HashMap<>();
		//1) 요청페이지- reqPage는 내가 누르는 번호이다.
		pc.getRc().setReqPage(reqPage); //메서드를 통해 값이 생성된다.
		//2) 총 레코드 정보
		pc.setTotalRec(recipeDAO.totalRecordCount());
		//3) 페이징계산
		pc.calculatePaging();
		//4) 목록 가져오기
		int startRec 	= pc.getRc().getStartRec();
		int endRec 		= pc.getRc().getEndRec();
		List<RecipeVO> list = recipeDAO.list(startRec, endRec);
		//5)map객체에 게시글 목록, pc담기
		map.put("recipeList", list);
		map.put("pc",pc);

		return map;
	}
}
