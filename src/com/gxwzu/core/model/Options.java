package com.gxwzu.core.model;

import java.util.List;


public class Options {
	private Title title;
	private List<Series<String>> series;
	
	
	public Options(String title, List<Series<String>> series) {
		super();
		this.title = new Title(title);
		this.series = series;
	}
	public Title getTitle() {
		return title;
	}
	public void setTitle(Title title) {
		this.title = title;
	}
	public List<Series<String>> getSeries() {
		return series;
	}
	public void setSeries(List<Series<String>> series) {
		this.series = series;
	} 
	
	public class Title {
		private String text;

		public String getText() {
			return text;
		}

		public void setText(String text) {
			this.text = text;
		}

		public Title(String text) {
			super();
			this.text = text;
		}

	
		
		
	}
}

 

