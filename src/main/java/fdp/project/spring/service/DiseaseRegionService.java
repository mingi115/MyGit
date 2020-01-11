package fdp.project.spring.service;

import java.util.List;

import fdp.project.spring.model.DiseaseRegion;

public interface DiseaseRegionService {
	public List<DiseaseRegion> getDisByRegion(DiseaseRegion input) throws Exception;
}
