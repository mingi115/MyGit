package fdp.project.spring.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fdp.project.spring.model.EmRoom;
import fdp.project.spring.service.ErInfoService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ErInfoServiceImpl implements ErInfoService{
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void setErInfoList(List<EmRoom> input) throws Exception {
		int result = 0;
		for(EmRoom aa : input) {
			try {
				result = sqlSession.insert("ErInfoMapper.insertItem", aa);

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
			log.debug("응급실 상황이 업데이트 되었습니다.");
		}		
		
	}

	@Override
	public List<EmRoom> getErInfoList() throws Exception {
		List<EmRoom> output = null;
		
		output = sqlSession.selectList("ErInfoMapper.selectList");
		
		return output;
	}
	
	@Override
	public List<EmRoom> getErGraph(EmRoom emRoom) throws Exception {
		List<EmRoom> output = null;
		
		output = sqlSession.selectList("ErInfoMapper.selectEr", emRoom);
		
		return output;
	}

	@Override
	public void byeErInfoList() throws Exception {
		
		sqlSession.delete("ErInfoMapper.deleteList");
	}

}
