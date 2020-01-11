package fdp.project.spring.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fdp.project.spring.model.DiseaseRegion;
import fdp.project.spring.service.DiseaseRegionService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class DiseaseRegionServiceImpl implements DiseaseRegionService {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<DiseaseRegion> getDisByRegion(DiseaseRegion input) throws Exception {
		List<DiseaseRegion> result=null;
		
		try {
			result = sqlSession.selectList("DiseaseRegionMapper.selectList", input);
				if (result == null) {
					throw new NullPointerException("result=null");
				}
			} catch (NullPointerException e) {
				log.error(e.getLocalizedMessage());
				throw new Exception("조회된 데이터가 없습니다.");
			} catch (Exception e) {
				log.error(e.getLocalizedMessage());
				throw new Exception("데이터 조회에 실패했습니다");
			}
		return result;
	}

}
