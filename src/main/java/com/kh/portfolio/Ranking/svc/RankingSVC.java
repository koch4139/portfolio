package com.kh.portfolio.Ranking.svc;

import java.util.Map;

public interface RankingSVC {

	/**
	 * 페이징을 위한 리스트 출력
	 * @param startRec
	 * @param endRec
	 * @return
	 */
	Map<String, Object> list(int reqPage);
}
