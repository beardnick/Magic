package com.magic;

import java.io.IOException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import com.db.magic.Dbase;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class showThree extends ActionSupport {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;
	private String chr;
	private String start;
	private String end;
	private String gene;
	private String search;

	public String getWebClassesPath() {
		String path = getClass().getProtectionDomain().getCodeSource().getLocation().getPath();
		return path;
	}

	public String getWebRoot() {
		String path = getWebClassesPath();
		if (path.indexOf("WEB-INF") > 0) {
			path = path.substring(0, path.indexOf("WEB-INF/classes"));
		}
		return path;
	}

	public String execute() {

		System.out.println(chr);
		System.out.println(start);
		System.out.println(end);
		System.out.println(gene);
		System.out.println(search);
		Map<String, Object> attributes = ActionContext.getContext().getSession();

		System.out.println(attributes.get("trait"));

		int traitlen = (Integer) attributes.get("traitlen");

		String[] traitArray = (String[]) attributes.get("traitArray");

		for (int i = 0; i < traitlen; i++) {
			System.out.println("traitArray " + i + " is " + traitArray[i]);
		}

		attributes.put("search", search);
		String sql;

		Dbase d = new Dbase();

		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, String> startEndMap;
		String sql1 = "";
		for (int i = 0; i < traitlen; i++) {
			if (i == traitlen - 1) {
				sql1 = sql1 + "trait = '" + traitArray[i];
			} else {
				sql1 = sql1 + "trait = '" + traitArray[i] + "' or ";
			}
		}
		if (search.equals("first")) {
			sql = "select chr,pos,trait,snp,p from MAGIC_all_sig_SNP where chr='" + chr + "'AND  pos BETWEEN " + start
					+ " AND " + end + " AND (";
			sql += sql1;
			sql += "')";
			System.out.println(sql);

		} else {
			sql = "select snp,allele,gene,transcript,annotation from sig_snp_annotation where gene='" + gene + "'";
			System.out.println(sql);
			startEndMap = d.getStartEnd(gene);
			start = startEndMap.get("start");
			end = startEndMap.get("end");
		}

		String path = getWebRoot();
		path = path.substring(1, path.length());
		path = path + "py_scripts/";
		String driver = path.substring(0, path.indexOf('/'));
		System.out.println(path);
		Runtime rt = Runtime.getRuntime();
		try {
			String tmp = " cmd /c " + driver + " && cd " + path + " &&  " + driver + " &&  python " + path
					+ "chromesome.py " + start + " " + end + " " + chr + " " + "\""+ sql1 + "\"";
			System.out.println(tmp);
			rt.exec(tmp).waitFor();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		map = (HashMap<String, Object>) d.getChr(sql);
		attributes.put("len", map.get("len"));
		attributes.put("data", map.get("data"));

		d.Close();
		return SUCCESS;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getChr() {
		return chr;
	}

	public void setChr(String chr) {
		this.chr = chr;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public String getGene() {
		return gene;
	}

	public void setGene(String gene) {
		this.gene = gene;
	}

}
