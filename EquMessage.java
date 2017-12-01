package org.auts.bean;

public class EquMessage {
	private int id;
	private String name;
	private String price;
	private String model;
	private String date;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	
    public String getModel() {
    	return model;
    }
	
	public void setModel(String model) {
		this.model = model;
	}
	
	public String getDate() {
		return date;
	}
	
	public void setDate(String date) {
		this.date = date;
	}
}
