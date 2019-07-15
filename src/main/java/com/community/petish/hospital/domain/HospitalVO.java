package com.community.petish.hospital.domain;

public class HospitalVO {
	private int id;
	private String hospital_name;
	private String hospital_addr;
	private String hospital_phone;
	private String hospital_hours;
	private String hospital_website;
	private String hospital_img;
	private boolean isParking;
	private boolean isEmergency;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getHospital_name() {
		return hospital_name;
	}
	public void setHospital_name(String hospital_name) {
		this.hospital_name = hospital_name;
	}
	public String getHospital_addr() {
		return hospital_addr;
	}
	public void setHospital_addr(String hospital_addr) {
		this.hospital_addr = hospital_addr;
	}
	public String getHospital_phone() {
		return hospital_phone;
	}
	public void setHospital_phone(String hospital_phone) {
		this.hospital_phone = hospital_phone;
	}
	public String getHospital_hours() {
		return hospital_hours;
	}
	public void setHospital_hours(String hospital_hours) {
		this.hospital_hours = hospital_hours;
	}
	public String getHospital_website() {
		return hospital_website;
	}
	public void setHospital_website(String hospital_website) {
		this.hospital_website = hospital_website;
	}
	public String getHospital_img() {
		return hospital_img;
	}
	public void setHospital_img(String hospital_img) {
		this.hospital_img = hospital_img;
	}
	public boolean isParking() {
		return isParking;
	}
	public void setParking(boolean isParking) {
		this.isParking = isParking;
	}
	public boolean isEmergency() {
		return isEmergency;
	}
	public void setEmergency(boolean isEmergency) {
		this.isEmergency = isEmergency;
	}
	
}
