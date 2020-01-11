package fdp.project.spring.model;

import lombok.Data;

@Data
public class DiseaseRegion {
	private int id;
	private String disMomth;
	private String disName;
	private String disRegion;
	private int disNumPatient;
	private int disCost;
	private long patientSum;
	private long costSum;
	private String disYear;
}
