package com.tech.ibara.oh.dto;

public class OHPhotoAttach {

	private int pa_no;       
    private String pa_attach;   
    private int pb_no; 
	
	public OHPhotoAttach() {
		// TODO Auto-generated constructor stub
	}

	public OHPhotoAttach(int pa_no, String pa_attach, int pb_no) {
		this.pa_no = pa_no;
		this.pa_attach = pa_attach;
		this.pb_no = pb_no;
	}

	public int getPa_no() {
		return pa_no;
	}

	public void setPa_no(int pa_no) {
		this.pa_no = pa_no;
	}

	public String getPa_attach() {
		return pa_attach;
	}

	public void setPa_attach(String pa_attach) {
		this.pa_attach = pa_attach;
	}

	public int getPb_no() {
		return pb_no;
	}

	public void setPb_no(int pb_no) {
		this.pb_no = pb_no;
	}
	
}
