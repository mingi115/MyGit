package fdp.project.spring.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fdp.project.spring.model.Count;
import fdp.project.spring.service.CountService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CountServiceImpl implements CountService {
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<Count> getAgeCount(Count input) throws Exception {
		List<Count> result = null;

		try {
			result = sqlSession.selectList("CountMapper.selectCountAge", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public List<Count> getAddrCount(Count input) throws Exception {
		List<Count> result = null;

		try {
			result = sqlSession.selectList("CountMapper.selectCountAddr", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}
	
	@Override
	public List<Count> getGenderCount(Count input) throws Exception {
		List<Count> result = null;

		try {
			result = sqlSession.selectList("CountMapper.selectCountGender", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}
	
	@Override
	public List<Count> getAgeGenderCount(Count input) throws Exception {
		List<Count> result = null;

		try {
			result = sqlSession.selectList("CountMapper.selectCountAgeGender", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}
	
	@Override
	public List<Count> getDoctorCount(Count input) throws Exception {
		List<Count> result = null;

		try {
			result = sqlSession.selectList("CountMapper.selectCountDoctor", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}
}
