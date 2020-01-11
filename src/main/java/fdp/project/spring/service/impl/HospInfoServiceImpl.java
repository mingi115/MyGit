package fdp.project.spring.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fdp.project.spring.model.HospInfo;
import fdp.project.spring.service.HospInfoService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class HospInfoServiceImpl implements HospInfoService {
	/** MyBatis */
	// -> import org.apache.ibatis.session.SqlSession
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<HospInfo> getHospInfoList(HospInfo input) throws Exception {
		List<HospInfo> result = null;
		try {
			result = sqlSession.selectList("HospInfoMapper.selectList", input);

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
	@Override
	public HospInfo getHospInfo(HospInfo input) throws Exception {
		HospInfo result = null;
		try {
			result = sqlSession.selectOne("HospInfoMapper.gettime", input);

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
	@Override
	public int addHospInfo(List<HospInfo> input) throws Exception {
		int result = 0;
		for(HospInfo aa : input) {
			try {
				result = sqlSession.insert("HospInfoMapper.insertItem", aa);

				if (result == 0) {
					throw new NullPointerException("result=0");
				}
			} catch (NullPointerException e) {
				log.error(e.getLocalizedMessage());
				throw new Exception("저장된 데이터가 없습니다.");
			} catch (Exception e) {
				log.error(e.getLocalizedMessage());
				throw new Exception("데이터 저장에 실패했습니다.");
			} 
		}
		return result;
	}

	
	
}
