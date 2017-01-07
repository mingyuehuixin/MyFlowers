package com.lyh.flowers.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.lyh.flowers.pojo.Employee;
import com.lyh.flowers.service.IEmployeeService;

@Controller
@RequestMapping("/employeeM")
public class EmployeeMController {
	@Resource
	private IEmployeeService empService;
	@RequestMapping(value="/addEmployee",method={RequestMethod.POST})
	@ResponseBody//��ע�ⲻ��ʡ�ԣ�����ajax���ܵõ�����ֵ   @ModelAttribute("Employee") Employee tempemp,@Valid Employee emp
	public String addEmployeePost(HttpServletResponse response,HttpServletRequest request,Model model){
		Employee tempEmp =new Employee();
		tempEmp.setId(request.getParameter("empno")+"_upzsh");
		tempEmp.setEmpname(request.getParameter("empname"));
		tempEmp.setEmpno(request.getParameter("empno"));
		tempEmp.setEmail(request.getParameter("emaill"));
		tempEmp.setPassword(request.getParameter("password"));
		tempEmp.setSex(request.getParameter("sex"));
		tempEmp.setStatus(request.getParameter("status"));
		tempEmp.setPhonenumber(request.getParameter("phonenumber"));
		tempEmp.setIsadmin(request.getParameter("isadmin"));
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		tempEmp.setCreatetime(df.format(new Date(System.currentTimeMillis())));
		tempEmp.setLastupdatetime(df.format(new Date(System.currentTimeMillis())));
		//System.out.println(tempEmp.toString());
		//�Ӷ���
		//return "employeeM/addEmployee";
		//ModelAndView maAndView = new ModelAndView("redirect:/index.jsp");
		empService.insertEmployee(tempEmp);
		return "employeeM/addEmployee";
	}
	
	@RequestMapping(value="/addEmployeeCheck",method={RequestMethod.POST})
	@ResponseBody//��ע�ⲻ��ʡ�ԣ�����ajax���ܵõ�����ֵ   @ModelAttribute("Employee") Employee tempemp,@Valid Employee emp
	public String addEmployeeCheck(HttpServletResponse response,HttpServletRequest request,Model model){
		if(request.getParameter("email")!=null){
			if(empService.findByEmail(request.getParameter("email"))==null){
				return "1";
			}else{
				return "0";
			}
		}else if(request.getParameter("empno")!=null){
			if(empService.getEmployeeById(request.getParameter("empno")+"_upzsh")==null){
				return "1";
			}else{
				return "0";
			}
		}
		return "0";
	}
	
	@RequestMapping(value="/addEmployee",method=RequestMethod.GET)
	public String addEmployeeGet(@ModelAttribute("Employee") Employee tempemp,HttpServletRequest request){
		return "employeeM/addEmployee";
	}
	
	@RequestMapping("/deleteEmployees")
	public String deleteEmployees(HttpServletRequest request,Model model){
		String empno = request.getParameter("empno")+"_upzsh";
		empService.setStatuNA(empno);
		return "redirect:/employeeM/employeesList";
	}
	
	@RequestMapping("/editEmployees")
	public String editEmployees(HttpServletRequest request,Model model){
		String empno = request.getParameter("empno")+"_upzsh";
		if(empno!=null){
		Employee empEdit = empService.getEmployeeById(empno);
		model.addAttribute("empno_upzsh",empEdit.getEmpno());
		model.addAttribute("empmail_upzsh",empEdit.getEmail());
		model.addAttribute("editEmp",empEdit);
		}
		return "employeeM/editEmployees";
	}
	

	
	@RequestMapping("/queryEmployeesSubmit")
	public String queryEmployeesSubmit(HttpServletRequest request,Model model){
		String empname = request.getParameter("queryName");
		String email = request.getParameter("queryMail");
		int start=0;
		int limit=7;
		List<Employee> lEmps = empService.queryEmp(empname, email,start,limit);
		model.addAttribute("quert_empname",empname);
		model.addAttribute("quert_empmail",email);
        model.addAttribute("lEmps", lEmps);  
        model.addAttribute("limit", limit);
        model.addAttribute("start", start);
        model.addAttribute("page", (start/limit+1));
        model.addAttribute("allpage", Math.ceil(getQuertListCount(empname, email)/(float)Integer.valueOf(limit)));
        model.addAttribute("alllist", getQuertListCount(empname, email));
        System.out.println("empname="+empname+"email="+email);
		return "employeeM/employeesList";
	}
	
	@RequestMapping("/editEmployeesSubmit")
	public String editEmployeesSubmit(HttpServletRequest request,Model model){
		Employee tempEmp =new Employee();
		tempEmp.setId(request.getParameter("empno")+"_upzsh");
		tempEmp.setEmpname(request.getParameter("empname"));
		tempEmp.setEmpno(request.getParameter("empno"));
		tempEmp.setEmail(request.getParameter("emaill"));
		tempEmp.setPassword(request.getParameter("password"));
		tempEmp.setSex(request.getParameter("sex"));
		tempEmp.setStatus(request.getParameter("status"));
		tempEmp.setPhonenumber(request.getParameter("phonenumber"));
		tempEmp.setIsadmin(request.getParameter("isadmin"));
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Employee emp = empService.getEmployeeById(request.getParameter("empno")+"_upzsh");
		if(emp!=null){
			tempEmp.setCreatetime(emp.getCreatetime());
		}else{
			tempEmp.setCreatetime(df.format(new Date(System.currentTimeMillis())));
		}
		tempEmp.setLastupdatetime(df.format(new Date(System.currentTimeMillis())));
		empService.updateByEmployee(tempEmp);
		
		
		
		//return employeesList(request,model);
        //return employeesList(request,model);
		return "redirect:/employeeM/employeesList";
	}
	
