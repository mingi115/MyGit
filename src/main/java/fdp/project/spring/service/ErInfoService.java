package fdp.project.spring.service;

import java.util.List;

import fdp.project.spring.model.EmRoom;

public interface ErInfoService {

	  public void setErInfoList(List<EmRoom> input) throws Exception;
	  
	  public List<EmRoom> getErInfoList() throws Exception;
	  
	  public void byeErInfoList() throws Exception;
	  
	  public List<EmRoom> getErGraph(EmRoom emRoom) throws Exception;
	  
}
