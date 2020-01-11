package fdp.project.spring.model;


import lombok.Data;

@Data
public class Disease_age_gender {
	/** 테이블 구조에 맞춘 Java Beans 생성 */
		private int iddisease_age_gender;
		private String dis_year;
		private String dis_month;
		private String dis_name;
		private String dis_age;
		private String dis_gender;
		private int dis_cost;
		private int dis_num_patient;
		private int sum_cost;
		private int sum_num_patient;
}