	@RequestMapping("/employeesList")
	public String employeesList(HttpServletRequest request,Model model){		
		int start=0;
		int limit=7;
        List<Employee> lEmps = this.empService.getEmpsListBylimit(start, limit); 
        model.addAttribute("lEmps", lEmps);  
        model.addAttribute("limit", limit);
        model.addAttribute("start", start);
        model.addAttribute("page", (start/limit+1));
        model.addAttribute("allpage", Math.ceil(getListCount()/(float)Integer.valueOf(limit)));
        model.addAttribute("alllist", getListCount());

		return "employeeM/employeesList";
	}
	

	@RequestMapping(value="/allEmpsListByLimit",method=RequestMethod.POST)
	public String allBooksListLimit(HttpServletRequest request,Model model){
		String start=request.getParameter("start");
		String limit=request.getParameter("limit");
		List<Employee> emps;
		if(Integer.valueOf(start)<0){
			//????????
	        start="0";
	        model.addAttribute("page", 1);
	        model.addAttribute("start", start);
	        emps = this.empService.getEmpsListBylimit(Integer.valueOf(start), Integer.valueOf(limit)); 

		}
		else if((Integer.valueOf(start)-Integer.valueOf(limit))>=(getListCount()-Integer.valueOf(limit))){
			//??
			start=(Integer.valueOf(start)-2*Integer.valueOf(limit))+"";
	        model.addAttribute("page", Integer.valueOf(start)/Integer.valueOf(limit)+2);
	        model.addAttribute("start", Integer.valueOf(start)+Integer.valueOf(limit));
	        emps = this.empService.getEmpsListBylimit(Integer.valueOf(start)+Integer.valueOf(limit), Integer.valueOf(limit)); 
		}else {
	        model.addAttribute("page", Integer.valueOf(start)/Integer.valueOf(limit)+1);
	        model.addAttribute("start", start);
	        emps = this.empService.getEmpsListBylimit(Integer.valueOf(start), Integer.valueOf(limit)); 

		}
        model.addAttribute("lEmps", emps);
        model.addAttribute("limit", limit);
        model.addAttribute("allpage", Math.ceil(getListCount()/(float)Integer.valueOf(limit)));
        model.addAttribute("alllist", getListCount());

        return "employeeM/employeesList";
	}
	
	@RequestMapping(value="/allEmpsQuertListByLimit",method=RequestMethod.POST)
	public String allEmpsQuertListByLimit(HttpServletRequest request,Model model){
		String start=request.getParameter("start");
		String limit=request.getParameter("limit");
		System.out.println("start="+start+"limit="+limit);
		String quert_empname=request.getParameter("quert_empname");
		String quert_empemail=request.getParameter("quert_empemail");
		//System.out.println(quert_empemail+"--"+quert_empname+"--"+getQuertListCount(quert_empname, quert_empemail));
		List<Employee> emps;
		int quert_size = getQuertListCount(quert_empname, quert_empemail);
		System.out.println(quert_empname+"----"+quert_size);
		if(Integer.valueOf(start)<0){
			//????????
	        start="0";
	        model.addAttribute("page", 1);
	        model.addAttribute("start", start);
	        emps = this.empService.queryEmp(quert_empname,quert_empemail,Integer.valueOf(start), Integer.valueOf(limit)); 
		}
		else if((Integer.valueOf(start)-Integer.valueOf(limit))>=(quert_size-Integer.valueOf(limit))){
			//??
			start=(Integer.valueOf(start)-2*Integer.valueOf(limit))+"";
	        model.addAttribute("page", Integer.valueOf(start)/Integer.valueOf(limit)+2);
	        model.addAttribute("start", Integer.valueOf(start)+Integer.valueOf(limit));
	        emps = this.empService.queryEmp(quert_empname,quert_empemail,Integer.valueOf(start)+Integer.valueOf(limit), Integer.valueOf(limit)); 
		}else {
	        model.addAttribute("page", Integer.valueOf(start)/Integer.valueOf(limit)+1);
	        model.addAttribute("start", start);
	        emps = this.empService.queryEmp(quert_empname,quert_empemail,Integer.valueOf(start), Integer.valueOf(limit)); 

		}
		//System.out.println(emps.toString());
		model.addAttribute("quert_empname",quert_empname);
		model.addAttribute("quert_empmail",quert_empemail);
        model.addAttribute("lEmps", emps);
        model.addAttribute("limit", limit);
        model.addAttribute("allpage", Math.ceil(quert_size/(float)Integer.valueOf(limit)));
        model.addAttribute("alllist", quert_size);

        return "employeeM/employeesList";
	}


	public  int getListCount(){
		return this.empService.getAllEmp().size();
	} 
	
	public  int getQuertListCount(String empname,String email){
		return this.empService.queryEmp(empname, email, 0, Integer.MAX_VALUE).size();
	} 
	
}
