package com.tech.ibara.my.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class PhotoAttachDto {

	private int pa_no;       
    private String pa_attach;   
    private int pb_no; 
    private String attachs;
    
    private PhotoBoardDto photoBoardDto;

	public PhotoAttachDto(int pa_no, String pa_attach, int pb_no, PhotoBoardDto photoBoardDto) {
		super();
		this.pa_no = pa_no;
		this.pa_attach = pa_attach;
		this.pb_no = pb_no;
		this.photoBoardDto = photoBoardDto;
	}

	public PhotoAttachDto(int pa_no, String pa_attach, int pb_no, String attachs, PhotoBoardDto photoBoardDto) {
		super();
		this.pa_no = pa_no;
		this.pa_attach = pa_attach;
		this.pb_no = pb_no;
		this.attachs = attachs;
		this.photoBoardDto = photoBoardDto;
	}
    
    
    
    
}
