package fdp.project.spring.service;

import java.util.List;

import fdp.project.spring.model.HospInfo;

public interface HospInfoService {

	  public List<HospInfo> getHospInfoList(HospInfo input) throws Exception;
	  
	  public HospInfo getHospInfo(HospInfo input) throws Exception;
	  /**
	     * 병원정보 데이터 등록하기
	     * @param Document 저장할 정보를 담고 있는 Beans
	     * @throws Exception
	     */
	  public int addHospInfo(List<HospInfo> input) throws Exception;
}
