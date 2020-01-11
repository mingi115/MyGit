package fdp.project.spring.model;

import lombok.Data;

@Data
public class NFile {

	/** 첨부파일 번호(PK) */
	private int file_id;
	/** 첨부파일 원본 이름 */
	private String originName;
	/** 첨부파일 이름 */
	private String fileName;
	/** 첨부파일 경로 */
	private String filePath;
	/** 첨부파일 확장자명 */
	private String contentType;
	/** 첨부파일 크기 */
	private long fileSize;
	/** 게시글 번호 */
	private int document_id;
	
	private String fieldName;

	
}
