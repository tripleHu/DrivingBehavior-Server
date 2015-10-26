package com.triple.DrivingBehavior.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="User")
public class User
{
	//自动增长的逻辑主键
	@Id
	@GeneratedValue
	private long id;
	//UserName用户名
	@Column(length=100,nullable=false,unique=true)
	private String UserName;
	//密码
	@Column(length=100,nullable=false,unique=false)
	private String Code;
	/*//级联用ALL  
	@OneToMany(mappedBy="group",cascade=(CascadeType.ALL))
	private Set<DrivingInfo> info= new HashSet<DrivingInfo>();  */
	//get set方法
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String userName) {
		this.UserName = userName;
	}
	public String getCode() {
		return Code;
	}
	public void setCode(String code) {
		this.Code = code;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	/*public Set<DrivingInfo> getDrivinginfo() {
		return info;
	}
	public void setDrivinginfo(Set<DrivingInfo> info) {
		this.info = info;
	}
	/**   
     *该方法用于向User中加DrivingInfo项   
    **/
	/*public void addDrivinginfo(DrivingInfo drivinginfo){   
		drivinginfo.setUser(this);//用关系维护端来维护关系   
        this.info.add(drivinginfo);   
    }   */
	
}