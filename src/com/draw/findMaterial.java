package com.draw;

import java.io.IOException;
import java.io.PrintWriter;

import org.apache.struts2.ServletActionContext;

import com.db.magic.Dbase;
import com.opensymphony.xwork2.ActionSupport;

public class findMaterial extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String pop;
    
	public String execute(){
		System.out.println("your pop is " +pop);
		
		String sql = "select name from  bin_summary_maxp2 where pop = '"+pop+"'";
		PrintWriter writer = null;
		Dbase d = new Dbase();
        String  result  = d.test(sql);
        System.out.println(result);
		try {
			writer = ServletActionContext.getResponse().getWriter();
			writer.write(result);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		d.Close();
		return null;
	}
	
	
	
	public String getPop() {
		return pop;
	}

	public void setPop(String pop) {
		this.pop = pop;
	}
}
