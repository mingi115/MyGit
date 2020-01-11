package fdp.project.spring.service;

import java.util.List;

import fdp.project.spring.model.Count;

public interface CountService {

	public List<Count> getAgeCount(Count input) throws Exception;
	
	public List<Count> getAddrCount(Count input) throws Exception;
	
	public List<Count> getGenderCount(Count input) throws Exception;
	
	public List<Count> getAgeGenderCount(Count input) throws Exception;
	
	public List<Count> getDoctorCount(Count input) throws Exception;
}
