/**
 * 
 */
/**
 * @author xinwang
 *
 */
package jbrowse;


import java.io.IOException;
import java.io.PrintWriter;

import org.apache.struts2.ServletActionContext;

import com.db.magic.Dbase;
import com.opensymphony.xwork2.ActionSupport;

public class jbrowse extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String geneid;
    
	public String execute(){
		System.out.println("your geneid is " +geneid);
		
		String sql = "select chr,start,end from  zmb73_annotation_combined where ID = '"+geneid+"'";
		PrintWriter writer = null;
		Dbase d = new Dbase();
        String  result  = d.jbtest(sql);
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
	
	
	
	public String getGeneid() {
		return geneid;
	}

	public void setGeneid(String geneid) {
		this.geneid = geneid;
	}
}
